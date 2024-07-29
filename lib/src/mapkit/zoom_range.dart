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

part 'zoom_range.containers.dart';
part 'zoom_range.impl.dart';

/// Describes the range of zoom levels. Zooming is allowed between zMin
/// and zMax values.

final class ZoomRangeIdl {
  /// Lower limit of zoom range, inclusive.
  final core.int zMin;

  /// Upper limit of zoom range, exclusive.
  final core.int zMax;

  const ZoomRangeIdl({
    required this.zMin,
    required this.zMax,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([zMin, zMax]);

  @core.override
  core.bool operator ==(covariant ZoomRangeIdl other) {
    if (core.identical(this, other)) {
      return true;
    }
    return zMin == other.zMin && zMax == other.zMax;
  }

  @core.override
  core.String toString() {
    return "ZoomRangeIdl(zMin: $zMin, zMax: $zMax)";
  }
}
