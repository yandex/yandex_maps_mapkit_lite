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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as mapkit_map_map_object;

part 'circle.containers.dart';

/// The circle element.
@bindings_annotations.WeakInterface('mapkit.map.CircleMapObject')
@bindings_annotations.ContainerData(
    toNative: 'CircleMapObject.getNativePtr',
    toPlatform:
        '(val) => CircleMapObject.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class CircleMapObject extends mapkit_map_map_object.MapObject
    implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_CircleMapObject_free.cast());

  /// @nodoc
  CircleMapObject.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  CircleMapObject.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory CircleMapObject.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(CircleMapObject? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _CircleMapObject_check(ptr);
  }

  @internal

  /// @nodoc
  static CircleMapObject? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return CircleMapObject.fromNativePtr(ptr);
  }

  mapkit_geometry_geometry.Circle get geometry {
    return mapkit_geometry_geometry.Circle.fromNative(
        _CircleMapObject_get_geometry(ptr));
  }

  set geometry(mapkit_geometry_geometry.Circle val) {
    return _CircleMapObject_set_geometry(
        ptr, mapkit_geometry_geometry.Circle.toNative(val));
  }

  /// Sets the stroke color. Setting the stroke color to any transparent
  /// color (for example, RGBA code 0x00000000) effectively disables the
  /// stroke. default: 0x0066FFFF
  ui.Color get strokeColor {
    return to_platform.toPlatformColor(_CircleMapObject_get_strokeColor(ptr));
  }

  set strokeColor(ui.Color val) {
    return _CircleMapObject_set_strokeColor(ptr, to_native.toNativeColor(val));
  }

  /// Sets the stroke width in units. The size of a unit is equal to the
  /// size of a pixel at the current zoom level when the camera position's
  /// tilt is equal to 0 and the scale factor is equal to 1. default: 5
  core.double get strokeWidth {
    return _CircleMapObject_get_strokeWidth(ptr);
  }

  set strokeWidth(core.double val) {
    return _CircleMapObject_set_strokeWidth(ptr, val);
  }

  /// Sets the fill color. default: 0x0066FF99
  ui.Color get fillColor {
    return to_platform.toPlatformColor(_CircleMapObject_get_fillColor(ptr));
  }

  set fillColor(ui.Color val) {
    return _CircleMapObject_set_fillColor(ptr, to_native.toNativeColor(val));
  }

  /// The object's geometry can be interpreted in two different ways:
  /// <ul><li>If the object mode is 'geodesic', the object's geometry is
  /// defined on a sphere.</li> <li>Otherwise, the object's geometry is
  /// defined in projected space.</li></ul> Default: false.
  core.bool get geodesic {
    return _CircleMapObject_get_geodesic(ptr);
  }

  set geodesic(core.bool val) {
    return _CircleMapObject_set_geodesic(ptr, val);
  }
}

final _CircleMapObject_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CircleMapObject_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _CircleMapObject_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CircleMapObject_check')
    .asFunction(isLeaf: true);

final mapkit_geometry_geometry.CircleNative Function(ffi.Pointer<ffi.Void>)
    _CircleMapObject_get_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geometry.CircleNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_get_geometry')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_geometry_geometry.CircleNative)
    _CircleMapObject_set_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.CircleNative)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_set_geometry')
        .asFunction();

final native_types.NativeColor Function(ffi.Pointer<ffi.Void>)
    _CircleMapObject_get_strokeColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_get_strokeColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _CircleMapObject_set_strokeColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_set_strokeColor')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _CircleMapObject_get_strokeWidth = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_get_strokeWidth')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _CircleMapObject_set_strokeWidth = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_set_strokeWidth')
        .asFunction();

final native_types.NativeColor Function(ffi.Pointer<ffi.Void>)
    _CircleMapObject_get_fillColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_get_fillColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _CircleMapObject_set_fillColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_set_fillColor')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _CircleMapObject_get_geodesic =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_get_geodesic')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _CircleMapObject_set_geodesic = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_set_geodesic')
        .asFunction();
