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

part 'screen_types.containers.dart';
part 'screen_types.impl.dart';

final class ScreenPoint {
  final core.double x;
  final core.double y;

  const ScreenPoint({
    required this.x,
    required this.y,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([x, y]);

  @core.override
  core.bool operator ==(covariant ScreenPoint other) {
    if (core.identical(this, other)) {
      return true;
    }
    return x == other.x && y == other.y;
  }

  @core.override
  core.String toString() {
    return "ScreenPoint(x: $x, y: $y)";
  }
}

final class ScreenRect {
  final ScreenPoint topLeft;
  final ScreenPoint bottomRight;

  const ScreenRect(this.topLeft, this.bottomRight);

  @core.override
  core.int get hashCode => core.Object.hashAll([topLeft, bottomRight]);

  @core.override
  core.bool operator ==(covariant ScreenRect other) {
    if (core.identical(this, other)) {
      return true;
    }
    return topLeft == other.topLeft && bottomRight == other.bottomRight;
  }

  @core.override
  core.String toString() {
    return "ScreenRect(topLeft: $topLeft, bottomRight: $bottomRight)";
  }
}
