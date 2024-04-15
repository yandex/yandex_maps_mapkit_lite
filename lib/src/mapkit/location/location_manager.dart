import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location.dart'
    as mapkit_location_location;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location_listener.dart'
    as mapkit_location_location_listener;

part 'location_manager.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'LocationFilteringMode.toPointer',
    toPlatform:
        '(val) => LocationFilteringMode.fromPointer(val, needFree: false)')
enum LocationFilteringMode {
  /// Locations should be filtered (no unrealistic or spoofed locations, or
  /// locations from the past).
  On,

  /// Only invalid (that is zero) locations should be filtered.
  Off,
  ;

  /// @nodoc
  @internal
  static LocationFilteringMode fromInt(core.int val) {
    return LocationFilteringMode.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(LocationFilteringMode e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static LocationFilteringMode? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(LocationFilteringMode? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

/// Handles location updates and changes.
@bindings_annotations.ContainerData(
    toNative: 'LocationManager.getNativePtr',
    toPlatform:
        '(val) => LocationManager.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class LocationManager implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_LocationManager_free.cast());

  /// @nodoc
  LocationManager.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  LocationManager.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(LocationManager? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  @internal

  /// @nodoc
  static LocationManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LocationManager.fromNativePtr(ptr);
  }

  /// Subscribe for location update events. If the listener was already
  /// subscribed to updates from the LocationManager, subscription settings
  /// will be updated. Use desiredAccuracy = 0 to obtain best possible
  /// accuracy, minTime = 0 to ignore minTime and use minDistance instead,
  /// minDistance = 0 to use only minTime. If both minTime and minDistance
  /// are set to zero, the subscription will use the same settings as other
  /// LocationManager clients.
  ///
  /// The class does not retain the object in the 'locationListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  ///
  /// [desiredAccuracy] Desired location accuracy, in meters. This value is
  /// used to configure location services provided by the host OS. If
  /// locations with the desired accuracy are not available, updates may be
  /// called with lower accuracy.
  /// [minTime] Minimal time interval between events, in milliseconds.
  /// [minDistance] Minimal distance between location updates, in meters.
  /// [allowUseInBackground] Defines whether the subscription can continue
  /// to fetch notifications when the application is inactive. If
  /// allowUseInBackground is true, set the `location` flag in
  /// `UIBackgroundModes` for your application.
  /// [filteringMode] Defines whether locations should be filtered.
  /// [locationListener] Location update listener.
  void subscribeForLocationUpdates(
    LocationFilteringMode filteringMode,
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
      LocationFilteringMode.toInt(filteringMode),
      mapkit_location_location_listener.LocationListener.getNativePtr(
          locationListener),
    );
  }

  /// Subscribe to a single location update. If the listener was already
  /// subscribed to location updates, the previous subscription will be
  /// removed.
  ///
  /// The class does not retain the object in the 'locationListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  ///
  /// [locationListener] Location update listener.
  void requestSingleUpdate(
      mapkit_location_location_listener.LocationListener locationListener) {
    _LocationManager_requestSingleUpdate(
        ptr,
        mapkit_location_location_listener.LocationListener.getNativePtr(
            locationListener));
  }

  /// Unsubscribe from location update events. Can be called for either
  /// [LocationManager.subscribeForLocationUpdates] or
  /// [LocationManager.requestSingleUpdate]. For
  /// [LocationManager.requestSingleUpdate], if an event was already
  /// received, [LocationManager.unsubscribe] does not have any effect. If
  /// the listener is already unsubscribed, the method call is ignored.
  ///
  /// The class does not retain the object in the 'locationListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  ///
  /// [locationListener] Listener passed to either
  /// [LocationManager.subscribeForLocationUpdates] or
  /// [LocationManager.requestSingleUpdate].
  void unsubscribe(
      mapkit_location_location_listener.LocationListener locationListener) {
    _LocationManager_unsubscribe(
        ptr,
        mapkit_location_location_listener.LocationListener.getNativePtr(
            locationListener));
  }

  /// Stops updates for all subscriptions until resume() is called.
  void suspend() {
    _LocationManager_suspend(ptr);
  }

  /// Resumes updates stopped by a suspend() call.
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
    ffi
        .Pointer<ffi.Void>) _LocationManager_subscribeForLocationUpdates = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Double, ffi.Int64,
                    ffi.Double, ffi.Bool, ffi.Int64, ffi.Pointer<ffi.Void>)>>(
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

class LocationManagerUtils {
  LocationManagerUtils._();

  /// Last known location, if one was ever received.
  ///
  static mapkit_location_location.Location? get lastKnownLocation {
    return mapkit_location_location.Location.fromPointer(
        _LocationManagerUtils_get_lastKnownLocation());
  }
}

final ffi.Pointer<ffi.Void> Function()
    _LocationManagerUtils_get_lastKnownLocation = lib.library
        .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function()>>(
            'yandex_flutter_mapkit_location_LocationManagerUtils_get_lastKnownLocation')
        .asFunction(isLeaf: true);
