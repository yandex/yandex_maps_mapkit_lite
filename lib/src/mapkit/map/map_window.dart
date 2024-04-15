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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/gesture_focus_point_mode.dart'
    as mapkit_map_gesture_focus_point_mode;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map.dart'
    as mapkit_map_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/point_of_view.dart'
    as mapkit_map_point_of_view;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/size_changed_listener.dart'
    as mapkit_map_size_changed_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/visible_region.dart'
    as mapkit_map_visible_region;
import 'package:yandex_maps_mapkit_lite/src/mapkit/screen_types.dart'
    as mapkit_screen_types;

part 'map_window.containers.dart';

/// Handles the MapWindow element.
@bindings_annotations.WeakInterface('mapkit.map.MapWindow')
@bindings_annotations.ContainerData(
    toNative: 'MapWindow.getNativePtr',
    toPlatform:
        '(val) => MapWindow.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class MapWindow implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_MapWindow_free.cast());

  /// @nodoc
  MapWindow.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  MapWindow.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory MapWindow.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(MapWindow? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _MapWindow_check(ptr);
  }

  @internal

  /// @nodoc
  static MapWindow? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return MapWindow.fromNativePtr(ptr);
  }

  /// Gets the map interface.
  mapkit_map_map.Map get map {
    return mapkit_map_map.Map.fromNativePtr(_MapWindow_get_map(ptr));
  }

  /// When using controls that overlay the map view, calculating the proper
  /// camera position can be tricky. This property simplifies the task by
  /// defining the area of interest (the focus rectangle) inside the view.
  /// Map methods that calculate the camera position based on a world
  /// bounding box ensure that this bounding box will fit into the
  /// focusRect.
  ///
  /// For example, when using a semi-transparent control that overlays the
  /// top half of the map view, define the focus rectangle as the lower
  /// half of the view to ensure that object of interest appear in the
  /// lower half of map view. In addition, if focusPoint is null all camera
  /// movements will have the center of the lower half as their target.
  ///
  /// If focusRect is null, the whole map view is used instead.
  ///
  /// On iOS, if you change the focus rectangle in the
  /// viewDidLayoutSubviews callback, it's recommended to call
  /// MapView.layoutIfNeeded just before that action.
  ///
  mapkit_screen_types.ScreenRect? get focusRect {
    return mapkit_screen_types.ScreenRect.fromPointer(
        _MapWindow_get_focusRect(ptr));
  }

  set focusRect(mapkit_screen_types.ScreenRect? val) {
    return _MapWindow_set_focusRect(
        ptr, mapkit_screen_types.ScreenRect.toPointer(val));
  }

  /// The point on the screen that corresponds to camera position. Changing
  /// camera position or focusPoint makes the new camera target appear
  /// exactly at the focusPoint on screen.
  ///
  /// If focusPoint is null, the center of focusRect is used instead.
  ///
  mapkit_screen_types.ScreenPoint? get focusPoint {
    return mapkit_screen_types.ScreenPoint.fromPointer(
        _MapWindow_get_focusPoint(ptr));
  }

  set focusPoint(mapkit_screen_types.ScreenPoint? val) {
    return _MapWindow_set_focusPoint(
        ptr, mapkit_screen_types.ScreenPoint.toPointer(val));
  }

  /// Defines the focus point of gestures. Actual behaviour depends on
  /// gestureFocusPointMode. If the point is not set, the source point of
  /// the gesture will be used as the focus point. Default: none.
  ///
  mapkit_screen_types.ScreenPoint? get gestureFocusPoint {
    return mapkit_screen_types.ScreenPoint.fromPointer(
        _MapWindow_get_gestureFocusPoint(ptr));
  }

  set gestureFocusPoint(mapkit_screen_types.ScreenPoint? val) {
    return _MapWindow_set_gestureFocusPoint(
        ptr, mapkit_screen_types.ScreenPoint.toPointer(val));
  }

  /// Specifies the way provided gesture focus point affects gestures.
  /// Default: TapGestures.
  mapkit_map_gesture_focus_point_mode.GestureFocusPointMode
      get gestureFocusPointMode {
    return mapkit_map_gesture_focus_point_mode.GestureFocusPointMode.fromInt(
        _MapWindow_get_gestureFocusPointMode(ptr));
  }

  set gestureFocusPointMode(
      mapkit_map_gesture_focus_point_mode.GestureFocusPointMode val) {
    return _MapWindow_set_gestureFocusPointMode(ptr,
        mapkit_map_gesture_focus_point_mode.GestureFocusPointMode.toInt(val));
  }

  /// Defines the position of the point of view. Cameras use perspective
  /// projection, which causes perspective deformations. Perspective
  /// projection has an axis, and points on this axis are not affected by
  /// perspective deformations. This axis is a line parallel to the view's
  /// direction, so its projection to the screen is a point - the "point of
  /// view". By default, this point is at the center of the screen, but
  /// some applications might want to set it to the center of focusRect.
  /// Use this flag to do so. Default: ScreenCenter
  mapkit_map_point_of_view.PointOfView get pointOfView {
    return mapkit_map_point_of_view.PointOfView.fromInt(
        _MapWindow_get_pointOfView(ptr));
  }

  set pointOfView(mapkit_map_point_of_view.PointOfView val) {
    return _MapWindow_set_pointOfView(
        ptr, mapkit_map_point_of_view.PointOfView.toInt(val));
  }

  /// Gets the focused region.
  /// Return A region that corresponds to the current focusRect or the
  /// visible region if focusRect is not set. Region IS bounded by latitude
  /// limits \[-90, 90\] and IS NOT bounded by longitude limits \[-180,
  /// 180\]. If longitude exceeds its limits, we see the world's edge and
  /// another instance of the world beyond this edge.
  mapkit_map_visible_region.VisibleRegion get focusRegion {
    return mapkit_map_visible_region.VisibleRegion.fromNative(
        _MapWindow_get_focusRegion(ptr));
  }

  ///
  /// Defines the scale factor, which equals the number of pixels per
  /// device-independent point.
  core.double get scaleFactor {
    return _MapWindow_get_scaleFactor(ptr);
  }

  set scaleFactor(core.double val) {
    return _MapWindow_set_scaleFactor(ptr, val);
  }

  /// Window width in physical pixels
  core.int width() {
    return _MapWindow_width(ptr);
  }

  /// Window height in physical pixels
  core.int height() {
    return _MapWindow_height(ptr);
  }

  /// Transforms the position from world coordinates to screen coordinates.
  ///
  /// [worldPoint] Latitude and longitude information.
  ///
  /// Return The point in screen space corresponding to worldPoint; returns
  /// none if the point is behind the camera.
  mapkit_screen_types.ScreenPoint? worldToScreen(
      mapkit_geometry_point.Point worldPoint) {
    return mapkit_screen_types.ScreenPoint.fromPointer(_MapWindow_worldToScreen(
        ptr, mapkit_geometry_point.Point.toNative(worldPoint)));
  }

  /// Transforms coordinates from screen space to world space.
  ///
  /// [screenPoint] The point in screen coordinates relative to the top
  /// left of the map. These coordinates are in physical pixels and not in
  /// device independent (virtual) pixels.
  ///
  /// Return Latitude and longitude information.
  mapkit_geometry_point.Point? screenToWorld(
      mapkit_screen_types.ScreenPoint screenPoint) {
    return mapkit_geometry_point.Point.fromPointer(_MapWindow_screenToWorld(
        ptr, mapkit_screen_types.ScreenPoint.toNative(screenPoint)));
  }

  /// Adds a SizeChangedListener.
  ///
  /// The class does not retain the object in the 'sizeChangedListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addSizeChangedListener(
      mapkit_map_size_changed_listener.MapSizeChangedListener
          sizeChangedListener) {
    _MapWindow_addSizeChangedListener(
        ptr,
        mapkit_map_size_changed_listener.MapSizeChangedListener.getNativePtr(
            sizeChangedListener));
  }

  /// Removes a SizeChangedListener.
  void removeSizeChangedListener(
      mapkit_map_size_changed_listener.MapSizeChangedListener
          sizeChangedListener) {
    _MapWindow_removeSizeChangedListener(
        ptr,
        mapkit_map_size_changed_listener.MapSizeChangedListener.getNativePtr(
            sizeChangedListener));
  }
}

