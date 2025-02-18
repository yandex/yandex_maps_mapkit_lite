import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
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
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location_manager.dart'
    as mapkit_location_location_manager;

part 'location_simulator.containers.dart';
part 'location_simulator.impl.dart';

enum SimulationAccuracy {
  /// Generate locations strictly the geometry
  Fine,

  /// Generate locations with normal distribution
  Coarse,
  ;
}

/// Listens for updates for location simulation.
abstract class LocationSimulatorListener {
  /// Simulation is finished.
  void onSimulationFinished();
}

abstract final class Range implements ffi.Finalizable {
  factory Range(core.double from, core.double to) => RangeImpl(from, to);

  Range._();

  core.double get from;
  core.double get to;

  @core.override
  core.int get hashCode => core.Object.hashAll([from, to]);

  @core.override
  core.bool operator ==(covariant Range other) {
    if (core.identical(this, other)) {
      return true;
    }
    return from == other.from && to == other.to;
  }

  @core.override
  core.String toString() {
    return "Range(from: $from, to: $to)";
  }
}

abstract final class TimeInterval implements ffi.Finalizable {
  factory TimeInterval(core.Duration from, core.Duration to) =>
      TimeIntervalImpl(from, to);

  TimeInterval._();

  /// Lower limit in milliseconds.
  core.Duration get from;

  /// Upper limit in milliseconds.
  core.Duration get to;

  @core.override
  core.int get hashCode => core.Object.hashAll([from, to]);

  @core.override
  core.bool operator ==(covariant TimeInterval other) {
    if (core.identical(this, other)) {
      return true;
    }
    return from == other.from && to == other.to;
  }

  @core.override
  core.String toString() {
    return "TimeInterval(from: $from, to: $to)";
  }
}

abstract final class LocationError implements ffi.Finalizable {
  factory LocationError(
          Range lateralErrorRange, Range longitudinalErrorRange) =>
      LocationErrorImpl(lateralErrorRange, longitudinalErrorRange);

  LocationError._();

  /// The error of spreading locations across the route.
  Range get lateralErrorRange;

  /// The error of spreading locations along the route.
  Range get longitudinalErrorRange;

  @core.override
  core.int get hashCode =>
      core.Object.hashAll([lateralErrorRange, longitudinalErrorRange]);

  @core.override
  core.bool operator ==(covariant LocationError other) {
    if (core.identical(this, other)) {
      return true;
    }
    return lateralErrorRange == other.lateralErrorRange &&
        longitudinalErrorRange == other.longitudinalErrorRange;
  }

  @core.override
  core.String toString() {
    return "LocationError(lateralErrorRange: $lateralErrorRange, longitudinalErrorRange: $longitudinalErrorRange)";
  }
}

abstract final class LocationSettings implements ffi.Finalizable {
  factory LocationSettings(
          core.bool provideAccuracy,
          Range? accuracy,
          TimeInterval locationTimeInterval,
          core.bool provideSpeed,
          core.double speed,
          core.bool provideHeading,
          Range? headingError,
          LocationError locationError,
          core.bool provideWheelSpeed,
          TimeInterval wheelSpeedTimeInterval) =>
      LocationSettingsImpl(
          provideAccuracy,
          accuracy,
          locationTimeInterval,
          provideSpeed,
          speed,
          provideHeading,
          headingError,
          locationError,
          provideWheelSpeed,
          wheelSpeedTimeInterval);

  LocationSettings._();

  /// Flag whether to provide accuracy value.
  core.bool get provideAccuracy;

  /// Location accuracy range in meters.
  ///
  Range? get accuracy;

  /// Location time interval in milliseconds.
  TimeInterval get locationTimeInterval;

  /// Flag whether to provide speed value.
  core.bool get provideSpeed;

  /// The speed in meters per second.
  core.double get speed;

  /// Flag whether to provide error of heading.
  core.bool get provideHeading;

  /// The current heading error range in degrees relative to true heading,
  /// clockwise.
  ///
  Range? get headingError;
  LocationError get locationError;

