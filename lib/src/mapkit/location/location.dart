import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'location.containers.dart';
part 'location.impl.dart';

/// The geographical position of the object.

final class Location {
  /// The geographical position.
  final mapkit_geometry_point.Point position;

  /// Location accuracy in meters.
  ///
  final core.double? accuracy;

  /// The altitude of the location in meters.
  ///
  final core.double? altitude;

  /// The accuracy of the altitude in meters.
  ///
  final core.double? altitudeAccuracy;

  /// The current heading in degrees relative to true north, clockwise.
  ///
  final core.double? heading;

  /// The speed in meters per second.
  ///
  final core.double? speed;

  /// The universal identifier of indoor level.
  ///
  final core.String? indoorLevelId;

  /// Absolute timestamp, in milliseconds since January 1, 1970.
  final core.DateTime absoluteTimestamp;

  /// Relative timestamp, number of milliseconds passed on steady clock.
  /// Use for interval calculation.
  final core.DateTime relativeTimestamp;

  const Location(
    this.position,
    this.absoluteTimestamp,
    this.relativeTimestamp, {
    this.accuracy,
    this.altitude,
    this.altitudeAccuracy,
    this.heading,
    this.speed,
    this.indoorLevelId,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([
        position,
        accuracy,
        altitude,
        altitudeAccuracy,
        heading,
        speed,
        indoorLevelId,
        absoluteTimestamp,
        relativeTimestamp,
      ]);

  @core.override
  core.bool operator ==(covariant Location other) {
    if (core.identical(this, other)) {
      return true;
    }
    return position == other.position &&
        accuracy == other.accuracy &&
        altitude == other.altitude &&
        altitudeAccuracy == other.altitudeAccuracy &&
        heading == other.heading &&
        speed == other.speed &&
        indoorLevelId == other.indoorLevelId &&
        absoluteTimestamp == other.absoluteTimestamp &&
        relativeTimestamp == other.relativeTimestamp;
  }

  @core.override
  core.String toString() {
    return "Location(position: $position, accuracy: $accuracy, altitude: $altitude, altitudeAccuracy: $altitudeAccuracy, heading: $heading, speed: $speed, indoorLevelId: $indoorLevelId, absoluteTimestamp: $absoluteTimestamp, relativeTimestamp: $relativeTimestamp, )";
  }
}
