part of 'polygon.dart';

@bindings_annotations.WeakInterface('mapkit.map.PolygonMapObject')
@bindings_annotations.ContainerData(
    toNative: 'PolygonMapObjectImpl.getNativePtr',
    toPlatform:
        '(val) => PolygonMapObjectImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'PolygonMapObject')
class PolygonMapObjectImpl extends mapkit_map_map_object.MapObjectImpl
    implements PolygonMapObject, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_PolygonMapObject_free.cast());

  /// @nodoc
  PolygonMapObjectImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  PolygonMapObjectImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PolygonMapObjectImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PolygonMapObject? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as PolygonMapObjectImpl).ptr;
  }

  core.bool isValid() {
    return _PolygonMapObject_check(ptr);
  }

  @internal

  /// @nodoc
  static PolygonMapObject? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PolygonMapObjectImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_geometry_geometry.Polygon get geometry {
    return mapkit_geometry_geometry.PolygonImpl.fromNativePtr(
        _PolygonMapObject_get_geometry(ptr));
  }

  @core.override
  set geometry(mapkit_geometry_geometry.Polygon val) {
    _PolygonMapObject_set_geometry(
        ptr, mapkit_geometry_geometry.PolygonImpl.getNativePtr(val));
  }

  @core.override
  ui.Color get strokeColor {
    return to_platform.toPlatformColor(_PolygonMapObject_get_strokeColor(ptr));
  }

  @core.override
  set strokeColor(ui.Color val) {
    _PolygonMapObject_set_strokeColor(ptr, to_native.toNativeColor(val));
  }

  @core.override
  core.double get strokeWidth {
    return _PolygonMapObject_get_strokeWidth(ptr);
  }

  @core.override
  set strokeWidth(core.double val) {
    _PolygonMapObject_set_strokeWidth(ptr, val);
  }

  @core.override
  ui.Color get fillColor {
    return to_platform.toPlatformColor(_PolygonMapObject_get_fillColor(ptr));
  }

  @core.override
  set fillColor(ui.Color val) {
    _PolygonMapObject_set_fillColor(ptr, to_native.toNativeColor(val));
  }

  @core.override
  core.bool get geodesic {
    return _PolygonMapObject_get_geodesic(ptr);
  }

  @core.override
  set geodesic(core.bool val) {
    _PolygonMapObject_set_geodesic(ptr, val);
  }

  void setAnimatedPattern(
    animated_image_provider.AnimatedImageProvider animatedImage, {
    required core.double scale,
  }) {
    _PolygonMapObject_setAnimatedPattern(
        ptr, to_native.toNativeAnimatedImageProvider(animatedImage), scale);
  }

  void setPattern(
    image_provider.ImageProvider image, {
    required core.double scale,
  }) {
    _PolygonMapObject_setPattern(
        ptr, to_native.toNativeImageProvider(image), scale);
  }

  void resetPattern() {
    _PolygonMapObject_resetPattern(ptr);
  }
}

final _PolygonMapObject_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PolygonMapObject_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _PolygonMapObject_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PolygonMapObject_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _PolygonMapObject_get_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_get_geometry')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PolygonMapObject_set_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_set_geometry')
        .asFunction();

final native_types.NativeColor Function(ffi.Pointer<ffi.Void>)
    _PolygonMapObject_get_strokeColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_get_strokeColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _PolygonMapObject_set_strokeColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_set_strokeColor')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _PolygonMapObject_get_strokeWidth = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_get_strokeWidth')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _PolygonMapObject_set_strokeWidth = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_set_strokeWidth')
        .asFunction();

final native_types.NativeColor Function(ffi.Pointer<ffi.Void>)
    _PolygonMapObject_get_fillColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_get_fillColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _PolygonMapObject_set_fillColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_set_fillColor')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _PolygonMapObject_get_geodesic =
    lib
        .library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_get_geodesic')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _PolygonMapObject_set_geodesic = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_set_geodesic')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, core.double)
    _PolygonMapObject_setAnimatedPattern = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_setAnimatedPattern')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, core.double)
    _PolygonMapObject_setPattern = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PolygonMapObject_setPattern')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _PolygonMapObject_resetPattern = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PolygonMapObject_resetPattern')
    .asFunction();
