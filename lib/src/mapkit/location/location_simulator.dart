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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
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

/// Simulates the device location.
abstract class LocationSimulator
    implements
        mapkit_location_location_manager.LocationManager,
        ffi.Finalizable {
  /// The polyline describing the location.
  ///
  mapkit_geometry_geometry.Polyline? get geometry;
  set geometry(mapkit_geometry_geometry.Polyline? val);

  /// Movement speed.
  core.double get speed;
  set speed(core.double val);

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
