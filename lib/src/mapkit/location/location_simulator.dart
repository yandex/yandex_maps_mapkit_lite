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

@bindings_annotations.ContainerData(
    toNative: 'SimulationAccuracy.toPointer',
    toPlatform: '(val) => SimulationAccuracy.fromPointer(val, needFree: false)')
enum SimulationAccuracy {
  /// Generate locations strictly the geometry
  Fine,

  /// Generate locations with normal distribution
  Coarse,
  ;

  /// @nodoc
  @internal
  static SimulationAccuracy fromInt(core.int val) {
    return SimulationAccuracy.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(SimulationAccuracy e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static SimulationAccuracy? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(SimulationAccuracy? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

/// @nodoc
class _LocationSimulatorListenerWrapper implements ffi.Finalizable {
  _LocationSimulatorListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_LocationSimulatorListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Listens for updates for location simulation.
abstract class LocationSimulatorListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<LocationSimulatorListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<LocationSimulatorListener,
      _LocationSimulatorListenerWrapper?>();

  /// Simulation is finished.
  void onSimulationFinished();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(LocationSimulatorListener obj) {
    final ptr = _LocationSimulatorListener_new(
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
            _LocationSimulatorListener_onSimulationFinished));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _LocationSimulatorListenerWrapper(ptr);
    _LocationSimulatorListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(LocationSimulatorListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _LocationSimulatorListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_location_LocationSimulatorListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)
    _LocationSimulatorListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_location_LocationSimulatorListener_new')
        .asFunction(isLeaf: true);

final _LocationSimulatorListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationSimulatorListener_free');
void _LocationSimulatorListener_onSimulationFinished(
    ffi.Pointer<ffi.Void> _ptr) {
  final listener = LocationSimulatorListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onSimulationFinished();
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

/// Simulates the device location.
@bindings_annotations.ContainerData(
    toNative: 'LocationSimulator.getNativePtr',
    toPlatform:
        '(val) => LocationSimulator.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class LocationSimulator extends mapkit_location_location_manager.LocationManager
    implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_LocationSimulator_free.cast());

  /// @nodoc
  LocationSimulator.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  LocationSimulator.fromNativePtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(LocationSimulator? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  @internal

  /// @nodoc
  static LocationSimulator? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LocationSimulator.fromNativePtr(ptr);
  }

  /// The polyline describing the location.
  ///
  mapkit_geometry_geometry.Polyline? get geometry {
    return mapkit_geometry_geometry.Polyline.fromOptionalPtr(
        _LocationSimulator_get_geometry(ptr));
  }

  set geometry(mapkit_geometry_geometry.Polyline? val) {
    return _LocationSimulator_set_geometry(
        ptr, mapkit_geometry_geometry.Polyline.getNativePtr(val));
  }

  /// Movement speed.
  core.double get speed {
    return _LocationSimulator_get_speed(ptr);
  }

  set speed(core.double val) {
    return _LocationSimulator_set_speed(ptr, val);
  }

  /// True if simulator is not suspended.
  core.bool get active {
    return _LocationSimulator_get_active(ptr);
  }

  /// Subscribes to simulation events.
  ///
  /// The class does not retain the object in the 'simulatorListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void subscribeForSimulatorEvents(
      LocationSimulatorListener simulatorListener) {
    _LocationSimulator_subscribeForSimulatorEvents(
        ptr, LocationSimulatorListener.getNativePtr(simulatorListener));
  }

  /// Unsubscribes from simulation events.
  ///
  /// The class does not retain the object in the 'simulatorListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void unsubscribeFromSimulatorEvents(
      LocationSimulatorListener simulatorListener) {
    _LocationSimulator_unsubscribeFromSimulatorEvents(
        ptr, LocationSimulatorListener.getNativePtr(simulatorListener));
  }

  /// Start simulation.
  ///
  /// [simulationAccuracy] Generate locations with given accuracy.
  void startSimulation(SimulationAccuracy simulationAccuracy) {
    _LocationSimulator_startSimulation(
        ptr, SimulationAccuracy.toInt(simulationAccuracy));
  }

  /// Stop simulation.
  void stopSimulation() {
    _LocationSimulator_stopSimulation(ptr);
  }

  /// The position of the polyline.
  mapkit_geometry_geometry.PolylinePosition polylinePosition() {
    return mapkit_geometry_geometry.PolylinePosition.fromNative(
        _LocationSimulator_polylinePosition(ptr));
  }

  /// Fill location::Location::speed.
  void setLocationSpeedProviding(core.bool provide) {
    _LocationSimulator_setLocationSpeedProviding(ptr, provide);
  }
}

final _LocationSimulator_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationSimulator_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _LocationSimulator_get_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationSimulator_get_geometry')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _LocationSimulator_set_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationSimulator_set_geometry')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _LocationSimulator_get_speed =
    lib
        .library
        .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationSimulator_get_speed')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _LocationSimulator_set_speed = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Double)>>(
            'yandex_flutter_mapkit_location_LocationSimulator_set_speed')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _LocationSimulator_get_active =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationSimulator_get_active')
        .asFunction();

final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _LocationSimulator_subscribeForSimulatorEvents = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationSimulator_subscribeForSimulatorEvents')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<
        ffi.Void>) _LocationSimulator_unsubscribeFromSimulatorEvents = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationSimulator_unsubscribeFromSimulatorEvents')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int)
    _LocationSimulator_startSimulation = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_location_LocationSimulator_startSimulation')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _LocationSimulator_stopSimulation =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationSimulator_stopSimulation')
        .asFunction();
final mapkit_geometry_geometry.PolylinePositionNative Function(
        ffi.Pointer<ffi.Void>) _LocationSimulator_polylinePosition =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geometry.PolylinePositionNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationSimulator_polylinePosition')
        .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core
        .bool) _LocationSimulator_setLocationSpeedProviding = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
        'yandex_flutter_mapkit_location_LocationSimulator_setLocationSpeedProviding')
    .asFunction();
