import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'camera_update_reason.containers.dart';
part 'camera_update_reason.impl.dart';

/// The reason of the camera update.
enum CameraUpdateReason {
  /// User manipulation, for example: zoom, scroll, rotate, fling.
  Gestures,

  /// Application, by calling the map::move method.
  Application,
  ;
}
