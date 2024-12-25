import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'bounding_box_helper.impl.dart';

class BoundingBoxHelper {
  BoundingBoxHelper._();

  /// Gets bounds based on a bounding box.
  static mapkit_geometry_geometry.BoundingBox getBounds(
      mapkit_geometry_geometry.BoundingBox bbox) {
    return _getBounds(
      bbox,
    );
  }

  /// Gets bounds based on a point.
  static mapkit_geometry_geometry.BoundingBox getBoundsFromPoint(
      mapkit_geometry_point.Point point) {
    return _getBoundsFromPoint(
      point,
    );
  }

  /// Gets bounds based on a polyline.
  static mapkit_geometry_geometry.BoundingBox getBoundsFromPolyline(
      mapkit_geometry_geometry.Polyline polyline) {
    return _getBoundsFromPolyline(
      polyline,
    );
  }

  /// Gets bounds based on a linear ring.
  static mapkit_geometry_geometry.BoundingBox getBoundsFromRing(
      mapkit_geometry_geometry.LinearRing ring) {
    return _getBoundsFromRing(
      ring,
    );
  }

  /// Gets bounds based on a polygon.
  static mapkit_geometry_geometry.BoundingBox getBoundsFromPolygon(
      mapkit_geometry_geometry.Polygon polygon) {
    return _getBoundsFromPolygon(
      polygon,
    );
  }

  /// Gets bounds based on two bounding boxes.
  static mapkit_geometry_geometry.BoundingBox getBoundsFromTwoBoxes(
      mapkit_geometry_geometry.BoundingBox first,
      mapkit_geometry_geometry.BoundingBox second) {
    return _getBoundsFromTwoBoxes(
      first,
      second,
    );
  }
}
