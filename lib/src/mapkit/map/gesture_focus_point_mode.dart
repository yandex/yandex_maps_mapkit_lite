import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'gesture_focus_point_mode.containers.dart';
part 'gesture_focus_point_mode.impl.dart';

/// Specifies the way provided zoom focus point affects gestures.
enum GestureFocusPointMode {
  /// Only "double tap" (zoom in) and "tap with two fingers" (zoom out) use
  /// provided gesture focus point. Other gestures ignore it and continue
  /// to use their source point for transformation.
  AffectsTapGestures,

  /// All gestures: pinch and stretch, tap and swipe, double tap, tap with
  /// two fingers, rotation use provided gesture focus point and ignore
  /// their source point. \@attention Scroll is suppressed when this mode
  /// is on and "pinch and stretch" or "rotation" gesture performed
  AffectsAllGestures,
  ;
}
