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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map.dart'
    as mapkit_map_map;

part 'input_listener.impl.dart';

/// Listener for user interactions with the map.
abstract class MapInputListener {
  /// Called when a tap occurred unless a tap was handled by geo objects or
  /// map objects. param@ position absolute screen coordinates
  void onMapTap(mapkit_map_map.Map map, mapkit_geometry_point.Point point);

  /// Called when a long tap occurred.
  void onMapLongTap(mapkit_map_map.Map map, mapkit_geometry_point.Point point);
}
