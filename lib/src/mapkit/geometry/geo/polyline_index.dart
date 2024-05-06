import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
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

part 'polyline_index.containers.dart';
part 'polyline_index.impl.dart';

/// Provides methods for binding locations to a polyline
abstract class PolylineIndex implements ffi.Finalizable {
  /// Finds closest polyline position. Returns null if there is no position
  /// that satisfies the condition distance(point, position) <
  /// maxLocationBias.
  ///
  /// Two modes are available: 1. Find the closest polyline position to a
  /// raw point [PolylineIndexPriority.ClosestToRawPoint] 2. Find the
  /// closest polyline position to the polyline start
  /// [PolylineIndexPriority.ClosestToStart].
  mapkit_geometry_geometry.PolylinePosition?
      closestPolylinePositionWithPriority(
    mapkit_geometry_point.Point point,
    PolylineIndexPriority priority, {
    required core.double maxLocationBias,
  });

  /// Finds the closest polyline position between the two positions.
  /// Returns null if there is no position that satisfies the condition
  /// distance(point, position) < maxLocationBias.
  mapkit_geometry_geometry.PolylinePosition? closestPolylinePosition(
    mapkit_geometry_point.Point point,
    mapkit_geometry_geometry.PolylinePosition positionFrom,
    mapkit_geometry_geometry.PolylinePosition positionTo, {
    required core.double maxLocationBias,
  });
}

enum PolylineIndexPriority {
  ClosestToRawPoint,
  ClosestToStart,
  ;
}
