import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'map_type.containers.dart';
part 'map_type.impl.dart';

/// The type of map displayed.
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
}
