import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geo/xy_point.dart'
    as mapkit_geometry_geo_xy_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'projection.containers.dart';

/// Makes two conversions: world->XY and XY->world, where XY are tile
/// indexes. There are two main derived classes: spherical mercator
/// (google, osm) and wgs84 mercator (yandex).
@bindings_annotations.WeakInterface('mapkit.geometry.geo.Projection')
@bindings_annotations.ContainerData(
    toNative: 'Projection.getNativePtr',
    toPlatform:
        '(val) => Projection.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class Projection implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Projection_free.cast());

  /// @nodoc
  Projection.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  Projection.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory Projection.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Projection? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _Projection_check(ptr);
  }

  @internal

  /// @nodoc
  static Projection? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return Projection.fromNativePtr(ptr);
  }

  /// Converts the world coordinates to a flat world position.
  mapkit_geometry_geo_xy_point.XYPoint worldToXY(
    mapkit_geometry_point.Point geoPoint, {
    required core.int zoom,
  }) {
    return mapkit_geometry_geo_xy_point.XYPoint.fromNative(
        _Projection_worldToXY(
            ptr, mapkit_geometry_point.Point.toNative(geoPoint), zoom));
  }

  /// Converts the flat world position to world coordinates.
  mapkit_geometry_point.Point xyToWorld(
    mapkit_geometry_geo_xy_point.XYPoint xyPoint, {
    required core.int zoom,
  }) {
    return mapkit_geometry_point.Point.fromNative(_Projection_xyToWorld(
        ptr, mapkit_geometry_geo_xy_point.XYPoint.toNative(xyPoint), zoom));
  }
}

final _Projection_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_geo_Projection_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Projection_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_geo_Projection_check')
    .asFunction(isLeaf: true);

final mapkit_geometry_geo_xy_point.XYPointNative Function(
        ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative, core.int)
    _Projection_worldToXY = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geo_xy_point.XYPointNative Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_point.PointNative,
                        ffi.Int)>>(
            'yandex_flutter_mapkit_geometry_geo_Projection_worldToXY')
        .asFunction();
final mapkit_geometry_point.PointNative Function(ffi.Pointer<ffi.Void>,
        mapkit_geometry_geo_xy_point.XYPointNative, core.int)
    _Projection_xyToWorld = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_point.PointNative Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geo_xy_point.XYPointNative,
                        ffi.Int)>>(
            'yandex_flutter_mapkit_geometry_geo_Projection_xyToWorld')
        .asFunction();
