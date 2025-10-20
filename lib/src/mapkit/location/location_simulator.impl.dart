part of 'location_simulator.dart';

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
    toNative: 'RangeImpl.getNativePtr',
    toPlatform: '(val) => RangeImpl.fromPointer(val, needFree: false)',
    platformType: 'Range')
final class RangeImpl extends Range {
  RangeImpl(core.double from, core.double to)
      : this.fromNativePtr(_Range_init(from, to));

  @core.override
  late final from = _Range_get_from(_ptr);
  @core.override
  late final to = _Range_get_to(_ptr);

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_Range_free.cast());

  RangeImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(Range? obj) {
    return (obj as RangeImpl?)?._ptr ?? ffi.nullptr;
  }

  static Range? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : RangeImpl.fromNativePtr(ptr);
  }

  static Range? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        RangeImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

final _Range_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_location_Range_free');

final ffi.Pointer<ffi.Void> Function(core.double, core.double) _Range_init = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Pointer<ffi.Void> Function(ffi.Double,
                ffi.Double)>>('yandex_flutter_mapkit_location_Range_init')
    .asFunction(isLeaf: true);

final core.double Function(ffi.Pointer<ffi.Void>) _Range_get_from = lib.library
    .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_Range_get_from')
    .asFunction(isLeaf: true);
final core.double Function(ffi.Pointer<ffi.Void>) _Range_get_to = lib.library
    .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_Range_get_to')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'TimeIntervalImpl.getNativePtr',
    toPlatform: '(val) => TimeIntervalImpl.fromPointer(val, needFree: false)',
    platformType: 'TimeInterval')
final class TimeIntervalImpl extends TimeInterval {
  TimeIntervalImpl(core.Duration from, core.Duration to)
      : this.fromNativePtr(_TimeInterval_init(
            to_native.toNativeTimeInterval(from),
            to_native.toNativeTimeInterval(to)));

  @core.override
  late final from =
      to_platform.toPlatformTimeInterval(_TimeInterval_get_from(_ptr));
  @core.override
  late final to =
      to_platform.toPlatformTimeInterval(_TimeInterval_get_to(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_TimeInterval_free.cast());

  TimeIntervalImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(TimeInterval? obj) {
    return (obj as TimeIntervalImpl?)?._ptr ?? ffi.nullptr;
  }

  static TimeInterval? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : TimeIntervalImpl.fromNativePtr(ptr);
  }

  static TimeInterval? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        TimeIntervalImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

final _TimeInterval_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_location_TimeInterval_free');

final ffi.Pointer<ffi.Void> Function(
        native_types.NativeInterval, native_types.NativeInterval)
    _TimeInterval_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(native_types.NativeInterval,
                        native_types.NativeInterval)>>(
            'yandex_flutter_mapkit_location_TimeInterval_init')
        .asFunction(isLeaf: true);

final native_types.NativeInterval Function(ffi.Pointer<ffi.Void>)
    _TimeInterval_get_from = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeInterval Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_TimeInterval_get_from')
        .asFunction(isLeaf: true);
final native_types.NativeInterval Function(ffi.Pointer<ffi.Void>)
    _TimeInterval_get_to = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeInterval Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_TimeInterval_get_to')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LocationErrorImpl.getNativePtr',
    toPlatform: '(val) => LocationErrorImpl.fromPointer(val, needFree: false)',
    platformType: 'LocationError')
final class LocationErrorImpl extends LocationError {
  LocationErrorImpl(Range lateralErrorRange, Range longitudinalErrorRange)
      : this.fromNativePtr(_LocationError_init(
            RangeImpl.getNativePtr(lateralErrorRange),
            RangeImpl.getNativePtr(longitudinalErrorRange)));

  @core.override
  late final lateralErrorRange =
      RangeImpl.fromNativePtr(_LocationError_get_lateralErrorRange(_ptr));
  @core.override
  late final longitudinalErrorRange =
      RangeImpl.fromNativePtr(_LocationError_get_longitudinalErrorRange(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_LocationError_free.cast());

  LocationErrorImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(LocationError? obj) {
    return (obj as LocationErrorImpl?)?._ptr ?? ffi.nullptr;
  }

  static LocationError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : LocationErrorImpl.fromNativePtr(ptr);
  }

