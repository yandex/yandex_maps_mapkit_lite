part of 'location_manager.dart';

@bindings_annotations.ContainerData(
    toNative: 'LocationUseInBackgroundImpl.toPointer',
    toPlatform:
        '(val) => LocationUseInBackgroundImpl.fromPointer(val, needFree: false)',
    platformType: 'LocationUseInBackground')
extension LocationUseInBackgroundImpl on LocationUseInBackground {
  static core.int toInt(LocationUseInBackground e) {
    return e.index;
  }

  static LocationUseInBackground fromInt(core.int val) {
    return LocationUseInBackground.values[val];
  }

  static LocationUseInBackground? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(LocationUseInBackground? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

final class LocationSubscriptionSettingsNative extends ffi.Struct {
  @ffi.Int64()
  external core.int useInBackground;
  @ffi.Int64()
  external core.int purpose;
}

final LocationSubscriptionSettingsNative Function(core.int, core.int)
    _LocationSubscriptionSettingsNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    LocationSubscriptionSettingsNative Function(
                        ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_location_LocationSubscriptionSettings_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LocationSubscriptionSettingsImpl.toPointer',
    toPlatform:
        '(val) => LocationSubscriptionSettingsImpl.fromPointer(val, needFree: false)',
    platformType: 'LocationSubscriptionSettings')
extension LocationSubscriptionSettingsImpl on LocationSubscriptionSettings {
  static LocationSubscriptionSettings fromNative(
      LocationSubscriptionSettingsNative native) {
    return LocationSubscriptionSettings(
        LocationUseInBackgroundImpl.fromInt(native.useInBackground),
        mapkit_location_purpose.PurposeImpl.fromInt(native.purpose));
  }

  static LocationSubscriptionSettingsNative toNative(
      LocationSubscriptionSettings obj) {
    return _LocationSubscriptionSettingsNativeInit(
        LocationUseInBackgroundImpl.toInt(obj.useInBackground),
        mapkit_location_purpose.PurposeImpl.toInt(obj.purpose));
  }

  static LocationSubscriptionSettings? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = LocationSubscriptionSettingsImpl.fromNative(
        ptr.cast<LocationSubscriptionSettingsNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(LocationSubscriptionSettings? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LocationSubscriptionSettingsNative>();
    result.ref = toNative(val);

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
      LocationSubscriptionSettings subscriptionSettings,
      mapkit_location_location_listener.LocationListener locationListener) {
    _LocationManager_subscribeForLocationUpdates(
        ptr,
        LocationSubscriptionSettingsImpl.toNative(subscriptionSettings),
        mapkit_location_location_listener.LocationListenerImpl.getNativePtr(
            locationListener));
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
    LocationSubscriptionSettingsNative,
    ffi
        .Pointer<ffi.Void>) _LocationManager_subscribeForLocationUpdates = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>,
                    LocationSubscriptionSettingsNative,
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
