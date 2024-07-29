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

part 'tile_id.containers.dart';
part 'tile_id.impl.dart';

/// The ID of a tile on the map.

final class TileId {
  /// The number of the tile horizontally.
  final core.int x;

  /// The number of the tile vertically.
  final core.int y;

  /// The number of columns and rows to split the map into.
  final core.int z;

  const TileId({
    required this.x,
    required this.y,
    required this.z,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([x, y, z]);

  @core.override
  core.bool operator ==(covariant TileId other) {
    if (core.identical(this, other)) {
      return true;
    }
    return x == other.x && y == other.y && z == other.z;
  }

  @core.override
  core.String toString() {
    return "TileId(x: $x, y: $y, z: $z)";
  }
}
