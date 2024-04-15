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

part 'zoom_range.containers.dart';

/// @nodoc
final class ZoomRangeIdlNative extends ffi.Struct {
  @ffi.Uint32()
  external core.int zMin;
  @ffi.Uint32()
  external core.int zMax;
}

final ZoomRangeIdlNative Function(core.int, core.int) _ZoomRangeIdlNativeInit =
    lib.library
        .lookup<
            ffi.NativeFunction<
                ZoomRangeIdlNative Function(ffi.Uint32,
                    ffi.Uint32)>>('yandex_flutter_mapkit_ZoomRangeIdl_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ZoomRangeIdl.toPointer',
    toPlatform: '(val) => ZoomRangeIdl.fromPointer(val, needFree: false)')
class ZoomRangeIdl {
  final core.int zMin;
  final core.int zMax;

  const ZoomRangeIdl({
    required this.zMin,
    required this.zMax,
  });

  /// @nodoc
  @internal
  ZoomRangeIdl.fromNative(ZoomRangeIdlNative native)
      : this(zMin: native.zMin, zMax: native.zMax);

  /// @nodoc
  @internal
  static ZoomRangeIdlNative toNative(ZoomRangeIdl c) {
    return _ZoomRangeIdlNativeInit(c.zMin, c.zMax);
  }

  /// @nodoc
  @internal
  static ZoomRangeIdl? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = ZoomRangeIdl.fromNative(ptr.cast<ZoomRangeIdlNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(ZoomRangeIdl? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ZoomRangeIdlNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
