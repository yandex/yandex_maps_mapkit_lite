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
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/camera_position.dart'
    as mapkit_map_camera_position;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/camera_update_reason.dart'
    as mapkit_map_camera_update_reason;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map.dart'
    as mapkit_map_map;

part 'camera_listener.impl.dart';

/// Listens for updates to the camera position.
abstract class MapCameraListener {
  /// Triggered when the camera position changed.
  ///
  /// [map] Event source.
  /// [cameraPosition] Current camera position.
  /// [cameraUpdateReason] The reason of camera update.
  /// [finished] True if the camera finished moving, false otherwise. If a
  /// movement is cancelled then cameraUpdateReason represents initiator of
  /// cancellation.
  void onCameraPositionChanged(
      mapkit_map_map.Map map,
      mapkit_map_camera_position.CameraPosition cameraPosition,
      mapkit_map_camera_update_reason.CameraUpdateReason cameraUpdateReason,
      core.bool finished);
}
