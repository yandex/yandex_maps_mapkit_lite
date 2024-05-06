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

part 'alignment.containers.dart';
part 'alignment.impl.dart';

/// Horizontal logo alignment.
enum LogoHorizontalAlignment {
  /// Left alignment.
  Left,

  /// Center alignment.
  Center,

  /// Right alignment.
  Right,
  ;
}

/// Vertical logo alignment.
enum LogoVerticalAlignment {
  /// Top alignment.
  Top,

  /// Bottom alignment.
  Bottom,
  ;
}

final class LogoAlignment {
  final LogoHorizontalAlignment horizontalAlignment;
  final LogoVerticalAlignment verticalAlignment;

  const LogoAlignment(this.horizontalAlignment, this.verticalAlignment);

  @core.override
  core.int get hashCode =>
      core.Object.hashAll([horizontalAlignment, verticalAlignment]);

  @core.override
  core.bool operator ==(covariant LogoAlignment other) {
    if (core.identical(this, other)) {
      return true;
    }
    return horizontalAlignment == other.horizontalAlignment &&
        verticalAlignment == other.verticalAlignment;
  }

  @core.override
  core.String toString() {
    return "LogoAlignment(horizontalAlignment: $horizontalAlignment, verticalAlignment: $verticalAlignment)";
  }
}
