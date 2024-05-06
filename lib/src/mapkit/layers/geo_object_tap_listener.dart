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
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/geo_object_tap_event.dart'
    as mapkit_layers_geo_object_tap_event;

part 'geo_object_tap_listener.impl.dart';

/// Retrieves the brief geoObject info when an object is tapped.
abstract class LayersGeoObjectTapListener {
  /// Listener that retrieves brief geoObject info for the tapped object.
  /// Returns false if the event wasn't handled. The event will be
  /// propagated to the map.
  core.bool onObjectTap(
      mapkit_layers_geo_object_tap_event.GeoObjectTapEvent event);
}
