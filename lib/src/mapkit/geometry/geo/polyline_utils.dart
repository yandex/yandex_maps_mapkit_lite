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

part 'polyline_utils.impl.dart';

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
    return _positionsOfFork(
      firstPolyline,
      firstPolylinePosition,
      secondPolyline,
      secondPolylinePosition,
    );
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
    return _advancePolylinePosition(
      polyline,
      position,
      distance: distance,
    );
  }

  /// The point in the polyline.
  ///
  /// [geometry] The polyline.
  /// [position] The polyline position.
  static mapkit_geometry_point.Point pointByPolylinePosition(
      mapkit_geometry_geometry.Polyline geometry,
      mapkit_geometry_geometry.PolylinePosition position) {
    return _pointByPolylinePosition(
      geometry,
      position,
    );
  }

  static core.double distanceBetweenPolylinePositions(
      mapkit_geometry_geometry.Polyline polyline,
      mapkit_geometry_geometry.PolylinePosition from,
      mapkit_geometry_geometry.PolylinePosition to) {
    return _distanceBetweenPolylinePositions(
      polyline,
      from,
      to,
    );
  }

  /// Creates PolylineIndex for polyline. See
  /// [mapkit_geometry_geo_polyline_index.PolylineIndex] for details.
  static mapkit_geometry_geo_polyline_index.PolylineIndex createPolylineIndex(
      mapkit_geometry_geometry.Polyline polyline) {
    return _createPolylineIndex(
      polyline,
    );
  }
}
