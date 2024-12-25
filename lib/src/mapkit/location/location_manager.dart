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
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/purpose.dart'
    as mapkit_location_purpose;

part 'location_manager.containers.dart';
part 'location_manager.impl.dart';

/// If UseInBackground is Allow then the 'location' flag must be set in
/// 'UIBackgroundModes' of the application.
enum LocationUseInBackground {
  Allow,
  Disallow,
  ;
}

final class LocationSubscriptionSettings {
  /// If UseInBackground is Allow then the 'location' flag must be set in
  /// 'UIBackgroundModes' of the application.
  final LocationUseInBackground useInBackground;

  /// Defines for what purpose the locations from the subscription will be
  /// used. Depending on the purpose, it tries to optimize requests for
  /// locations.
  final mapkit_location_purpose.Purpose purpose;

  const LocationSubscriptionSettings(this.useInBackground, this.purpose);

  @core.override
  core.int get hashCode => core.Object.hashAll([useInBackground, purpose]);

  @core.override
  core.bool operator ==(covariant LocationSubscriptionSettings other) {
    if (core.identical(this, other)) {
      return true;
    }
    return useInBackground == other.useInBackground && purpose == other.purpose;
  }

  @core.override
  core.String toString() {
    return "LocationSubscriptionSettings(useInBackground: $useInBackground, purpose: $purpose)";
  }
}

/// Handles location updates and changes.
abstract class LocationManager implements ffi.Finalizable {
  /// Subscribe for location update events. If the listener was already
  /// subscribed to updates from the LocationManager, subscription settings
  /// will be updated.
  ///
  /// The class does not retain the object in the 'locationListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  ///
  /// [subscriptionSettings] Subscription settings.
  /// [locationListener] Location update listener.
  void subscribeForLocationUpdates(
      LocationSubscriptionSettings subscriptionSettings,
      mapkit_location_location_listener.LocationListener locationListener);

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
