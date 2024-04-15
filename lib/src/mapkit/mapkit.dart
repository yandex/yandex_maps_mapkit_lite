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

/// Provides access to all services in the SDK.
///
/// Initialize the MapKit factory before using this class.
///
/// @attention MapKit holds listener/delegate objects by weak references.
/// You need to have strong references to them somewhere in the client
/// code.
@bindings_annotations.WeakInterface('mapkit.MapKit')
@bindings_annotations.ContainerData(
    toNative: 'MapKit.getNativePtr',
    toPlatform:
        '(val) => MapKit.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class MapKit implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_MapKit_free.cast());

  /// @nodoc
  MapKit.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  MapKit.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory MapKit.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(MapKit? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _MapKit_check(ptr);
  }

  @internal

  /// @nodoc
  static MapKit? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return MapKit.fromNativePtr(ptr);
  }

  /// Returns a manager that handles offline maps, search index and road
  /// graph.
  /// @attention This feature is not available in the free MapKit version.
  mapkit_offline_cache_offline_cache_manager.OfflineCacheManager
      get offlineCacheManager {
    return mapkit_offline_cache_offline_cache_manager.OfflineCacheManager
        .fromNativePtr(_MapKit_get_offlineCacheManager(ptr));
  }

  /// Returns a manager that handles disk size and IO errors.
  mapkit_storage_storage_manager.StorageManager get storageManager {
    return mapkit_storage_storage_manager.StorageManager.fromNativePtr(
        _MapKit_get_storageManager(ptr));
  }

  /// Returns the version of the MapKit bundle.
  core.String get version {
    return to_platform.toPlatformString(_MapKit_get_version(ptr));
  }

  ///
  /// Sets the key for API access.
  ///
  /// [key] Key issued in the Developer Dashboard.
  void setApiKey(core.String key) {
    _MapKit_setApiKey(ptr, to_native.toNativeString(key));
  }

  /// Sets the user id. Don't use this method directly. Use
  /// `MapKitFactory.setUserId` instead.
  ///
  /// [id] User id is your own identifier for all mapkit requests
  void setUserId(core.String id) {
    _MapKit_setUserId(ptr, to_native.toNativeString(id));
  }

  /// Sets single global location manager that is used by every module in
  /// MapKit by default. The provided location manager must have async
  /// implementation in it. Any location manager created by MapKit has
  /// async implementation. To provide your own source of location please
  /// use [mapkit_location_dummy_location_manager.DummyLocationManager].
  /// Application can change location manager at any moment, all MapKit
  /// modules will start receiving new location immediately.
  void setLocationManager(
      mapkit_location_location_manager.LocationManager locationManager) {
    _MapKit_setLocationManager(
        ptr,
        mapkit_location_location_manager.LocationManager.getNativePtr(
            locationManager));
  }

  /// Resets the global location manager to a default one, that is a
  /// location manager that is created by [MapKit.createLocationManager]
  /// call.
  void resetLocationManagerToDefault() {
    _MapKit_resetLocationManagerToDefault(ptr);
  }

  /// Notifies MapKit when the application resumes the foreground state.
  void onStart() {
    _MapKit_onStart(ptr);
  }

  /// Notifies MapKit when the application pauses and goes to the
  /// background.
  void onStop() {
    _MapKit_onStop(ptr);
  }

  /// Creates a manager that allows to listen for device location updates.
  mapkit_location_location_manager.LocationManager createLocationManager() {
    return mapkit_location_location_manager.LocationManager.fromNativePtr(
        _MapKit_createLocationManager(ptr));
  }

  /// Creates a manager that allows to listen for device location updates,
  /// uses activityType as a hint.
  mapkit_location_location_manager.LocationManager
      createLocationManagerWithActivityType(
          runtime_sensors_sensors.LocationActivityType activityType) {
    return mapkit_location_location_manager.LocationManager.fromNativePtr(
        _MapKit_createLocationManagerWithActivityType(ptr,
            runtime_sensors_sensors.LocationActivityType.toInt(activityType)));
  }

  /// Creates a suspended LocationSimulator object with the given geometry.
  mapkit_location_location_simulator.LocationSimulator
      createLocationSimulatorWithGeometry(
          mapkit_geometry_geometry.Polyline geometry) {
    return mapkit_location_location_simulator.LocationSimulator.fromNativePtr(
        _MapKit_createLocationSimulatorWithGeometry(
            ptr, mapkit_geometry_geometry.Polyline.getNativePtr(geometry)));
  }

  /// Creates a suspended LocationSimulator object. Geometry must be set
  /// manually.
  mapkit_location_location_simulator.LocationSimulator
      createLocationSimulator() {
    return mapkit_location_location_simulator.LocationSimulator.fromNativePtr(
        _MapKit_createLocationSimulator(ptr));
  }

  /// Creates a manager that functions as a location proxy.
  mapkit_location_dummy_location_manager.DummyLocationManager
      createDummyLocationManager() {
    return mapkit_location_dummy_location_manager.DummyLocationManager
        .fromNativePtr(_MapKit_createDummyLocationManager(ptr));
  }

  ///
  /// Creates an internal "window" object that is used to show the map.
  ///
  /// Do not call this method - it is for internal use only. To show the
  /// map, please use the corresponding map "view" object.
  mapkit_map_map_window.MapWindow createMapWindow(
      platform_view.PlatformView platformView) {
    return mapkit_map_map_window.MapWindow.fromNativePtr(
        _MapKit_createMapWindow(
            ptr, to_native.toNativePlatformView(platformView)));
  }

  /// Creates the traffic layer.
  mapkit_traffic_traffic_layer.TrafficLayer createTrafficLayer(
      mapkit_map_map_window.MapWindow mapWindow) {
    return mapkit_traffic_traffic_layer.TrafficLayer.fromNativePtr(
        _MapKit_createTrafficLayer(
            ptr, mapkit_map_map_window.MapWindow.getNativePtr(mapWindow)));
  }

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
  }) {
    return mapkit_map_map_window.MapWindow.fromNativePtr(
        _MapKit_createMapWindowWithScale(ptr,
            to_native.toNativePlatformView(platformView), customScaleFactor));
  }

  /// Create layer with the user location icon.
  mapkit_user_location_user_location.UserLocationLayer createUserLocationLayer(
      mapkit_map_map_window.MapWindow mapWindow) {
    return mapkit_user_location_user_location.UserLocationLayer.fromNativePtr(
        _MapKit_createUserLocationLayer(
            ptr, mapkit_map_map_window.MapWindow.getNativePtr(mapWindow)));
  }
}

