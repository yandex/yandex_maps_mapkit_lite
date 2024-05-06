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

part 'xy_point.containers.dart';
part 'xy_point.impl.dart';

final class XYPoint {
  final core.double x;
  final core.double y;

  const XYPoint({
    required this.x,
    required this.y,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([x, y]);

  @core.override
  core.bool operator ==(covariant XYPoint other) {
    if (core.identical(this, other)) {
      return true;
    }
    return x == other.x && y == other.y;
  }

  @core.override
  core.String toString() {
    return "XYPoint(x: $x, y: $y)";
  }
}
