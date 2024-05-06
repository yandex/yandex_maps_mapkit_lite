import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'route_position.containers.dart';
part 'route_position.impl.dart';

abstract class RoutePosition implements ffi.Finalizable {
  /// As point on the map
  mapkit_geometry_point.Point get point;

  /// Check if this position on the same route as passed.
  core.bool onRoute(core.String routeId);

  /// Return polyline position on route. If the position not on the passed
  /// route none will be returned.
  mapkit_geometry_geometry.PolylinePosition? positionOnRoute(
      core.String routeId);

  /// Create position shifted by distance. If the distance is more than
  /// remains route length, the end of the route will be returned. If the
  /// distance is less than a negative distance from the start, the
  /// beginning of the route will be returned.
  RoutePosition advance(core.double distance);

  /// Distance to another point on the route. Return none if point on
  /// another route. May be less 0 if position "to" stay before this
  /// position.
  core.double? distanceTo(RoutePosition to);

  /// Determines if position precedes another position on the route. Throws
  /// if another position belongs to another route.
  core.bool precedes(RoutePosition another);

  /// Determines if position precedes or equals another position on the
  /// route. Throws if another position belongs to another route.
  core.bool precedesOrEquals(RoutePosition another);

  /// Determines if position equals another position on the route. Throws
  /// if another position belongs to another route.
  core.bool equals(RoutePosition another);

  /// Heading movement on the route at this position. It is equal heading
  /// of the segment which is belonged position.
  core.double heading();

  /// Distance to the end of the route.
  core.double distanceToFinish();

  /// Time to the end of the route.
  core.double timeToFinish();
}
