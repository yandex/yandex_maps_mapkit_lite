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
part 'location_manager.impl.dart';

enum LocationFilteringMode {
  /// Locations should be filtered (no unrealistic or spoofed locations, or
  /// locations from the past).
  On,

  /// Only invalid (that is zero) locations should be filtered.
  Off,
  ;
}

enum LocationPurpose {
  /// This mode uses less resources and is the default.
  General,

  /// This mode is used to configure LocationManager for navigation when
  /// frequent location updates are desired even though more resources are
  /// used.
  Navigation,
  ;
}

/// Handles location updates and changes.
abstract class LocationManager implements ffi.Finalizable {
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
  /// [purpose] Defines whether locations will be used for navigation.
  /// [locationListener] Location update listener.
  void subscribeForLocationUpdates(
    LocationFilteringMode filteringMode,
    LocationPurpose purpose,
    mapkit_location_location_listener.LocationListener locationListener, {
    required core.double desiredAccuracy,
    required core.int minTime,
    required core.double minDistance,
    required core.bool allowUseInBackground,
  });

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
      mapkit_location_location_listener.LocationListener locationListener);

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
      mapkit_location_location_listener.LocationListener locationListener);

  /// Stops updates for all subscriptions until resume() is called.
  void suspend();

  /// Resumes updates stopped by a suspend() call.
  void resume();
}

class LocationManagerUtils {
  LocationManagerUtils._();

  /// Last known location, if one was ever received.
  ///
  static mapkit_location_location.Location? get lastKnownLocation =>
      _lastKnownLocation;
}
