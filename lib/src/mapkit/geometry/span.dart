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

part 'span.containers.dart';
part 'span.impl.dart';

/// The panorama field of view.

final class Span {
  /// The horizontal view angle.
  final core.double horizontalAngle;

  /// The vertical view angle.
  final core.double verticalAngle;

  const Span({
    required this.horizontalAngle,
    required this.verticalAngle,
  });

  @core.override
  core.int get hashCode =>
      core.Object.hashAll([horizontalAngle, verticalAngle]);

  @core.override
  core.bool operator ==(covariant Span other) {
    if (core.identical(this, other)) {
      return true;
    }
    return horizontalAngle == other.horizontalAngle &&
        verticalAngle == other.verticalAngle;
  }

  @core.override
  core.String toString() {
    return "Span(horizontalAngle: $horizontalAngle, verticalAngle: $verticalAngle)";
  }
}
