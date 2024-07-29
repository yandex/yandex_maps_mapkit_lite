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

part 'point.containers.dart';
part 'point.impl.dart';

/// A point at the specified coordinates.

final class Point {
  /// The point's latitude.
  final core.double latitude;

  /// The point's longitude.
  final core.double longitude;

  const Point({
    required this.latitude,
    required this.longitude,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([latitude, longitude]);

  @core.override
  core.bool operator ==(covariant Point other) {
    if (core.identical(this, other)) {
      return true;
    }
    return latitude == other.latitude && longitude == other.longitude;
  }

  @core.override
  core.String toString() {
    return "Point(latitude: $latitude, longitude: $longitude)";
  }
}
