import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/storage/storage_error_listener.dart'
    as mapkit_storage_storage_error_listener;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;

part 'storage_manager.containers.dart';

/// Storage manager. This is a manager that controls temporary cache
/// storages (for example map tiles).
@bindings_annotations.WeakInterface('mapkit.storage.StorageManager')
@bindings_annotations.ContainerData(
    toNative: 'StorageManager.getNativePtr',
    toPlatform:
        '(val) => StorageManager.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class StorageManager implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_StorageManager_free.cast());

  /// @nodoc
  StorageManager.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  StorageManager.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory StorageManager.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(StorageManager? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _StorageManager_check(ptr);
  }

  @internal

  /// @nodoc
  static StorageManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return StorageManager.fromNativePtr(ptr);
  }

  /// Subscribes to storage events.
  ///
  /// The class does not retain the object in the 'errorListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addStorageErrorListener(
      mapkit_storage_storage_error_listener.StorageErrorListener
          errorListener) {
    _StorageManager_addStorageErrorListener(
        ptr,
        mapkit_storage_storage_error_listener.StorageErrorListener.getNativePtr(
            errorListener));
  }

  /// Unsubscribes from storage events.
  void removeStorageErrorListener(
      mapkit_storage_storage_error_listener.StorageErrorListener
          errorListener) {
    _StorageManager_removeStorageErrorListener(
        ptr,
        mapkit_storage_storage_error_listener.StorageErrorListener.getNativePtr(
            errorListener));
  }

  /// Computes storage size in bytes.
  void computeSize(StorageManagerSizeListener callback) {
    _StorageManager_computeSize(
        ptr, StorageManagerSizeListener.getNativePtr(callback));
  }

  /// Removes all data.
  void clear(StorageManagerClearListener callback) {
    _StorageManager_clear(
        ptr, StorageManagerClearListener.getNativePtr(callback));
  }

  /// Sets the maximum tile cache size to limit bytes. When the limit is
  /// reached, old tiles are removed.
  void setMaxTileStorageSize(
    StorageManagerSizeListener callback, {
    required core.int limit,
  }) {
    _StorageManager_setMaxTileStorageSize(
      ptr,
      limit,
      StorageManagerSizeListener.getNativePtr(callback),
    );
  }

  /// Resets the tile cache size limit.
  void resetMaxTileStorageSize(StorageManagerSizeListener callback) {
    _StorageManager_resetMaxTileStorageSize(
        ptr, StorageManagerSizeListener.getNativePtr(callback));
  }

  /// Obtains the current storage size limit in bytes.
  void maxTileStorageSize(StorageManagerSizeListener callback) {
    _StorageManager_maxTileStorageSize(
        ptr, StorageManagerSizeListener.getNativePtr(callback));
  }
}

final _StorageManager_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_storage_StorageManager_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _StorageManager_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_storage_StorageManager_check')
    .asFunction(isLeaf: true);

final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _StorageManager_addStorageErrorListener = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_storage_StorageManager_addStorageErrorListener')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _StorageManager_removeStorageErrorListener = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_storage_StorageManager_removeStorageErrorListener')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _StorageManager_computeSize = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_storage_StorageManager_computeSize')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _StorageManager_clear = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_storage_StorageManager_clear')
        .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    ffi
        .Pointer<ffi.Void>) _StorageManager_setMaxTileStorageSize = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_storage_StorageManager_setMaxTileStorageSize')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _StorageManager_resetMaxTileStorageSize = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_storage_StorageManager_resetMaxTileStorageSize')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _StorageManager_maxTileStorageSize = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_storage_StorageManager_maxTileStorageSize')
        .asFunction();

class StorageManagerClearListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, StorageManagerClearListener>{};

  StorageManagerClearListener({required void Function() onClearCompleted})
      : _ptr = _StorageManagerClearListener_new(
            ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
                _StorageManagerClearListener_onClearCompleted)),
        _onClearCompleted = onClearCompleted {
    _pointerToListener[_ptr] = this;
    _StorageManagerClearListenersetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  /// Storage was cleared.
  void onClearCompleted() => _onClearCompleted();

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function() _onClearCompleted;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(StorageManagerClearListener? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _StorageManagerClearListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_storage_StorageManager_StorageManagerClearListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)
    _StorageManagerClearListener_new = lib
        .library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_storage_StorageManager_StorageManagerClearListener_new')
        .asFunction(isLeaf: true);

void _StorageManagerClearListener_onClearCompleted(ffi.Pointer<ffi.Void> _ptr) {
  final listener = StorageManagerClearListener._pointerToListener[_ptr]!;

  try {
    listener.onClearCompleted();
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

class StorageManagerSizeListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, StorageManagerSizeListener>{};

  StorageManagerSizeListener(
      {required void Function(core.int? bytes) onSuccess,
      required void Function(runtime_error.Error error) onError})
      : _ptr = _StorageManagerSizeListener_new(
            ffi.Pointer.fromFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
                _StorageManagerSizeListener_onSuccess),
            ffi.Pointer.fromFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
                _StorageManagerSizeListener_onError)),
        _onSuccess = onSuccess,
        _onError = onError {
    _pointerToListener[_ptr] = this;
    _StorageManagerSizeListenersetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  /// Storage size was computed/modify.
  void onSuccess(core.int? bytes) => _onSuccess(bytes);

  /// There was an error during size operation.
  void onError(runtime_error.Error error) => _onError(error);

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function(core.int?) _onSuccess;
  final void Function(runtime_error.Error) _onError;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(StorageManagerSizeListener? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _StorageManagerSizeListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_storage_StorageManager_StorageManagerSizeListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _StorageManagerSizeListener_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>('yandex_flutter_mapkit_storage_StorageManager_StorageManagerSizeListener_new')
        .asFunction(isLeaf: true);

void _StorageManagerSizeListener_onSuccess(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> bytes) {
  final listener = StorageManagerSizeListener._pointerToListener[_ptr]!;

  try {
    listener.onSuccess(to_platform.toPlatformFromPointerInt64(bytes));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

void _StorageManagerSizeListener_onError(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> error) {
  final listener = StorageManagerSizeListener._pointerToListener[_ptr]!;

  try {
    listener.onError(runtime_error.Error.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}
