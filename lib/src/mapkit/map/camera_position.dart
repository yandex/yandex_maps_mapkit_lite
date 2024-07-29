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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'camera_position.containers.dart';
part 'camera_position.impl.dart';

/// The position of the camera.

final class CameraPosition {
  /// The point the camera is looking at.
  final mapkit_geometry_point.Point target;

  /// Zoom level. 0 corresponds to the whole world displayed in a single
  /// tile.
  final core.double zoom;

  /// Angle between north and the direction of interest on the map plane,
  /// in degrees in the range \[0, 360).
  final core.double azimuth;

  /// Camera tilt in degrees. 0 means vertical downward.
  final core.double tilt;

  const CameraPosition(
    this.target, {
    required this.zoom,
    required this.azimuth,
    required this.tilt,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([target, zoom, azimuth, tilt]);

  @core.override
  core.bool operator ==(covariant CameraPosition other) {
    if (core.identical(this, other)) {
      return true;
    }
    return target == other.target &&
        zoom == other.zoom &&
        azimuth == other.azimuth &&
        tilt == other.tilt;
  }

  @core.override
  core.String toString() {
    return "CameraPosition(target: $target, zoom: $zoom, azimuth: $azimuth, tilt: $tilt)";
  }
}
