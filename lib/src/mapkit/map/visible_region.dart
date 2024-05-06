import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'visible_region.containers.dart';
part 'visible_region.impl.dart';

final class VisibleRegion {
  final mapkit_geometry_point.Point topLeft;
  final mapkit_geometry_point.Point topRight;
  final mapkit_geometry_point.Point bottomLeft;
  final mapkit_geometry_point.Point bottomRight;

  const VisibleRegion(
      this.topLeft, this.topRight, this.bottomLeft, this.bottomRight);

  @core.override
  core.int get hashCode =>
      core.Object.hashAll([topLeft, topRight, bottomLeft, bottomRight]);

  @core.override
  core.bool operator ==(covariant VisibleRegion other) {
    if (core.identical(this, other)) {
      return true;
    }
    return topLeft == other.topLeft &&
        topRight == other.topRight &&
        bottomLeft == other.bottomLeft &&
        bottomRight == other.bottomRight;
  }

  @core.override
  core.String toString() {
    return "VisibleRegion(topLeft: $topLeft, topRight: $topRight, bottomLeft: $bottomLeft, bottomRight: $bottomRight)";
  }
}

class VisibleRegionUtils {
  VisibleRegionUtils._();

  /// Converts visible region to polygon geometry
  static mapkit_geometry_geometry.Geometry toPolygon(
      VisibleRegion visibleRegion) {
    return _toPolygon(
      visibleRegion,
    );
  }

  /// Return BoundingBox for provided [VisibleRegion]
  static mapkit_geometry_geometry.BoundingBox getBounds(
      VisibleRegion visibleRegion) {
    return _getBounds(
      visibleRegion,
    );
  }
}
