part of 'storage_manager.dart';

@bindings_annotations.WeakInterface('mapkit.storage.StorageManager')
@bindings_annotations.ContainerData(
    toNative: 'StorageManagerImpl.getNativePtr',
    toPlatform:
        '(val) => StorageManagerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'StorageManager')
class StorageManagerImpl implements StorageManager, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_StorageManager_free.cast());

  /// @nodoc
  StorageManagerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  StorageManagerImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory StorageManagerImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(StorageManager? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as StorageManagerImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _StorageManager_check(ptr);
  }

  @internal

  /// @nodoc
  static StorageManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return StorageManagerImpl.fromNativePtr(ptr);
  }

  void addStorageErrorListener(
      mapkit_storage_storage_error_listener.StorageErrorListener
          errorListener) {
    _StorageManager_addStorageErrorListener(
        ptr,
        mapkit_storage_storage_error_listener.StorageErrorListenerImpl
            .getNativePtr(errorListener));
  }

  void removeStorageErrorListener(
      mapkit_storage_storage_error_listener.StorageErrorListener
          errorListener) {
    _StorageManager_removeStorageErrorListener(
        ptr,
        mapkit_storage_storage_error_listener.StorageErrorListenerImpl
            .getNativePtr(errorListener));
  }

  void computeSize(StorageManagerSizeListener callback) {
    _StorageManager_computeSize(
        ptr, StorageManagerSizeListenerImpl.getNativePtr(callback));
  }

  void clear(StorageManagerClearListener callback) {
    _StorageManager_clear(
        ptr, StorageManagerClearListenerImpl.getNativePtr(callback));
  }

  void setMaxTileStorageSize(
    StorageManagerSizeListener callback, {
    required core.int limit,
  }) {
    _StorageManager_setMaxTileStorageSize(
      ptr,
      limit,
      StorageManagerSizeListenerImpl.getNativePtr(callback),
    );
  }

  void resetMaxTileStorageSize(StorageManagerSizeListener callback) {
    _StorageManager_resetMaxTileStorageSize(
        ptr, StorageManagerSizeListenerImpl.getNativePtr(callback));
  }

  void maxTileStorageSize(StorageManagerSizeListener callback) {
    _StorageManager_maxTileStorageSize(
        ptr, StorageManagerSizeListenerImpl.getNativePtr(callback));
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
final void Function(ffi.Pointer<ffi.Void>, core.int) _StorageManager_set = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
        'yandex_flutter_mapkit_storage_StorageManager_set_')
    .asFunction(isLeaf: true);

final class StorageManagerClearListenerImpl
    implements StorageManagerClearListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, StorageManagerClearListener>{};

  StorageManagerClearListenerImpl({required void Function() onClearCompleted})
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

  @core.override
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
    return (obj as StorageManagerClearListenerImpl)._ptr;
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
  final listener = StorageManagerClearListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onClearCompleted();
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

final class StorageManagerSizeListenerImpl
    implements StorageManagerSizeListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, StorageManagerSizeListener>{};

  StorageManagerSizeListenerImpl(
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

  @core.override
  void onSuccess(core.int? bytes) => _onSuccess(bytes);
  @core.override
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
    return (obj as StorageManagerSizeListenerImpl)._ptr;
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
                        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_storage_StorageManager_StorageManagerSizeListener_new')
        .asFunction(isLeaf: true);

void _StorageManagerSizeListener_onSuccess(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> bytes) {
  final listener = StorageManagerSizeListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onSuccess(to_platform.toPlatformFromPointerInt64(bytes));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

void _StorageManagerSizeListener_onError(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> error) {
  final listener = StorageManagerSizeListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onError(runtime_error.ErrorImpl.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}
