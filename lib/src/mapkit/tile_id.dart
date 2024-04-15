import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'tile_id.containers.dart';

/// @nodoc
final class TileIdNative extends ffi.Struct {
  @ffi.Uint32()
  external core.int x;
  @ffi.Uint32()
  external core.int y;
  @ffi.Uint32()
  external core.int z;
}

final TileIdNative Function(core.int, core.int, core.int) _TileIdNativeInit =
    lib.library
        .lookup<
            ffi.NativeFunction<
                TileIdNative Function(ffi.Uint32, ffi.Uint32,
                    ffi.Uint32)>>('yandex_flutter_mapkit_TileId_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'TileId.toPointer',
    toPlatform: '(val) => TileId.fromPointer(val, needFree: false)')
class TileId {
  final core.int x;
  final core.int y;
  final core.int z;

  const TileId({
    required this.x,
    required this.y,
    required this.z,
  });

  /// @nodoc
  @internal
  TileId.fromNative(TileIdNative native)
      : this(x: native.x, y: native.y, z: native.z);

  /// @nodoc
  @internal
  static TileIdNative toNative(TileId c) {
    return _TileIdNativeInit(c.x, c.y, c.z);
  }

  /// @nodoc
  @internal
  static TileId? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = TileId.fromNative(ptr.cast<TileIdNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(TileId? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<TileIdNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
