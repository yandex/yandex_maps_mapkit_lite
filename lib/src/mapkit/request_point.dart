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

abstract final class RequestPoint implements ffi.Finalizable {
  factory RequestPoint(mapkit_geometry_point.Point point, RequestPointType type,
          core.String? pointContext, core.String? drivingArrivalPointId) =>
      RequestPointImpl(point, type, pointContext, drivingArrivalPointId);

  mapkit_geometry_point.Point get point;
  RequestPointType get type;
  core.String? get pointContext;
  core.String? get drivingArrivalPointId;

  @core.override
  core.int get hashCode =>
      core.Object.hashAll([point, type, pointContext, drivingArrivalPointId]);

  @core.override
  core.bool operator ==(covariant RequestPoint other) {
    if (core.identical(this, other)) {
      return true;
    }
    return point == other.point &&
        type == other.type &&
        pointContext == other.pointContext &&
        drivingArrivalPointId == other.drivingArrivalPointId;
  }

  @core.override
  core.String toString() {
    return "RequestPoint(point: $point, type: $type, pointContext: $pointContext, drivingArrivalPointId: $drivingArrivalPointId)";
  }
}
