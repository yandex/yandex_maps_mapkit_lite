import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;

/// @nodoc
class _OfflineCacheDataMoveListenerWrapper implements ffi.Finalizable {
  _OfflineCacheDataMoveListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_OfflineCacheDataMoveListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Listener for the information about operations.
/// @attention This feature is not available in the free MapKit version.
abstract class OfflineCacheDataMoveListener {
  static final _pointerToListener = <ffi.Pointer<ffi.Void>,
      core.WeakReference<OfflineCacheDataMoveListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<
      OfflineCacheDataMoveListener, _OfflineCacheDataMoveListenerWrapper?>();

  /// Called when the operation makes progress. Percent is the rate of
  /// completion in the range of 0 to 100.
  void onDataMoveProgress(core.int percent);

  /// Called when the request is completed.
  void onDataMoveCompleted();

  /// Called when an error occurs.
  void onDataMoveError(runtime_error.Error error);

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(
      OfflineCacheDataMoveListener obj) {
    final ptr = _OfflineCacheDataMoveListener_new(
        ffi.Pointer.fromFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int)>(_OfflineCacheDataMoveListener_onDataMoveProgress),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
            _OfflineCacheDataMoveListener_onDataMoveCompleted),
        ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _OfflineCacheDataMoveListener_onDataMoveError));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _OfflineCacheDataMoveListenerWrapper(ptr);
    _OfflineCacheDataMoveListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(OfflineCacheDataMoveListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _OfflineCacheDataMoveListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheDataMoveListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _OfflineCacheDataMoveListener_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>('yandex_flutter_mapkit_offline_cache_OfflineCacheDataMoveListener_new')
        .asFunction(isLeaf: true);

final _OfflineCacheDataMoveListener_free = lib.library.lookup<
        ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
    'yandex_flutter_mapkit_offline_cache_OfflineCacheDataMoveListener_free');
void _OfflineCacheDataMoveListener_onDataMoveProgress(
    ffi.Pointer<ffi.Void> _ptr, core.int percent) {
  final listener =
      OfflineCacheDataMoveListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onDataMoveProgress(percent);
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _OfflineCacheDataMoveListener_onDataMoveCompleted(
    ffi.Pointer<ffi.Void> _ptr) {
  final listener =
      OfflineCacheDataMoveListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onDataMoveCompleted();
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _OfflineCacheDataMoveListener_onDataMoveError(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> error) {
  final listener =
      OfflineCacheDataMoveListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onDataMoveError(runtime_error.Error.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
