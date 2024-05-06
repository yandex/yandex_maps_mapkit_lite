part of 'error.dart';

@bindings_annotations.WeakInterface('mapkit.location.LocationUnavailableError')
@bindings_annotations.ContainerData(
    toNative: 'LocationUnavailableErrorImpl.getNativePtr',
    toPlatform:
        '(val) => LocationUnavailableErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'LocationUnavailableError')
class LocationUnavailableErrorImpl extends runtime_error.ErrorImpl
    implements LocationUnavailableError, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_LocationUnavailableError_free.cast());

  /// @nodoc
  LocationUnavailableErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  LocationUnavailableErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory LocationUnavailableErrorImpl.fromNativePtr(
          ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(LocationUnavailableError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as LocationUnavailableErrorImpl).ptr;
  }

  core.bool isValid() {
    return _LocationUnavailableError_check(ptr);
  }

  @internal

  /// @nodoc
  static LocationUnavailableError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LocationUnavailableErrorImpl.fromNativePtr(ptr);
  }
}

final _LocationUnavailableError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationUnavailableError_free');
final core.bool Function(ffi.Pointer<ffi.Void>)
    _LocationUnavailableError_check = lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationUnavailableError_check')
        .asFunction(isLeaf: true);
