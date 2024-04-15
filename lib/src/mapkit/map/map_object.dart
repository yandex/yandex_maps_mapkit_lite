import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
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

/// An object displayed on the map.
@bindings_annotations.WeakInterface('mapkit.map.MapObject')
@bindings_annotations.ContainerData(
    toNative: 'MapObject.getNativePtr',
    toPlatform:
        '(val) => MapObject.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class MapObject implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_MapObject_free.cast());

  /// @nodoc
  MapObject.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  MapObject.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory MapObject.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(MapObject? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _MapObject_check(ptr);
  }

  @internal

  /// @nodoc
  static MapObject? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return MapObject.fromNativePtr(ptr);
  }

  /// Returns the collection of map objects that the current map object
  /// belongs to.
  mapkit_map_base_map_object_collection.BaseMapObjectCollection get parent {
    return mapkit_map_base_map_object_collection.BaseMapObjectCollection
        .fromNativePtr(_MapObject_get_parent(ptr));
  }

  /// Manages visibility of the object on the map. Default: true.
  core.bool get visible {
    return _MapObject_get_visible(ptr);
  }

  set visible(core.bool val) {
    return _MapObject_set_visible(ptr, val);
  }

  /// Gets the z-index, which affects: <ul><li>Rendering order.</li>
  /// <li>Dispatching of UI events (taps and drags are dispatched to
  /// objects with higher z-indexes first).</li></ul> Z-index is relative
  /// to the parent.
  core.double get zIndex {
    return _MapObject_get_zIndex(ptr);
  }

  set zIndex(core.double val) {
    return _MapObject_set_zIndex(ptr, val);
  }

  /// If true, the map object can be dragged by the user. Default: false.
  core.bool get draggable {
    return _MapObject_get_draggable(ptr);
  }

  set draggable(core.bool val) {
    return _MapObject_set_draggable(ptr, val);
  }

  /// Manages visibility of the object.
  ///
  /// [animation] Describes the transition between visible and not visible
  /// states.
  /// [onFinished] Called when the transition is finished.
  void setVisible(
    mapkit_animation.Animation animation, {
    required core.bool visible,
    mapkit_map_callback.Callback? onFinished,
  }) {
    _MapObject_setVisible(
        ptr,
        visible,
        mapkit_animation.Animation.toNative(animation),
        mapkit_map_callback.Callback.getNativePtr(onFinished));
  }

  /// Adds a tap listener to the object.
  ///
  /// The class does not retain the object in the 'tapListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addTapListener(
      mapkit_map_map_object_tap_listener.MapObjectTapListener tapListener) {
    _MapObject_addTapListener(
        ptr,
        mapkit_map_map_object_tap_listener.MapObjectTapListener.getNativePtr(
            tapListener));
  }

  /// Removes the tap listener from the object.
  void removeTapListener(
      mapkit_map_map_object_tap_listener.MapObjectTapListener tapListener) {
    _MapObject_removeTapListener(
        ptr,
        mapkit_map_map_object_tap_listener.MapObjectTapListener.getNativePtr(
            tapListener));
  }

  /// Sets a drag listener for the object. Each object can only have one
  /// drag listener.
  ///
  /// The class does not retain the object in the 'dragListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setDragListener(
      mapkit_map_map_object_drag_listener.MapObjectDragListener? dragListener) {
    _MapObject_setDragListener(
        ptr,
        mapkit_map_map_object_drag_listener.MapObjectDragListener.getNativePtr(
            dragListener));
  }
}

final _MapObject_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObject_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _MapObject_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObject_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapObject_get_parent = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObject_get_parent')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _MapObject_get_visible = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObject_get_visible')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool) _MapObject_set_visible =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_MapObject_set_visible')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _MapObject_get_zIndex = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObject_get_zIndex')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double) _MapObject_set_zIndex =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_MapObject_set_zIndex')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _MapObject_get_draggable = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObject_get_draggable')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool) _MapObject_set_draggable =
    lib
        .library
        .lookup<
                ffi
                .NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_MapObject_set_draggable')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, core.bool,
        mapkit_animation.AnimationNative, ffi.Pointer<ffi.Void>)
    _MapObject_setVisible = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Bool,
                        mapkit_animation.AnimationNative,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObject_setVisible')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapObject_addTapListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObject_addTapListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapObject_removeTapListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObject_removeTapListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapObject_setDragListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObject_setDragListener')
        .asFunction();
