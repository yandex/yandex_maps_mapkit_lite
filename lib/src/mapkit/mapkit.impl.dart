part of 'mapkit.dart';

@bindings_annotations.WeakInterface('mapkit.MapKit')
@bindings_annotations.ContainerData(
    toNative: 'MapKitImpl.getNativePtr',
    toPlatform:
        '(val) => MapKitImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'MapKit')
class MapKitImpl implements MapKit, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_MapKit_free.cast());

  /// @nodoc
  MapKitImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  MapKitImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory MapKitImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(MapKit? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as MapKitImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _MapKit_check(ptr);
  }

  @internal

  /// @nodoc
  static MapKit? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return MapKitImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_offline_cache_offline_cache_manager.OfflineCacheManager
      get offlineCacheManager {
    return mapkit_offline_cache_offline_cache_manager.OfflineCacheManagerImpl
        .fromNativePtr(_MapKit_get_offlineCacheManager(ptr));
  }

  @core.override
  mapkit_storage_storage_manager.StorageManager get storageManager {
    return mapkit_storage_storage_manager.StorageManagerImpl.fromNativePtr(
        _MapKit_get_storageManager(ptr));
  }

  @core.override
  core.String get version {
    return to_platform.toPlatformString(_MapKit_get_version(ptr));
  }

  void setApiKey(core.String key) {
    _MapKit_setApiKey(ptr, to_native.toNativeString(key));
  }

  void setUserId(core.String id) {
    _MapKit_setUserId(ptr, to_native.toNativeString(id));
  }

  void setLocationManager(
      mapkit_location_location_manager.LocationManager locationManager) {
    _MapKit_setLocationManager(
        ptr,
        mapkit_location_location_manager.LocationManagerImpl.getNativePtr(
            locationManager));
  }

  void resetLocationManagerToDefault() {
    _MapKit_resetLocationManagerToDefault(ptr);
  }

  void onStart() {
    _MapKit_onStart(ptr);
  }

  void onStop() {
    _MapKit_onStop(ptr);
  }

  mapkit_location_location_manager.LocationManager createLocationManager() {
    return mapkit_location_location_manager.LocationManagerImpl.fromNativePtr(
        _MapKit_createLocationManager(ptr));
  }

  mapkit_location_location_simulator.LocationSimulator
      createLocationSimulatorWithGeometry(
          mapkit_geometry_geometry.Polyline geometry) {
    return mapkit_location_location_simulator.LocationSimulatorImpl
        .fromNativePtr(_MapKit_createLocationSimulatorWithGeometry(
            ptr, mapkit_geometry_geometry.PolylineImpl.getNativePtr(geometry)));
  }

  mapkit_location_location_simulator.LocationSimulator
      createLocationSimulator() {
    return mapkit_location_location_simulator.LocationSimulatorImpl
        .fromNativePtr(_MapKit_createLocationSimulator(ptr));
  }

  mapkit_location_dummy_location_manager.DummyLocationManager
      createDummyLocationManager() {
    return mapkit_location_dummy_location_manager.DummyLocationManagerImpl
        .fromNativePtr(_MapKit_createDummyLocationManager(ptr));
  }

  mapkit_map_map_window.MapWindow createMapWindow(
      platform_view.PlatformView platformView) {
    return mapkit_map_map_window.MapWindowImpl.fromNativePtr(
        _MapKit_createMapWindow(
            ptr, to_native.toNativePlatformView(platformView)));
  }

  mapkit_traffic_traffic_layer.TrafficLayer createTrafficLayer(
      mapkit_map_map_window.MapWindow mapWindow) {
    return mapkit_traffic_traffic_layer.TrafficLayerImpl.fromNativePtr(
        _MapKit_createTrafficLayer(
            ptr, mapkit_map_map_window.MapWindowImpl.getNativePtr(mapWindow)));
  }

  mapkit_map_map_window.MapWindow createMapWindowWithScale(
    platform_view.PlatformView platformView, {
    required core.double customScaleFactor,
  }) {
    return mapkit_map_map_window.MapWindowImpl.fromNativePtr(
        _MapKit_createMapWindowWithScale(ptr,
            to_native.toNativePlatformView(platformView), customScaleFactor));
  }

  mapkit_user_location_user_location.UserLocationLayer createUserLocationLayer(
      mapkit_map_map_window.MapWindow mapWindow) {
    return mapkit_user_location_user_location.UserLocationLayerImpl
        .fromNativePtr(_MapKit_createUserLocationLayer(
            ptr, mapkit_map_map_window.MapWindowImpl.getNativePtr(mapWindow)));
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
final void Function(ffi.Pointer<ffi.Void>, core.int) _MapKit_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_MapKit_set_')
    .asFunction(isLeaf: true);
