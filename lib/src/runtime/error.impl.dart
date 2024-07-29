part of 'error.dart';

@bindings_annotations.WeakInterface('runtime.Error')
@bindings_annotations.ContainerData(
    toNative: 'ErrorImpl.getNativePtr',
    toPlatform:
        '(val) => ErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Error')
class ErrorImpl implements Error, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Error_free.cast());

  /// @nodoc
  ErrorImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  ErrorImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory ErrorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Error? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as ErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _Error_check(ptr);
  }

  @internal

  /// @nodoc
  static Error? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return ErrorImpl.fromNativePtr(ptr);
  }
}

final _Error_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_Error_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Error_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_Error_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, core.int) _Error_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_runtime_Error_set_')
    .asFunction(isLeaf: true);