  static LocationError? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = LocationErrorImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

final _LocationError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_location_LocationError_free');

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>) _LocationError_init =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationError_init')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _LocationError_get_lateralErrorRange = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationError_get_lateralErrorRange')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _LocationError_get_longitudinalErrorRange = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationError_get_longitudinalErrorRange')
    .asFunction(isLeaf: true);

final class LocationSettingsNative extends ffi.Struct {
  @ffi.Bool()
  external core.bool provideAccuracy;
  external ffi.Pointer<ffi.Void> accuracy;
  external ffi.Pointer<ffi.Void> locationTimeInterval;
  @ffi.Bool()
  external core.bool provideSpeed;
  @ffi.Double()
  external core.double speed;
  @ffi.Bool()
  external core.bool provideHeading;
  external ffi.Pointer<ffi.Void> headingError;
  external ffi.Pointer<ffi.Void> locationError;
  @ffi.Bool()
  external core.bool provideWheelSpeed;
  external ffi.Pointer<ffi.Void> wheelSpeedTimeInterval;
}

final LocationSettingsNative Function(
        core.bool,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        core.bool,
        core.double,
        core.bool,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        core.bool,
        ffi.Pointer<ffi.Void>) _LocationSettingsNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    LocationSettingsNative Function(
                        ffi.Bool,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Bool,
                        ffi.Double,
                        ffi.Bool,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Bool,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationSettings_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LocationSettingsImpl.toPointer',
    toPlatform:
        '(val) => LocationSettingsImpl.fromPointer(val, needFree: false)',
    platformType: 'LocationSettings')
extension LocationSettingsImpl on LocationSettings {
  static LocationSettings fromNative(LocationSettingsNative native) {
    return LocationSettings(
        provideAccuracy: native.provideAccuracy,
        accuracy: RangeImpl.fromOptionalPtr(native.accuracy),
        locationTimeInterval:
            TimeIntervalImpl.fromOptionalPtr(native.locationTimeInterval),
        provideSpeed: native.provideSpeed,
        speed: native.speed,
        provideHeading: native.provideHeading,
        headingError: RangeImpl.fromOptionalPtr(native.headingError),
        locationError: LocationErrorImpl.fromOptionalPtr(native.locationError),
        provideWheelSpeed: native.provideWheelSpeed,
        wheelSpeedTimeInterval:
            TimeIntervalImpl.fromOptionalPtr(native.wheelSpeedTimeInterval));
  }

  static LocationSettingsNative toNative(LocationSettings obj) {
    return _LocationSettingsNativeInit(
        obj.provideAccuracy,
        RangeImpl.getNativePtr(obj.accuracy),
        TimeIntervalImpl.getNativePtr(obj.locationTimeInterval),
        obj.provideSpeed,
        obj.speed,
        obj.provideHeading,
        RangeImpl.getNativePtr(obj.headingError),
        LocationErrorImpl.getNativePtr(obj.locationError),
        obj.provideWheelSpeed,
        TimeIntervalImpl.getNativePtr(obj.wheelSpeedTimeInterval));
  }

