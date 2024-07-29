import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:math' as math;
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

part 'rect.containers.dart';
part 'rect.impl.dart';

/// The rectangle to display on the map.

final class Rect {
  /// Minimum rectangle coordinates.
  final math.Point<core.double> min;

  /// Maximum rectangle coordinates.
  final math.Point<core.double> max;

  const Rect(this.min, this.max);

  @core.override
  core.int get hashCode => core.Object.hashAll([min, max]);

  @core.override
  core.bool operator ==(covariant Rect other) {
    if (core.identical(this, other)) {
      return true;
    }
    return min == other.min && max == other.max;
  }

  @core.override
  core.String toString() {
    return "Rect(min: $min, max: $max)";
  }
}
