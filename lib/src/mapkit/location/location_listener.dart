import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location.dart'
    as mapkit_location_location;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location_status.dart'
    as mapkit_location_location_status;

part 'location_listener.impl.dart';

/// The listener that handles the updates to the device location.
abstract class LocationListener {
  /// Handle location update information,.
  void onLocationUpdated(mapkit_location_location.Location location);

  /// Handle change in location provider status.
  void onLocationStatusUpdated(
      mapkit_location_location_status.LocationStatus status);
}
