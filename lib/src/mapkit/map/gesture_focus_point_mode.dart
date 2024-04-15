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

part 'gesture_focus_point_mode.containers.dart';

/// Specifies the way provided zoom focus point affects gestures.
@bindings_annotations.ContainerData(
    toNative: 'GestureFocusPointMode.toPointer',
    toPlatform:
        '(val) => GestureFocusPointMode.fromPointer(val, needFree: false)')
enum GestureFocusPointMode {
  /// Only "double tap" (zoom in) and "tap with two fingers" (zoom out) use
  /// provided gesture focus point. Other gestures ignore it and continue
  /// to use their source point for transformation.
  AffectsTapGestures,

  /// All gestures: pinch and stretch, tap and swipe, double tap, tap with
  /// two fingers, rotation use provided gesture focus point and ignore
  /// their source point. @attention Scroll is suppressed when this mode is
  /// on and "pinch and stretch" or "rotation" gesture performed
  AffectsAllGestures,
  ;

  /// @nodoc
  @internal
  static GestureFocusPointMode fromInt(core.int val) {
    return GestureFocusPointMode.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(GestureFocusPointMode e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static GestureFocusPointMode? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(GestureFocusPointMode? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
