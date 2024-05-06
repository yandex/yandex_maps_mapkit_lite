part of 'location_simulator.dart';

@bindings_annotations.ContainerData(
    toNative: 'SimulationAccuracyImpl.toPointer',
    toPlatform:
        '(val) => SimulationAccuracyImpl.fromPointer(val, needFree: false)',
    platformType: 'SimulationAccuracy')
extension SimulationAccuracyImpl on SimulationAccuracy {
  static core.int toInt(SimulationAccuracy e) {
    return e.index;
  }

  static SimulationAccuracy fromInt(core.int val) {
    return SimulationAccuracy.values[val];
  }

  static SimulationAccuracy? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(SimulationAccuracy? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

final class _LocationSimulatorListenerWrapper implements ffi.Finalizable {
  _LocationSimulatorListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_LocationSimulatorListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension LocationSimulatorListenerImpl on LocationSimulatorListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<LocationSimulatorListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<LocationSimulatorListener,
      _LocationSimulatorListenerWrapper?>();

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
  final listener =
      LocationSimulatorListenerImpl._pointerToListener[_ptr]?.target;
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

@bindings_annotations.ContainerData(
    toNative: 'LocationSimulatorImpl.getNativePtr',
    toPlatform:
        '(val) => LocationSimulatorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'LocationSimulator')
class LocationSimulatorImpl extends mapkit_location_location_manager
    .LocationManagerImpl implements LocationSimulator, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_LocationSimulator_free.cast());

  /// @nodoc
  LocationSimulatorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  LocationSimulatorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(LocationSimulator? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as LocationSimulatorImpl).ptr;
  }

  @internal

  /// @nodoc
  static LocationSimulator? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LocationSimulatorImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_geometry_geometry.Polyline? get geometry {
    return mapkit_geometry_geometry.PolylineImpl.fromOptionalPtr(
        _LocationSimulator_get_geometry(ptr));
  }

  @core.override
  set geometry(mapkit_geometry_geometry.Polyline? val) {
    _LocationSimulator_set_geometry(
        ptr, mapkit_geometry_geometry.PolylineImpl.getNativePtr(val));
  }

  @core.override
  core.double get speed {
    return _LocationSimulator_get_speed(ptr);
  }

  @core.override
  set speed(core.double val) {
    _LocationSimulator_set_speed(ptr, val);
  }

  @core.override
  core.bool get active {
    return _LocationSimulator_get_active(ptr);
  }

  void subscribeForSimulatorEvents(
      LocationSimulatorListener simulatorListener) {
    _LocationSimulator_subscribeForSimulatorEvents(
        ptr, LocationSimulatorListenerImpl.getNativePtr(simulatorListener));
  }

  void unsubscribeFromSimulatorEvents(
      LocationSimulatorListener simulatorListener) {
    _LocationSimulator_unsubscribeFromSimulatorEvents(
        ptr, LocationSimulatorListenerImpl.getNativePtr(simulatorListener));
  }

  void startSimulation(SimulationAccuracy simulationAccuracy) {
    _LocationSimulator_startSimulation(
        ptr, SimulationAccuracyImpl.toInt(simulationAccuracy));
  }

  void stopSimulation() {
    _LocationSimulator_stopSimulation(ptr);
  }

  mapkit_geometry_geometry.PolylinePosition polylinePosition() {
    return mapkit_geometry_geometry.PolylinePositionImpl.fromNative(
        _LocationSimulator_polylinePosition(ptr));
  }

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
