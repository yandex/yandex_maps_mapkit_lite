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

part 'map_type.containers.dart';

/// The type of map displayed.
@bindings_annotations.ContainerData(
    toNative: 'MapType.toPointer',
    toPlatform: '(val) => MapType.fromPointer(val, needFree: false)')
enum MapType {
  /// Do not use any of the predefined maps.
  None,

  /// Raster map.
  Map,

  /// Allowed only for Yandex apps Default satellite map.
  Satellite,

  /// Allowed only for Yandex apps Satellite map with roads, placemarks and
  /// labels.
  Hybrid,

  /// Vector map.
  VectorMap,
  ;

  /// @nodoc
  @internal
  static MapType fromInt(core.int val) {
    return MapType.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(MapType e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static MapType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(MapType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
