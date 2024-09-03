import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/async.dart'
    show runWithBlockUi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/object_event.dart'
    as mapkit_layers_object_event;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location_view_source.dart'
    as mapkit_location_location_view_source;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/camera_position.dart'
    as mapkit_map_camera_position;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/circle.dart'
    as mapkit_map_circle;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;

part 'user_location.containers.dart';
part 'user_location.impl.dart';

/// Use this interface to specify the appearance of the user location
/// icon elements.
abstract class UserLocationView implements ffi.Finalizable {
  /// Gets the location arrow map object.
  mapkit_map_placemark.PlacemarkMapObject get arrow;

  /// Gets the location pin map object.
  mapkit_map_placemark.PlacemarkMapObject get pin;

  /// Gets the GPS accuracy circle map object.
  mapkit_map_circle.CircleMapObject get accuracyCircle;

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

/// The type of icon to use.
enum UserLocationIconType {
  /// Arrow icon.
  Arrow,

  /// Pin icon.
  Pin,
  ;
}

/// The type of anchor to use.
enum UserLocationAnchorType {
  /// Normal anchor.
  Normal,

  /// Course anchor.
  Course,
  ;
}

/// This event triggers when the user location icon type is changed.
abstract class UserLocationIconChanged
    implements mapkit_layers_object_event.ObjectEvent, ffi.Finalizable {
  /// Gets the type of user location icon used.
  UserLocationIconType get iconType;

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

/// Event for a change in the user location icon anchor.
abstract class UserLocationAnchorChanged
    implements mapkit_layers_object_event.ObjectEvent, ffi.Finalizable {
  /// Gets the type of anchor used.
  UserLocationAnchorType get anchorType;

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

/// User location events object listener. Use it to customize the user
/// location view. Although some callbacks are unused, the generic
/// structure of the interface is suitable for object layer listeners.
abstract class UserLocationObjectListener {
  /// Called when the layer object is added. It is called once when the
  /// user location icon appears the first time.
  void onObjectAdded(UserLocationView view);

  /// Called when the layer object is being removed. It is never called for
  /// the user location icon.
  void onObjectRemoved(UserLocationView view);

  /// Called when the layer object is being updated. The 'event' parameter
  /// can be one of the derived types.
  void onObjectUpdated(
      UserLocationView view, mapkit_layers_object_event.ObjectEvent event);
}

/// Triggered by a tap on the user location icon.
abstract class UserLocationTapListener {
  /// Called when the user taps a location object.
  void onUserLocationObjectTap(mapkit_geometry_point.Point point);
}

/// Use the UserLocationLayer interface to manage the location icon: its
/// appearance, following mode, data source and so on.
abstract class UserLocationLayer implements ffi.Finalizable {
  /// Enables/disables heading mode. If heading mode is enabled, the map is
  /// rotated. If heading mode is disabled, the location icon is rotated.
  core.bool get headingEnabled;
  set headingEnabled(core.bool val);

  /// Returns true if anchor mode is set, and false otherwise.
  core.bool get anchorEnabled;

  /// Enables/disables auto zoom.
  core.bool get autoZoomEnabled;
  set autoZoomEnabled(core.bool val);

  /// Sets user location visibility.
  void setVisible(core.bool on);

  /// Checks if user location is visible.
  core.bool isVisible();

  /// Sets the anchor to the specified position in pixels and enables
  /// Anchor mode. (0, 0) denotes the top-left corner of the screen.
  ///
  /// [anchorNormal] The anchor position when the app is not on a steady
  /// course; usually, the center of the screen.
  /// [anchorCourse] An anchor position near the bottom line for steady
  /// course mode.
  void setAnchor(math.Point<core.double> anchorNormal,
      math.Point<core.double> anchorCourse);

  /// Resets anchor mode.
  void resetAnchor();

  /// Calculates the camera position that projects the current location
  /// into view. If the current location is unknown, returns none. If the
  /// current location is known, returns the camera position that displays
  /// the location position.
  mapkit_map_camera_position.CameraPosition? cameraPosition();

  /// Sets/gets the data source.
  void setSource(
      mapkit_location_location_view_source.LocationViewSource? source);

  /// Sets the data source with the global location manager
  void setDefaultSource();

  /// Sets/resets the tap listener.
  ///
  /// The class does not retain the object in the 'tapListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setTapListener(UserLocationTapListener? tapListener);

  /// Sets/resets the object listener.
  ///
  /// The class does not retain the object in the 'objectListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setObjectListener(UserLocationObjectListener? objectListener);

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}
