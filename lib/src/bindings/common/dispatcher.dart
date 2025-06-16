import 'package:meta/meta.dart';

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

final void Function(Pointer<Void>) _deletePersistentHandle = library
    .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_native_delete_persistent_handle')
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

abstract class AsyncDispatcherHeap<T> {
  final ReceivePort _port = ReceivePort();

  AsyncDispatcherHeap() {
    _port.listen(_requestHandler);
  }

  void requestData(T object, Pointer<Void> nativeData);

  void onHandlerException(
      T? object, Pointer<Void> nativeData, Object e, StackTrace stackTrace);

  T? objectFromData(Pointer<Void> nativeData);

  int get sendPort => _port.sendPort.nativePort;

  void _requestHandler(dynamic data) {
    final nativeData = Pointer<Void>.fromAddress(data as int);
    final object = objectFromData(nativeData);

    try {
      requestData(object!, nativeData);
    } catch (e, stack) {
      onHandlerException(object, nativeData, e, stack);
    }
  }
}

void _deleteHandleHandler(dynamic data) {
  _deletePersistentHandle(Pointer.fromAddress(data));
}

final _deleteHandlePort = ReceivePort()..listen(_deleteHandleHandler);

int get deleteHandlePort => _deleteHandlePort.sendPort.nativePort;
