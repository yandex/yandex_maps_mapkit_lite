part of 'surface.dart';

@bindings_annotations.ContainerData(
    toNative: 'SurfaceImpl.getNativePtr',
    toPlatform:
        '(val) => SurfaceImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Surface')
class SurfaceImpl implements Surface, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Surface_free.cast());

  /// @nodoc
  SurfaceImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  SurfaceImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Surface? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as SurfaceImpl).ptr;
  }

  @internal

  /// @nodoc
  static Surface? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return SurfaceImpl.fromNativePtr(ptr);
  }

  @core.override
  math.Point<core.double> get anchorPoint {
    final result = _Surface_get_anchorPoint(ptr);
    return to_platform.toPlatformPoint(result);
  }

  @core.override
  set anchorPoint(math.Point<core.double> val) {
    _Surface_set_anchorPoint(ptr, to_native.toNativePoint(val));
  }
}

final _Surface_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_view_Surface_free');

final native_types.NativePoint Function(ffi.Pointer<ffi.Void>)
    _Surface_get_anchorPoint = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativePoint Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_view_Surface_get_anchorPoint')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativePoint)
    _Surface_set_anchorPoint = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativePoint)>>(
            'yandex_flutter_runtime_view_Surface_set_anchorPoint')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, core.int) _Surface_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_runtime_view_Surface_set_')
    .asFunction(isLeaf: true);
