import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'point_of_view.containers.dart';
part 'point_of_view.impl.dart';

/// The point of view.
enum PointOfView {
  /// Point of View is centered on the screen.
  ScreenCenter,

  /// Point of View has an x-coordinate at focusPoint and a y-coordinate at
  /// the center of the screen.
  AdaptToFocusPointHorizontally,
  ;
}
