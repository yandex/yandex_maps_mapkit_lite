part of 'location_manager.dart';

@bindings_annotations.ContainerData(
    toNative: 'LocationFilteringModeImpl.toPointer',
    toPlatform:
        '(val) => LocationFilteringModeImpl.fromPointer(val, needFree: false)',
    platformType: 'LocationFilteringMode')
extension LocationFilteringModeImpl on LocationFilteringMode {
  static core.int toInt(LocationFilteringMode e) {
    return e.index;
  }

  static LocationFilteringMode fromInt(core.int val) {
    return LocationFilteringMode.values[val];
  }

  static LocationFilteringMode? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(LocationFilteringMode? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'LocationPurposeImpl.toPointer',
    toPlatform:
        '(val) => LocationPurposeImpl.fromPointer(val, needFree: false)',
    platformType: 'LocationPurpose')
extension LocationPurposeImpl on LocationPurpose {
  static core.int toInt(LocationPurpose e) {
    return e.index;
  }

  static LocationPurpose fromInt(core.int val) {
    return LocationPurpose.values[val];
  }

  static LocationPurpose? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(LocationPurpose? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'LocationManagerImpl.getNativePtr',
    toPlatform:
        '(val) => LocationManagerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'LocationManager')
class LocationManagerImpl implements LocationManager, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_LocationManager_free.cast());

  /// @nodoc
  LocationManagerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  LocationManagerImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(LocationManager? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as LocationManagerImpl).ptr;
  }

  @internal

  /// @nodoc
  static LocationManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LocationManagerImpl.fromNativePtr(ptr);
  }

  void subscribeForLocationUpdates(
    LocationFilteringMode filteringMode,
    LocationPurpose purpose,
    mapkit_location_location_listener.LocationListener locationListener, {
    required core.double desiredAccuracy,
    required core.int minTime,
    required core.double minDistance,
    required core.bool allowUseInBackground,
  }) {
    _LocationManager_subscribeForLocationUpdates(
      ptr,
      desiredAccuracy,
      minTime,
      minDistance,
      allowUseInBackground,
      LocationFilteringModeImpl.toInt(filteringMode),
      LocationPurposeImpl.toInt(purpose),
      mapkit_location_location_listener.LocationListenerImpl.getNativePtr(
          locationListener),
    );
  }

  void requestSingleUpdate(
      mapkit_location_location_listener.LocationListener locationListener) {
    _LocationManager_requestSingleUpdate(
        ptr,
        mapkit_location_location_listener.LocationListenerImpl.getNativePtr(
            locationListener));
  }

  void unsubscribe(
      mapkit_location_location_listener.LocationListener locationListener) {
    _LocationManager_unsubscribe(
        ptr,
        mapkit_location_location_listener.LocationListenerImpl.getNativePtr(
            locationListener));
  }

  void suspend() {
    _LocationManager_suspend(ptr);
  }

  void resume() {
    _LocationManager_resume(ptr);
  }
}

final _LocationManager_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationManager_free');

final void Function(
    ffi.Pointer<ffi.Void>,
    core.double,
    core.int,
    core.double,
    core.bool,
    core.int,
    core.int,
    ffi
        .Pointer<ffi.Void>) _LocationManager_subscribeForLocationUpdates = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>,
                    ffi.Double,
                    ffi.Int64,
                    ffi.Double,
                    ffi.Bool,
                    ffi.Int64,
                    ffi.Int64,
                    ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationManager_subscribeForLocationUpdates')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _LocationManager_requestSingleUpdate = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationManager_requestSingleUpdate')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _LocationManager_unsubscribe = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationManager_unsubscribe')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _LocationManager_suspend = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationManager_suspend')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _LocationManager_resume = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationManager_resume')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _LocationManager_set = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
        'yandex_flutter_mapkit_location_LocationManager_set_')
    .asFunction(isLeaf: true);

mapkit_location_location.Location? get _lastKnownLocation {
  return mapkit_location_location.LocationImpl.fromPointer(
      _LocationManagerUtils_get_lastKnownLocation());
}

final ffi.Pointer<ffi.Void> Function()
    _LocationManagerUtils_get_lastKnownLocation = lib.library
        .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function()>>(
            'yandex_flutter_mapkit_location_LocationManagerUtils_get_lastKnownLocation')
        .asFunction(isLeaf: true);
