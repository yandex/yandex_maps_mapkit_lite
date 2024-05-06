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

part 'direction.containers.dart';
part 'direction.impl.dart';

final class Direction {
  final core.double azimuth;
  final core.double tilt;

  const Direction({
    required this.azimuth,
    required this.tilt,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([azimuth, tilt]);

  @core.override
  core.bool operator ==(covariant Direction other) {
    if (core.identical(this, other)) {
      return true;
    }
    return azimuth == other.azimuth && tilt == other.tilt;
  }

  @core.override
  core.String toString() {
    return "Direction(azimuth: $azimuth, tilt: $tilt)";
  }
}
