import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'location_status.containers.dart';
part 'location_status.impl.dart';

/// Defines if the location is available or not.
enum LocationStatus {
  /// Location is not available.
  NotAvailable,

  /// Location is available.
  Available,

  /// Global location manager has been changed. Clients need to reset any
  /// state and checks related to location.
  Reset,
  ;
}
