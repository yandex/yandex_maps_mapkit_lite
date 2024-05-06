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
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as mapkit_map_map_object;

part 'map_object_collection_listener.impl.dart';

/// The map object collection can't be modified in callbacks. A
/// runtime::RuntimeError exception is thrown if this happens.
abstract class MapObjectCollectionListener {
  /// Called every time a new map object is added to the collection.
  void onMapObjectAdded(mapkit_map_map_object.MapObject mapObject);

  /// Called every time a map object is removed from the collection.
  void onMapObjectRemoved(mapkit_map_map_object.MapObject mapObject);
}
