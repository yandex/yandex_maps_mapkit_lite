import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/view/platform_view.dart'
    as platform_view;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/dummy_location_manager.dart'
    as mapkit_location_dummy_location_manager;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location_manager.dart'
    as mapkit_location_location_manager;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location_simulator.dart'
    as mapkit_location_location_simulator;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_window.dart'
    as mapkit_map_map_window;
import 'package:yandex_maps_mapkit_lite/src/mapkit/offline_cache/offline_cache_manager.dart'
    as mapkit_offline_cache_offline_cache_manager;
import 'package:yandex_maps_mapkit_lite/src/mapkit/storage/storage_manager.dart'
    as mapkit_storage_storage_manager;
import 'package:yandex_maps_mapkit_lite/src/mapkit/traffic/traffic_layer.dart'
    as mapkit_traffic_traffic_layer;
import 'package:yandex_maps_mapkit_lite/src/mapkit/user_location/user_location.dart'
    as mapkit_user_location_user_location;
import 'package:yandex_maps_mapkit_lite/src/runtime/sensors/sensors.dart'
    as runtime_sensors_sensors;

part 'mapkit.containers.dart';
part 'mapkit.impl.dart';

/// Provides access to all services in the SDK.
///
/// Initialize the MapKit factory before using this class.
///
/// @attention MapKit holds listener/delegate objects by weak references.
/// You need to have strong references to them somewhere in the client
/// code.
abstract class MapKit implements ffi.Finalizable {
  /// Returns a manager that handles offline maps, search index and road
  /// graph.
  /// @attention This feature is not available in the free MapKit version.
  mapkit_offline_cache_offline_cache_manager.OfflineCacheManager
      get offlineCacheManager;

  /// Returns a manager that handles disk size and IO errors.
  mapkit_storage_storage_manager.StorageManager get storageManager;

  /// Returns the version of the MapKit bundle.
  core.String get version;

  ///
  /// Sets the key for API access.
  ///
  /// [key] Key issued in the Developer Dashboard.
  void setApiKey(core.String key);

  /// Sets the user id. Don't use this method directly. Use
  /// `MapKitFactory.setUserId` instead.
  ///
  /// [id] User id is your own identifier for all mapkit requests
  void setUserId(core.String id);

  /// Sets single global location manager that is used by every module in
  /// MapKit by default. The provided location manager must have async
  /// implementation in it. Any location manager created by MapKit has
  /// async implementation. To provide your own source of location please
  /// use [mapkit_location_dummy_location_manager.DummyLocationManager].
  /// Application can change location manager at any moment, all MapKit
  /// modules will start receiving new location immediately.
  void setLocationManager(
      mapkit_location_location_manager.LocationManager locationManager);

  /// Resets the global location manager to a default one, that is a
  /// location manager that is created by [MapKit.createLocationManager]
  /// call.
  void resetLocationManagerToDefault();

  /// Notifies MapKit when the application resumes the foreground state.
  void onStart();

  /// Notifies MapKit when the application pauses and goes to the
  /// background.
  void onStop();

  /// Creates a manager that allows to listen for device location updates.
  mapkit_location_location_manager.LocationManager createLocationManager();

  /// Creates a manager that allows to listen for device location updates,
  /// uses activityType as a hint.
  mapkit_location_location_manager.LocationManager
      createLocationManagerWithActivityType(
          runtime_sensors_sensors.LocationActivityType activityType);

  /// Creates a suspended LocationSimulator object with the given geometry.
  mapkit_location_location_simulator.LocationSimulator
      createLocationSimulatorWithGeometry(
          mapkit_geometry_geometry.Polyline geometry);

  /// Creates a suspended LocationSimulator object. Geometry must be set
  /// manually.
  mapkit_location_location_simulator.LocationSimulator
      createLocationSimulator();

  /// Creates a manager that functions as a location proxy.
  mapkit_location_dummy_location_manager.DummyLocationManager
      createDummyLocationManager();

  ///
  /// Creates an internal "window" object that is used to show the map.
  ///
  /// Do not call this method - it is for internal use only. To show the
  /// map, please use the corresponding map "view" object.
  mapkit_map_map_window.MapWindow createMapWindow(
      platform_view.PlatformView platformView);

  /// Creates the traffic layer.
  mapkit_traffic_traffic_layer.TrafficLayer createTrafficLayer(
      mapkit_map_map_window.MapWindow mapWindow);

  ///
  /// Creates an internal "window" object that is used to show the map with
  /// a custom scale factor. The scale factor is equal to the number of
  /// pixels per device-independent point.
  ///
  /// Do not call this method - it is for internal use only. To show the
  /// map, please use the corresponding map "view" object.
  mapkit_map_map_window.MapWindow createMapWindowWithScale(
    platform_view.PlatformView platformView, {
    required core.double customScaleFactor,
  });

  /// Create layer with the user location icon.
  mapkit_user_location_user_location.UserLocationLayer createUserLocationLayer(
      mapkit_map_map_window.MapWindow mapWindow);
}