  /// Flag whether to provide wheel speed value.
  core.bool get provideWheelSpeed;

  /// Time interval of getting the wheel speed in milliseconds. After
  /// publication the wheel speed corresponds to the speed value.
  TimeInterval get wheelSpeedTimeInterval;

  @core.override
  core.int get hashCode => core.Object.hashAll([
        provideAccuracy,
        accuracy,
        locationTimeInterval,
        provideSpeed,
        speed,
        provideHeading,
        headingError,
        locationError,
        provideWheelSpeed,
        wheelSpeedTimeInterval
      ]);

  @core.override
  core.bool operator ==(covariant LocationSettings other) {
    if (core.identical(this, other)) {
      return true;
    }
    return provideAccuracy == other.provideAccuracy &&
        accuracy == other.accuracy &&
        locationTimeInterval == other.locationTimeInterval &&
        provideSpeed == other.provideSpeed &&
        speed == other.speed &&
        provideHeading == other.provideHeading &&
        headingError == other.headingError &&
        locationError == other.locationError &&
        provideWheelSpeed == other.provideWheelSpeed &&
        wheelSpeedTimeInterval == other.wheelSpeedTimeInterval;
  }

  @core.override
  core.String toString() {
    return "LocationSettings(provideAccuracy: $provideAccuracy, accuracy: $accuracy, locationTimeInterval: $locationTimeInterval, provideSpeed: $provideSpeed, speed: $speed, provideHeading: $provideHeading, headingError: $headingError, locationError: $locationError, provideWheelSpeed: $provideWheelSpeed, wheelSpeedTimeInterval: $wheelSpeedTimeInterval)";
  }
}

abstract final class SimulationSettings implements ffi.Finalizable {
  factory SimulationSettings(mapkit_geometry_geometry.Polyline geometry,
          LocationSettings locationSettings) =>
      SimulationSettingsImpl(geometry, locationSettings);

  SimulationSettings._();

  mapkit_geometry_geometry.Polyline get geometry;
  LocationSettings get locationSettings;

  @core.override
  core.int get hashCode => core.Object.hashAll([geometry, locationSettings]);

  @core.override
  core.bool operator ==(covariant SimulationSettings other) {
    if (core.identical(this, other)) {
      return true;
    }
    return geometry == other.geometry &&
        locationSettings == other.locationSettings;
  }

  @core.override
  core.String toString() {
    return "SimulationSettings(geometry: $geometry, locationSettings: $locationSettings)";
  }
}

/// Simulates the device location.
abstract class LocationSimulator
    implements
        mapkit_location_location_manager.LocationManager,
        ffi.Finalizable {
  /// The polyline describing the location.
  ///
  @core.Deprecated('Now field in SimulationSettings settings.')
  mapkit_geometry_geometry.Polyline? get geometry;
  @core.Deprecated('Now field in SimulationSettings settings.')
  set geometry(mapkit_geometry_geometry.Polyline? val);

  /// Movement speed.
  @core.Deprecated('Now field in settings.')
  core.double get speed;
  @core.Deprecated('Now field in settings.')
  set speed(core.double val);

  core.List<SimulationSettings> get settings;
  set settings(core.List<SimulationSettings> val);

  /// True if simulator is not suspended.
  core.bool get active;

  /// Subscribes to simulation events.
  ///
  /// The class does not retain the object in the 'simulatorListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void subscribeForSimulatorEvents(LocationSimulatorListener simulatorListener);

  /// Unsubscribes from simulation events.
  ///
  /// The class does not retain the object in the 'simulatorListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void unsubscribeFromSimulatorEvents(
      LocationSimulatorListener simulatorListener);

  /// Start simulation.
  ///
  /// [simulationAccuracy] Generate locations with given accuracy.
  void startSimulation(SimulationAccuracy simulationAccuracy);

  /// Stop simulation.
  void stopSimulation();

  /// The position of the polyline.
  mapkit_geometry_geometry.PolylinePosition polylinePosition();

  /// Fill location::Location::speed.
  void setLocationSpeedProviding(core.bool provide);
}