  static LocationSettings? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        LocationSettingsImpl.fromNative(ptr.cast<LocationSettingsNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(LocationSettings? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LocationSettingsNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'SimulationSettingsImpl.getNativePtr',
    toPlatform:
        '(val) => SimulationSettingsImpl.fromPointer(val, needFree: false)',
    platformType: 'SimulationSettings')
final class SimulationSettingsImpl extends SimulationSettings {
  SimulationSettingsImpl(mapkit_geometry_geometry.Polyline geometry,
      LocationSettings locationSettings)
      : this.fromNativePtr(_SimulationSettings_init(
            mapkit_geometry_geometry.PolylineImpl.getNativePtr(geometry),
            LocationSettingsImpl.toNative(locationSettings)));

  @core.override
  late final geometry = mapkit_geometry_geometry.PolylineImpl.fromNativePtr(
      _SimulationSettings_get_geometry(_ptr));
  @core.override
  late final locationSettings = LocationSettingsImpl.fromNative(
      _SimulationSettings_get_locationSettings(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_SimulationSettings_free.cast());

  SimulationSettingsImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(SimulationSettings? obj) {
    return (obj as SimulationSettingsImpl?)?._ptr ?? ffi.nullptr;
  }

  static SimulationSettings? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr
        ? null
        : SimulationSettingsImpl.fromNativePtr(ptr);
  }

  static SimulationSettings? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = SimulationSettingsImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

final _SimulationSettings_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_location_SimulationSettings_free');

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, LocationSettingsNative)
    _SimulationSettings_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, LocationSettingsNative)>>(
            'yandex_flutter_mapkit_location_SimulationSettings_init')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _SimulationSettings_get_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_SimulationSettings_get_geometry')
        .asFunction(isLeaf: true);
final LocationSettingsNative Function(
    ffi
        .Pointer<ffi.Void>) _SimulationSettings_get_locationSettings = lib
    .library
    .lookup<
            ffi.NativeFunction<
                LocationSettingsNative Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_SimulationSettings_get_locationSettings')
    .asFunction(isLeaf: true);

LocationSettings _fineSettings() {
  final result = _LocationSettingsFactory_fineSettings();
  return LocationSettingsImpl.fromNative(result);
}

LocationSettings _coarseSettings() {
  final result = _LocationSettingsFactory_coarseSettings();
  return LocationSettingsImpl.fromNative(result);
}

final LocationSettingsNative Function() _LocationSettingsFactory_fineSettings =
    lib.library
        .lookup<ffi.NativeFunction<LocationSettingsNative Function()>>(
            'yandex_flutter_mapkit_location_LocationSettingsFactory_fineSettings')
        .asFunction();
final LocationSettingsNative Function()
    _LocationSettingsFactory_coarseSettings = lib.library
        .lookup<ffi.NativeFunction<LocationSettingsNative Function()>>(
            'yandex_flutter_mapkit_location_LocationSettingsFactory_coarseSettings')
        .asFunction();

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
  core.double get speed {
    final result = _LocationSimulator_get_speed(ptr);
    return result;
  }

  @core.override
  set speed(core.double val) {
    _LocationSimulator_set_speed(ptr, val);
  }

  @core.override
  core.List<SimulationSettings> get settings {
    final result = _LocationSimulator_get_settings(ptr);
    return SimulationSettingsContainerExtension.toPlatformVector(result);
  }

  @core.override
  set settings(core.List<SimulationSettings> val) {
    _LocationSimulator_set_settings(
        ptr, SimulationSettingsContainerExtension.toNativeVector(val));
  }

  @core.override
  core.bool get active {
    final result = _LocationSimulator_get_active(ptr);
    return result;
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

  void startSimulation(core.List<SimulationSettings> settings) {
    _LocationSimulator_startSimulation(
        ptr, SimulationSettingsContainerExtension.toNativeVector(settings));
  }

  void stopSimulation() {
    _LocationSimulator_stopSimulation(ptr);
  }

  mapkit_geometry_geometry.PolylinePosition polylinePosition() {
    final result = _LocationSimulator_polylinePosition(ptr);
    return mapkit_geometry_geometry.PolylinePositionImpl.fromNative(result);
  }
}

final _LocationSimulator_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationSimulator_free');

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

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _LocationSimulator_get_settings = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationSimulator_get_settings')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _LocationSimulator_set_settings = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationSimulator_set_settings')
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
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _LocationSimulator_startSimulation = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
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
final void Function(ffi.Pointer<ffi.Void>, core.int) _LocationSimulator_set =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_location_LocationSimulator_set_')
        .asFunction(isLeaf: true);
