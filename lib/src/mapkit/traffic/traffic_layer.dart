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
import 'package:yandex_maps_mapkit_lite/src/mapkit/traffic/traffic_listener.dart'
    as mapkit_traffic_traffic_listener;

part 'traffic_layer.containers.dart';
part 'traffic_layer.impl.dart';

/// A layer with traffic information.
abstract class TrafficLayer implements ffi.Finalizable {
  /// Checks if traffic is visible.
  core.bool isTrafficVisible();

  /// Sets traffic visibility.
  void setTrafficVisible(core.bool on);

  /// Applies JSON style transformations to the traffic layer. Same as
  /// setTrafficStyle(0, style). Set to empty string to clear previous
  /// styling. Returns true if the style was successfully parsed; false
  /// otherwise. If the return value is false, the current traffic style
  /// remains unchanged.
  core.bool setTrafficStyle(core.String style);

  /// Applies JSON style transformations to the traffic layer. Replaces
  /// previous styling with the specified ID (if such exists). Stylings are
  /// applied in an ascending order. Set to empty string to clear previous
  /// styling with the specified ID. Returns true if the style was
  /// successfully parsed; false otherwise. If the return value is false,
  /// the current traffic style remains unchanged.
  core.bool setTrafficStyleWithId({
    required core.int id,
    required core.String style,
  });

  /// Resets all JSON style transformations applied to the traffic layer.
  void resetTrafficStyles();

  /// Adds a traffic listener.
  ///
  /// The class does not retain the object in the 'trafficListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addTrafficListener(
      mapkit_traffic_traffic_listener.TrafficListener trafficListener);

  /// Removes a traffic listener.
  void removeTrafficListener(
      mapkit_traffic_traffic_listener.TrafficListener trafficListener);

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}
