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

part 'jam_segment.containers.dart';
part 'jam_segment.impl.dart';

/// The intensity of traffic.
enum JamType {
  /// Unknown intensity.
  Unknown,

  /// Route is blocked.
  Blocked,

  /// Route is free.
  Free,

  /// Light traffic on route.
  Light,

  /// Heavy traffic on route.
  Hard,

  /// Very heavy traffic on route.
  VeryHard,
  ;
}

final class JamSegment {
  final JamType jamType;
  final core.double speed;

  const JamSegment(
    this.jamType, {
    required this.speed,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([jamType, speed]);

  @core.override
  core.bool operator ==(covariant JamSegment other) {
    if (core.identical(this, other)) {
      return true;
    }
    return jamType == other.jamType && speed == other.speed;
  }

  @core.override
  core.String toString() {
    return "JamSegment(jamType: $jamType, speed: $speed)";
  }
}
