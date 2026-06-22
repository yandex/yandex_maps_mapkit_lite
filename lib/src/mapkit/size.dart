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

part 'size.containers.dart';
part 'size.impl.dart';

final class Size2u {
  final core.int width;
  final core.int height;

  const Size2u({
    required this.width,
    required this.height,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([width, height]);

  @core.override
  core.bool operator ==(covariant Size2u other) {
    if (core.identical(this, other)) {
      return true;
    }
    return width == other.width && height == other.height;
  }

  @core.override
  core.String toString() {
    return "Size2u(width: $width, height: $height)";
  }
}
