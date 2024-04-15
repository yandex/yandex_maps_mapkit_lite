import 'package:meta/meta.dart';
import 'package:ffi/ffi.dart';

import 'dart:ffi';
import 'dart:isolate';
import 'library.dart';

final void Function(Pointer<Void>) _executeWork = library
    .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_native_executeWork')
    .asFunction();

final void Function(Pointer<Void>) _executeAsyncEvent = library
    .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_native_executeAsyncEvent')
    .asFunction();

final _isolateReceivePort = ReceivePort()..listen(_notifyHandler);

void _notifyHandler(dynamic data) {
  final int workAddress = data;
  final work = Pointer<Void>.fromAddress(workAddress);

  _executeWork(work);
}

@internal
int createExecutePort() {
  return _isolateReceivePort.sendPort.nativePort;
}

@internal
int createPortWithCallback(void Function(dynamic) callback) {
  final port = ReceivePort()..listen(callback);
  return port.sendPort.nativePort;
}

final _isolateAsyncReceivePort = ReceivePort()..listen(_asyncNotifyHandler);

void _asyncNotifyHandler(dynamic data) {
  final event = Pointer<Void>.fromAddress(data as int);

  _executeAsyncEvent(event);
}

@internal
int createAsyncExecutePort() {
  return _isolateAsyncReceivePort.sendPort.nativePort;
}

final class AsyncCallbackData extends Struct {
  @Int()
  external int command;
  external Pointer<Void> nativeObject;
  external Pointer<Void> nativeData;
}

const _DestructPlatformObjectAndFreeCallbackData = 0;
const _GetPlatformObjectData = 1;

abstract class AsyncDispatcherHeap<T> {
  final Map<Pointer<Void>, T> _heap = {};
  final ReceivePort _port = ReceivePort();

  AsyncDispatcherHeap() {
    _port.listen(_handler);
  }

  void requestData(T object, Pointer<Void> nativeData);

  void onHandlerException(
      T object, Pointer<Void> nativeData, Object e, StackTrace stackTrace);

  int get sendPort => _port.sendPort.nativePort;

  void _removeObject(Pointer<Void> nativeObject) {
    _heap.remove(nativeObject);
  }

  void insertObject(Pointer<Void> nativeObject, T platformObject) {
    _heap[nativeObject] = platformObject;
  }

  T findObject(Pointer<Void> nativeObject) {
    return _heap[nativeObject]!;
  }

  void _handler(dynamic data) {
    final dataPtr = Pointer<AsyncCallbackData>.fromAddress(data as int);
    final callbackData = dataPtr.ref;

    switch (callbackData.command) {
      case _DestructPlatformObjectAndFreeCallbackData:
        _removeObject(callbackData.nativeObject);
        malloc.free(dataPtr);
        break;
      case _GetPlatformObjectData:
        try {
          requestData(
              _heap[callbackData.nativeObject]!, callbackData.nativeData);
        } catch (e, stack) {
          onHandlerException(_heap[callbackData.nativeObject]!,
              callbackData.nativeObject, e, stack);
        }
        break;
      default:
        assert(false);
    }
  }
}
