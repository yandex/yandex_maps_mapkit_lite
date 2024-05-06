part of 'location_view_source.dart';

@bindings_annotations.ContainerData(
    toNative: 'LocationViewSourceImpl.getNativePtr',
    toPlatform:
        '(val) => LocationViewSourceImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'LocationViewSource')
class LocationViewSourceImpl implements LocationViewSource, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_LocationViewSource_free.cast());

  /// @nodoc
  LocationViewSourceImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  LocationViewSourceImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(LocationViewSource? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as LocationViewSourceImpl).ptr;
  }

  @internal

  /// @nodoc
  static LocationViewSource? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LocationViewSourceImpl.fromNativePtr(ptr);
  }
}

final _LocationViewSource_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationViewSource_free');
