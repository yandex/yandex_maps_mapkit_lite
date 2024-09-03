part of 'errors.dart';

@bindings_annotations.WeakInterface('mapkit.offline_cache.CachePathUnavailable')
@bindings_annotations.ContainerData(
    toNative: 'CachePathUnavailableImpl.getNativePtr',
    toPlatform:
        '(val) => CachePathUnavailableImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'CachePathUnavailable')
class CachePathUnavailableImpl extends runtime_local_error.LocalErrorImpl
    implements CachePathUnavailable, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_CachePathUnavailable_free.cast());

  /// @nodoc
  CachePathUnavailableImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  CachePathUnavailableImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory CachePathUnavailableImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(CachePathUnavailable? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as CachePathUnavailableImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _CachePathUnavailable_check(ptr);
  }

  @internal

  /// @nodoc
  static CachePathUnavailable? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return CachePathUnavailableImpl.fromNativePtr(ptr);
  }
}

final _CachePathUnavailable_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_CachePathUnavailable_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _CachePathUnavailable_check =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_offline_cache_CachePathUnavailable_check')
        .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, core.int) _CachePathUnavailable_set =
    lib
        .library
        .lookup<
                ffi
                .NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_offline_cache_CachePathUnavailable_set_')
        .asFunction(isLeaf: true);
