import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/async.dart'
    show runWithBlockUi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
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
part 'map_window.impl.dart';

/// Handles the MapWindow element.
abstract class MapWindow implements ffi.Finalizable {
  /// Gets the map interface.
  mapkit_map_map.Map get map;

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
  mapkit_screen_types.ScreenRect? get focusRect;
  set focusRect(mapkit_screen_types.ScreenRect? val);

  /// The point on the screen that corresponds to camera position. Changing
  /// camera position or focusPoint makes the new camera target appear
  /// exactly at the focusPoint on screen.
  ///
  /// If focusPoint is null, the center of focusRect is used instead.
  ///
  mapkit_screen_types.ScreenPoint? get focusPoint;
  set focusPoint(mapkit_screen_types.ScreenPoint? val);

  /// Defines the focus point of gestures. Actual behaviour depends on
  /// gestureFocusPointMode. If the point is not set, the source point of
  /// the gesture will be used as the focus point. Default: none.
  ///
  mapkit_screen_types.ScreenPoint? get gestureFocusPoint;
  set gestureFocusPoint(mapkit_screen_types.ScreenPoint? val);

  /// Specifies the way provided gesture focus point affects gestures.
  /// Default: TapGestures.
  mapkit_map_gesture_focus_point_mode.GestureFocusPointMode
      get gestureFocusPointMode;
  set gestureFocusPointMode(
      mapkit_map_gesture_focus_point_mode.GestureFocusPointMode val);

  /// Defines the position of the point of view. Cameras use perspective
  /// projection, which causes perspective deformations. Perspective
  /// projection has an axis, and points on this axis are not affected by
  /// perspective deformations. This axis is a line parallel to the view's
  /// direction, so its projection to the screen is a point - the "point of
  /// view". By default, this point is at the center of the screen, but
  /// some applications might want to set it to the center of focusRect.
  /// Use this flag to do so. Default: ScreenCenter
  mapkit_map_point_of_view.PointOfView get pointOfView;
  set pointOfView(mapkit_map_point_of_view.PointOfView val);

  /// Gets the focused region.
  /// Return A region that corresponds to the current focusRect or the
  /// visible region if focusRect is not set. Region IS bounded by latitude
  /// limits \[-90, 90\] and IS NOT bounded by longitude limits \[-180,
  /// 180\]. If longitude exceeds its limits, we see the world's edge and
  /// another instance of the world beyond this edge.
  mapkit_map_visible_region.VisibleRegion get focusRegion;

  /// @nodoc
  /// Defines the scale factor, which equals the number of pixels per
  /// device-independent point.
  core.double get scaleFactor;
  set scaleFactor(core.double val);

  /// Window width in physical pixels
  core.int width();

  /// Window height in physical pixels
  core.int height();

  /// Transforms the position from world coordinates to screen coordinates.
  ///
  /// [worldPoint] Latitude and longitude information.
  ///
  /// Return The point in screen space corresponding to worldPoint; returns
  /// none if the point is behind the camera.
  mapkit_screen_types.ScreenPoint? worldToScreen(
      mapkit_geometry_point.Point worldPoint);

  /// Transforms coordinates from screen space to world space.
  ///
  /// [screenPoint] The point in screen coordinates relative to the top
  /// left of the map. These coordinates are in physical pixels and not in
  /// device independent (virtual) pixels.
  ///
  /// Return Latitude and longitude information.
  mapkit_geometry_point.Point? screenToWorld(
      mapkit_screen_types.ScreenPoint screenPoint);

  /// Adds a SizeChangedListener.
  ///
  /// The class does not retain the object in the 'sizeChangedListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addSizeChangedListener(
      mapkit_map_size_changed_listener.MapSizeChangedListener
          sizeChangedListener);

  /// Removes a SizeChangedListener.
  void removeSizeChangedListener(
      mapkit_map_size_changed_listener.MapSizeChangedListener
          sizeChangedListener);

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}
