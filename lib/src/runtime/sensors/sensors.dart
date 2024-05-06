import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'sensors.containers.dart';
part 'sensors.impl.dart';

enum LocationActivityType {
  /// Auto activity type detect
  AutoDetect,

  /// Activity type for car navigation
  Car,

  /// Activity type for pedestrian navigation
  Pedestrian,

  /// Activity type without any hint
  Other,
  ;
}
