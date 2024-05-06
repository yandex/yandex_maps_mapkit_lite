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

part 'animation.containers.dart';
part 'animation.impl.dart';

final class Animation {
  final AnimationType type;
  final core.double duration;

  const Animation(
    this.type, {
    required this.duration,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([type, duration]);

  @core.override
  core.bool operator ==(covariant Animation other) {
    if (core.identical(this, other)) {
      return true;
    }
    return type == other.type && duration == other.duration;
  }

  @core.override
  core.String toString() {
    return "Animation(type: $type, duration: $duration)";
  }
}

/// Available animation types.
enum AnimationType {
  /// Smooth interpolation between start and finish states.
  Smooth,

  /// Movement with constant speed during animation time.
  Linear,
  ;
}