final _MapKit_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_MapKit_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _MapKit_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_MapKit_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapKit_get_offlineCacheManager = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_get_offlineCacheManager')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapKit_get_storageManager = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_get_storageManager')
        .asFunction();

final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _MapKit_get_version = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_get_version')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _MapKit_setApiKey = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_MapKit_setApiKey')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _MapKit_setUserId = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_MapKit_setUserId')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapKit_setLocationManager = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_setLocationManager')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>)
    _MapKit_resetLocationManagerToDefault = lib.library
        .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_resetLocationManagerToDefault')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _MapKit_onStart = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_MapKit_onStart')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _MapKit_onStop = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_MapKit_onStop')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapKit_createLocationManager = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_createLocationManager')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    core
        .int) _MapKit_createLocationManagerWithActivityType = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64)>>(
        'yandex_flutter_mapkit_MapKit_createLocationManagerWithActivityType')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapKit_createLocationSimulatorWithGeometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_createLocationSimulatorWithGeometry')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapKit_createLocationSimulator = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_createLocationSimulator')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapKit_createDummyLocationManager = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_createDummyLocationManager')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>) _MapKit_createMapWindow =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_createMapWindow')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapKit_createTrafficLayer = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_createTrafficLayer')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, core.double)
    _MapKit_createMapWindowWithScale = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_MapKit_createMapWindowWithScale')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapKit_createUserLocationLayer = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_MapKit_createUserLocationLayer')
        .asFunction();
