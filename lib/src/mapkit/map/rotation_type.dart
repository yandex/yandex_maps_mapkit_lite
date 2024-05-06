import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'rotation_type.containers.dart';
part 'rotation_type.impl.dart';

/// The way rotation is handled.
enum RotationType {
  /// Ignores the placemark direction; stable in screen space.
  NoRotation,

  /// Follows the placemark direction. For non-flat placemarks, the
  /// direction vector is projected onto the screen plane.
  Rotate,
  ;
}
