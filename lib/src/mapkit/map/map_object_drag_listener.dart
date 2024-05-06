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

part 'map_object_drag_listener.impl.dart';

/// This listener is notified when a map object is being dragged. Note
/// that the map object's "draggable" property needs to be set to True in
/// order to activate dragging. A long tap on a map object activates
/// dragging mode.
abstract class MapObjectDragListener {
  /// Raised when dragging mode is active for the given map object.
  void onMapObjectDragStart(mapkit_map_map_object.MapObject mapObject);

  /// Raised when the user is moving a finger and the map object follows
  /// it.
  void onMapObjectDrag(mapkit_map_map_object.MapObject mapObject,
      mapkit_geometry_point.Point point);

  /// Raised when the user released the tap.
  void onMapObjectDragEnd(mapkit_map_map_object.MapObject mapObject);
}
