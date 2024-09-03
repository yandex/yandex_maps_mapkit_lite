import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/async.dart'
    show runWithBlockUi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as mapkit_map_map_object;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object_collection_listener.dart'
    as mapkit_map_map_object_collection_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object_visitor.dart'
    as mapkit_map_map_object_visitor;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;

part 'base_map_object_collection.containers.dart';
part 'base_map_object_collection.impl.dart';

abstract final class PlacemarkCreatedCallback {
  factory PlacemarkCreatedCallback(
      {required void Function(mapkit_map_placemark.PlacemarkMapObject placemark)
          onPlacemarkCreated}) {
    return PlacemarkCreatedCallbackImpl(
      onPlacemarkCreated: onPlacemarkCreated,
    );
  }

  /// Can be used to setup placemark style and position Will be called
  /// before MapObjectCollectionListener#onMapObjectAdded
  void onPlacemarkCreated(mapkit_map_placemark.PlacemarkMapObject placemark);
}

abstract class BaseMapObjectCollection
    implements mapkit_map_map_object.MapObject, ffi.Finalizable {
  /// Traverses through the collection with a visitor object. Used for
  /// iteration over map objects in the collection.
  ///
  /// The class does not retain the object in the 'mapObjectVisitor' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void traverse(
      mapkit_map_map_object_visitor.MapObjectVisitor mapObjectVisitor);

  /// Removes the given map object from the collection.
  void remove(mapkit_map_map_object.MapObject mapObject);

  /// Removes all map objects from the collection.
  void clear();

  /// Adds a listener to track notifications of changes to the collection.
  ///
  /// The class does not retain the object in the 'collectionListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addListener(
      mapkit_map_map_object_collection_listener.MapObjectCollectionListener
          collectionListener);

  /// Removes a listener.
  void removeListener(
      mapkit_map_map_object_collection_listener.MapObjectCollectionListener
          collectionListener);

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}
