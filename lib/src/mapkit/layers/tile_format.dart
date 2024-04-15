import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'tile_format.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'TileFormat.toPointer',
    toPlatform: '(val) => TileFormat.fromPointer(val, needFree: false)')
enum TileFormat {
  Png,
  Jpg,
  Vector2,
  Vector3,
  GeoJson,
  ;

  /// @nodoc
  @internal
  static TileFormat fromInt(core.int val) {
    return TileFormat.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(TileFormat e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static TileFormat? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(TileFormat? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