final _MapWindow_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapWindow_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _MapWindow_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapWindow_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _MapWindow_get_map =
    lib
        .library
        .lookup<
                ffi
                .NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_map')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapWindow_get_focusRect = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_focusRect')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_set_focusRect = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_focusRect')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapWindow_get_focusPoint = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_focusPoint')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_set_focusPoint = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_focusPoint')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapWindow_get_gestureFocusPoint = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_gestureFocusPoint')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_set_gestureFocusPoint = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_gestureFocusPoint')
        .asFunction();

final core.int Function(ffi.Pointer<ffi.Void>)
    _MapWindow_get_gestureFocusPointMode = lib.library
        .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_gestureFocusPointMode')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int)
    _MapWindow_set_gestureFocusPointMode = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_gestureFocusPointMode')
        .asFunction();

final core.int Function(ffi.Pointer<ffi.Void>) _MapWindow_get_pointOfView = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapWindow_get_pointOfView')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int)
    _MapWindow_set_pointOfView = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_pointOfView')
        .asFunction();

final mapkit_map_visible_region.VisibleRegionNative Function(
        ffi.Pointer<ffi.Void>) _MapWindow_get_focusRegion =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_visible_region.VisibleRegionNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_focusRegion')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _MapWindow_get_scaleFactor =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_scaleFactor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _MapWindow_set_scaleFactor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_scaleFactor')
        .asFunction();

final core.int Function(ffi.Pointer<ffi.Void>) _MapWindow_width = lib.library
    .lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapWindow_width')
    .asFunction();
final core.int Function(ffi.Pointer<ffi.Void>) _MapWindow_height = lib.library
    .lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapWindow_height')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)
    _MapWindow_worldToScreen = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_map_MapWindow_worldToScreen')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, mapkit_screen_types.ScreenPointNative)
    _MapWindow_screenToWorld = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                        mapkit_screen_types.ScreenPointNative)>>(
            'yandex_flutter_mapkit_map_MapWindow_screenToWorld')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_addSizeChangedListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_addSizeChangedListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_removeSizeChangedListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_removeSizeChangedListener')
        .asFunction();
