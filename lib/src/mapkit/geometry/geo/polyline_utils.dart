import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geo/polyline_index.dart'
    as mapkit_geometry_geo_polyline_index;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

class PolylineUtils {
  PolylineUtils._();

  /// The position of the fork on the road.
  ///
  /// [firstPolyline] The first path of the fork.
  /// [firstPolylinePosition] The position of the first path.
  /// [secondPolyline] The second path of the fork.
  /// [secondPolylinePosition] The position of the second path.
  static core.List<mapkit_geometry_geometry.PolylinePosition> positionsOfFork(
      mapkit_geometry_geometry.Polyline firstPolyline,
      mapkit_geometry_geometry.PolylinePosition firstPolylinePosition,
      mapkit_geometry_geometry.Polyline secondPolyline,
      mapkit_geometry_geometry.PolylinePosition secondPolylinePosition) {
    return mapkit_geometry_geometry.PolylinePositionContainerExtension
        .toPlatformVector(_PolylineUtils_positionsOfFork(
            mapkit_geometry_geometry.Polyline.getNativePtr(firstPolyline),
            mapkit_geometry_geometry.PolylinePosition.toNative(
                firstPolylinePosition),
            mapkit_geometry_geometry.Polyline.getNativePtr(secondPolyline),
            mapkit_geometry_geometry.PolylinePosition.toNative(
                secondPolylinePosition)));
  }

  /// The position of the polyline.
  ///
  /// [polyline] The polyline.
  /// [position] The polyline position.
  /// [distance] Distance.
  static mapkit_geometry_geometry.PolylinePosition advancePolylinePosition(
    mapkit_geometry_geometry.Polyline polyline,
    mapkit_geometry_geometry.PolylinePosition position, {
    required core.double distance,
  }) {
    return mapkit_geometry_geometry.PolylinePosition.fromNative(
        _PolylineUtils_advancePolylinePosition(
            mapkit_geometry_geometry.Polyline.getNativePtr(polyline),
            mapkit_geometry_geometry.PolylinePosition.toNative(position),
            distance));
  }

  /// The point in the polyline.
  ///
  /// [geometry] The polyline.
  /// [position] The polyline position.
  static mapkit_geometry_point.Point pointByPolylinePosition(
      mapkit_geometry_geometry.Polyline geometry,
      mapkit_geometry_geometry.PolylinePosition position) {
    return mapkit_geometry_point.Point.fromNative(
        _PolylineUtils_pointByPolylinePosition(
            mapkit_geometry_geometry.Polyline.getNativePtr(geometry),
            mapkit_geometry_geometry.PolylinePosition.toNative(position)));
  }

  static core.double distanceBetweenPolylinePositions(
      mapkit_geometry_geometry.Polyline polyline,
      mapkit_geometry_geometry.PolylinePosition from,
      mapkit_geometry_geometry.PolylinePosition to) {
    return _PolylineUtils_distanceBetweenPolylinePositions(
        mapkit_geometry_geometry.Polyline.getNativePtr(polyline),
        mapkit_geometry_geometry.PolylinePosition.toNative(from),
        mapkit_geometry_geometry.PolylinePosition.toNative(to));
  }

  /// Creates PolylineIndex for polyline. See
  /// [mapkit_geometry_geo_polyline_index.PolylineIndex] for details.
  static mapkit_geometry_geo_polyline_index.PolylineIndex createPolylineIndex(
      mapkit_geometry_geometry.Polyline polyline) {
    return mapkit_geometry_geo_polyline_index.PolylineIndex.fromNativePtr(
        _PolylineUtils_createPolylineIndex(
            mapkit_geometry_geometry.Polyline.getNativePtr(polyline)));
  }
}

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_geometry.PolylinePositionNative,
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_geometry.PolylinePositionNative)
    _PolylineUtils_positionsOfFork = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.PolylinePositionNative,
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.PolylinePositionNative)>>(
            'yandex_flutter_mapkit_geometry_geo_PolylineUtils_positionsOfFork')
        .asFunction();
final mapkit_geometry_geometry.PolylinePositionNative Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_geometry.PolylinePositionNative,
    core
        .double) _PolylineUtils_advancePolylinePosition = lib.library
    .lookup<
            ffi.NativeFunction<
                mapkit_geometry_geometry.PolylinePositionNative Function(
                    ffi.Pointer<ffi.Void>,
                    mapkit_geometry_geometry.PolylinePositionNative,
                    ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineUtils_advancePolylinePosition')
    .asFunction();
final mapkit_geometry_point.PointNative Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_geometry
        .PolylinePositionNative) _PolylineUtils_pointByPolylinePosition = lib
    .library
    .lookup<
            ffi.NativeFunction<
                mapkit_geometry_point.PointNative Function(
                    ffi.Pointer<ffi.Void>,
                    mapkit_geometry_geometry.PolylinePositionNative)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineUtils_pointByPolylinePosition')
    .asFunction();
final core.double Function(
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_geometry.PolylinePositionNative,
        mapkit_geometry_geometry.PolylinePositionNative)
    _PolylineUtils_distanceBetweenPolylinePositions = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Double Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.PolylinePositionNative,
                        mapkit_geometry_geometry.PolylinePositionNative)>>(
            'yandex_flutter_mapkit_geometry_geo_PolylineUtils_distanceBetweenPolylinePositions')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PolylineUtils_createPolylineIndex = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineUtils_createPolylineIndex')
    .asFunction();
