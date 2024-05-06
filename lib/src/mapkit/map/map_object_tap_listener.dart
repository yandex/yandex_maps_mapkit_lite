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
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as mapkit_map_map_object;

part 'map_object_tap_listener.impl.dart';

/// If an event is not handled by the source object then it's propagated
/// to its parent. This listener can be attached to any MapObject
/// including MapObjectCollection.
abstract class MapObjectTapListener {
  /// Returns true if the event was handled. The event will not be
  /// propagated to the parent. Returns false if the event wasn't handled.
  /// The event will be propagated to the parent.
  core.bool onMapObjectTap(mapkit_map_map_object.MapObject mapObject,
      mapkit_geometry_point.Point point);
}
