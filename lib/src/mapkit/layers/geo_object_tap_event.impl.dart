part of 'geo_object_tap_event.dart';

@bindings_annotations.WeakInterface('mapkit.layers.GeoObjectTapEvent')
@bindings_annotations.ContainerData(
    toNative: 'GeoObjectTapEventImpl.getNativePtr',
    toPlatform:
        '(val) => GeoObjectTapEventImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'GeoObjectTapEvent')
class GeoObjectTapEventImpl implements GeoObjectTapEvent, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_GeoObjectTapEvent_free.cast());

  /// @nodoc
  GeoObjectTapEventImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  GeoObjectTapEventImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory GeoObjectTapEventImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectTapEvent? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as GeoObjectTapEventImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _GeoObjectTapEvent_check(ptr);
  }

  @internal

  /// @nodoc
  static GeoObjectTapEvent? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return GeoObjectTapEventImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_geo_object.GeoObject get geoObject {
    return mapkit_geo_object.GeoObjectImpl.fromNativePtr(
        _GeoObjectTapEvent_get_geoObject(ptr));
  }
}

final _GeoObjectTapEvent_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_GeoObjectTapEvent_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _GeoObjectTapEvent_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_GeoObjectTapEvent_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectTapEvent_get_geoObject = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_layers_GeoObjectTapEvent_get_geoObject')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, core.int) _GeoObjectTapEvent_set =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_layers_GeoObjectTapEvent_set_')
        .asFunction(isLeaf: true);
