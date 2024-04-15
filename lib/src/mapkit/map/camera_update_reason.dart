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

part 'camera_update_reason.containers.dart';

/// The reason of the camera update.
@bindings_annotations.ContainerData(
    toNative: 'CameraUpdateReason.toPointer',
    toPlatform: '(val) => CameraUpdateReason.fromPointer(val, needFree: false)')
enum CameraUpdateReason {
  /// User manipulation, for example: zoom, scroll, rotate, fling.
  Gestures,

  /// Application, by calling the map::move method.
  Application,
  ;

  /// @nodoc
  @internal
  static CameraUpdateReason fromInt(core.int val) {
    return CameraUpdateReason.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(CameraUpdateReason e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static CameraUpdateReason? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(CameraUpdateReason? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
