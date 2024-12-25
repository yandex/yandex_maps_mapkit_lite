import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'geo.impl.dart';

class Geo {
  Geo._();

  /// Calculate the great-circle distance between two points on a sphere
  /// with a radius equal to the Earth's radius using the haversine formula
  /// described here: http://en.wikipedia.org/wiki/Haversine_formula
  ///
  /// This formula is numerically better-conditioned for small distances,
  /// according to http://en.wikipedia.org/wiki/Great-circle_distance
  static core.double distance(mapkit_geometry_point.Point firstPoint,
      mapkit_geometry_point.Point secondPoint) {
    return _distance(
      firstPoint,
      secondPoint,
    );
  }

  /// Find the point on a given segment (great-circle arc or shorter arc)
  /// that is closest to a given point.
  static mapkit_geometry_point.Point closestPoint(
      mapkit_geometry_point.Point point,
      mapkit_geometry_geometry.Segment segment) {
    return _closestPoint(
      point,
      segment,
    );
  }

  /// Find a point X on a given segment AB such that d(AX)/d(AB) = factor,
  /// where factor is a given number in \[0, 1\].
  static mapkit_geometry_point.Point pointOnSegmentByFactor(
    mapkit_geometry_geometry.Segment segment, {
    required core.double factor,
  }) {
    return _pointOnSegmentByFactor(
      segment,
      factor: factor,
    );
  }

  /// Calculate the course (bearing) between two points in degrees in the
  /// range \[0, 360\].
  static core.double course(mapkit_geometry_point.Point firstPoint,
      mapkit_geometry_point.Point secondPoint) {
    return _course(
      firstPoint,
      secondPoint,
    );
  }
}
