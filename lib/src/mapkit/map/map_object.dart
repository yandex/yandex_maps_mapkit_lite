import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
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
import 'package:yandex_maps_mapkit_lite/src/mapkit/animation.dart'
    as mapkit_animation;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/base_map_object_collection.dart'
    as mapkit_map_base_map_object_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/callback.dart'
    as mapkit_map_callback;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object_drag_listener.dart'
    as mapkit_map_map_object_drag_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object_tap_listener.dart'
    as mapkit_map_map_object_tap_listener;

part 'map_object.containers.dart';
part 'map_object.impl.dart';

/// An object displayed on the map.
abstract class MapObject implements ffi.Finalizable {
  /// Returns the collection of map objects that the current map object
  /// belongs to.
  mapkit_map_base_map_object_collection.BaseMapObjectCollection get parent;

  /// Manages visibility of the object on the map. Default: true.
  core.bool get visible;
  set visible(core.bool val);

  /// Gets the z-index, which affects: <ul><li>Rendering order.</li>
  /// <li>Dispatching of UI events (taps and drags are dispatched to
  /// objects with higher z-indexes first).</li></ul> Z-index is relative
  /// to the parent.
  core.double get zIndex;
  set zIndex(core.double val);

  /// If true, the map object can be dragged by the user. Default: false.
  core.bool get draggable;
  set draggable(core.bool val);

  /// Manages visibility of the object.
  ///
  /// [animation] Describes the transition between visible and not visible
  /// states.
  /// [onFinished] Called when the transition is finished.
  void setVisible(
    mapkit_animation.Animation animation, {
    required core.bool visible,
    mapkit_map_callback.Callback? onFinished,
  });

  /// Adds a tap listener to the object.
  ///
  /// The class does not retain the object in the 'tapListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addTapListener(
      mapkit_map_map_object_tap_listener.MapObjectTapListener tapListener);

  /// Removes the tap listener from the object.
  void removeTapListener(
      mapkit_map_map_object_tap_listener.MapObjectTapListener tapListener);

  /// Sets a drag listener for the object. Each object can only have one
  /// drag listener.
  ///
  /// The class does not retain the object in the 'dragListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setDragListener(
      mapkit_map_map_object_drag_listener.MapObjectDragListener? dragListener);

  core.Object? get userData;
  set userData(core.Object? val);
  core.bool isValid();
}
