import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'purpose.containers.dart';
part 'purpose.impl.dart';

enum Purpose {
  /// This mode uses less resources and is the default.
  General,

  /// This mode is used to configure LocationManager for automotive
  /// navigation. Frequent location updates are desired even though more
  /// resources are used.
  AutomotiveNavigation,

  /// This mode is used to configure LocationManager for pedestrian
  /// navigation. Frequent location updates are desired even though more
  /// resources are used.
  PedestrianNavigation,

  /// This mode is used to configure LocationManager for bicycle
  /// navigation. Frequent location updates are desired even though more
  /// resources are used.
  BicycleNavigation,

  /// This mode is used to configure LocationManager for scooter
  /// navigation. Frequent location updates are desired even though more
  /// resources are used.
  ScooterNavigation,
  ;
}
