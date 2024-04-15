import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:ui' as ui;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/image/animated_image_provider.dart'
    as animated_image_provider;
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart'
    as image_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as mapkit_map_map_object;

part 'polygon.containers.dart';

/// A polygon displayed on the map.
@bindings_annotations.WeakInterface('mapkit.map.PolygonMapObject')
@bindings_annotations.ContainerData(
    toNative: 'PolygonMapObject.getNativePtr',
    toPlatform:
        '(val) => PolygonMapObject.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class PolygonMapObject extends mapkit_map_map_object.MapObject
    implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_PolygonMapObject_free.cast());

  /// @nodoc
  PolygonMapObject.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  PolygonMapObject.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PolygonMapObject.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PolygonMapObject? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _PolygonMapObject_check(ptr);
  }

  @internal

  /// @nodoc
  static PolygonMapObject? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PolygonMapObject.fromNativePtr(ptr);
  }

  mapkit_geometry_geometry.Polygon get geometry {
    return mapkit_geometry_geometry.Polygon.fromNativePtr(
        _PolygonMapObject_get_geometry(ptr));
  }

  set geometry(mapkit_geometry_geometry.Polygon val) {
    return _PolygonMapObject_set_geometry(
        ptr, mapkit_geometry_geometry.Polygon.getNativePtr(val));
  }

  /// Sets the stroke color. Default: hexademical RGBA code 0x0066FFFF.
  /// Setting the stroke color to any transparent color (for example, RGBA
  /// code 0x00000000) effectively disables the stroke.
  ui.Color get strokeColor {
    return to_platform.toPlatformColor(_PolygonMapObject_get_strokeColor(ptr));
  }

  set strokeColor(ui.Color val) {
    return _PolygonMapObject_set_strokeColor(ptr, to_native.toNativeColor(val));
  }

  /// Sets the stroke width in units. Default: 5. The size of a unit is
  /// equal to the size of a pixel at the current zoom when the camera
  /// position's tilt is equal to 0 and the scale factor is equal to 1.
  core.double get strokeWidth {
    return _PolygonMapObject_get_strokeWidth(ptr);
  }

  set strokeWidth(core.double val) {
    return _PolygonMapObject_set_strokeWidth(ptr, val);
  }

  /// Sets the fill color. Default: hexademical RGBA code 0x0066FF99.
  /// @attention Fill color is ignored if a pattern is set.
  ui.Color get fillColor {
    return to_platform.toPlatformColor(_PolygonMapObject_get_fillColor(ptr));
  }

  set fillColor(ui.Color val) {
    return _PolygonMapObject_set_fillColor(ptr, to_native.toNativeColor(val));
  }

  /// The object geometry can be interpreted in two different ways:
  /// <ul><li>If the object mode is 'geodesic', the object geometry is
  /// defined on a sphere.</li> <li>Otherwise, the object geometry is
  /// defined in projected space.</li></ul> Default: false.
  core.bool get geodesic {
    return _PolygonMapObject_get_geodesic(ptr);
  }

  set geodesic(core.bool val) {
    return _PolygonMapObject_set_geodesic(ptr, val);
  }

  /// Sets pattern to fill polygon. @attention Original linear sizes of
  /// pattern should be equal to power of 2. @attention Fill color is
  /// ignored if a pattern is set.
  void setAnimatedPattern(
    animated_image_provider.AnimatedImageProvider animatedImage, {
    required core.double scale,
  }) {
    _PolygonMapObject_setAnimatedPattern(
        ptr, to_native.toNativeAnimatedImageProvider(animatedImage), scale);
  }

  /// Sets pattern to fill polygon. @attention Original linear sizes of
  /// pattern should be equal to power of 2. @attention Fill color is
  /// ignored if pattern is set.
  void setPattern(
    image_provider.ImageProvider image, {
    required core.double scale,
  }) {
    _PolygonMapObject_setPattern(
        ptr, to_native.toNativeImageProvider(image), scale);
  }

  /// Removes pattern.
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
