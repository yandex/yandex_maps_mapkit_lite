import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'request_point.containers.dart';
part 'request_point.impl.dart';

/// The waypoint and a point the path must go through.
enum RequestPointType {
  /// The target waypoint.
  Waypoint,

  /// A point the route must pass through.
  Viapoint,
  ;
}

/// There are two types of request points. A waypoint is a destination.
/// Use it when you plan to stop there. Via points (throughpoints)
/// correct the route to make it pass through all the via points.
/// Waypoints are guaranteed to be between sections in the resulting
/// route. Via points are embedded into sections.
///
/// For each request point, you can provide a point context. It's an
/// opaque string that describe entrances, driving arrival points and so
/// on. If such context is provided then a client will get routes to
/// those additional points.
abstract final class RequestPoint implements ffi.Finalizable {
  factory RequestPoint(
          mapkit_geometry_point.Point point,
          RequestPointType type,
          core.String? pointContext,
          core.String? drivingArrivalPointId,
          core.String? indoorLevelId) =>
      RequestPointImpl(
          point, type, pointContext, drivingArrivalPointId, indoorLevelId);

  /// The request point.
  mapkit_geometry_point.Point get point;

  /// The type of request point specified.
  RequestPointType get type;

  /// Opaque string that describe entrances, driving arrival points and so
  /// on.
  ///
  core.String? get pointContext;

  /// Specifies what driving arrival point to use. If point is not
  /// specified then server will select one.
  ///
  core.String? get drivingArrivalPointId;

  /// Indoor level (floor) id
  ///
  core.String? get indoorLevelId;

  @core.override
  core.int get hashCode => core.Object.hashAll(
      [point, type, pointContext, drivingArrivalPointId, indoorLevelId]);

  @core.override
  core.bool operator ==(covariant RequestPoint other) {
    if (core.identical(this, other)) {
      return true;
    }
    return point == other.point &&
        type == other.type &&
        pointContext == other.pointContext &&
        drivingArrivalPointId == other.drivingArrivalPointId &&
        indoorLevelId == other.indoorLevelId;
  }

  @core.override
  core.String toString() {
    return "RequestPoint(point: $point, type: $type, pointContext: $pointContext, drivingArrivalPointId: $drivingArrivalPointId, indoorLevelId: $indoorLevelId)";
  }
}
