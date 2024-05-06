part of 'gnss_measurements.dart';

@bindings_annotations.ContainerData(
    toNative: 'GnssClockImpl.toPointer',
    toPlatform: '(val) => GnssClockImpl.fromPointer(val, needFree: false)',
    platformType: 'GnssClock')
final class GnssClockImpl implements GnssClock {
  GnssClockImpl(
      core.int timeNanos,
      core.double? timeUncertaintyNanos,
      core.int? leapSecond,
      core.int? fullBiasNanos,
      core.double? biasNanos,
      core.double? biasUncertaintyNanos,
      core.double? driftNanosPerSecond,
      core.double? driftNanosUncertaintyPerSecond,
      core.int hardwareClockDiscontinuityCount)
      : this.fromNativePtr(_GnssClock_init(
            timeNanos,
            to_native.toNativePtrDouble(timeUncertaintyNanos),
            to_native.toNativePtrInt(leapSecond),
            to_native.toNativePtrInt64(fullBiasNanos),
            to_native.toNativePtrDouble(biasNanos),
            to_native.toNativePtrDouble(biasUncertaintyNanos),
            to_native.toNativePtrDouble(driftNanosPerSecond),
            to_native.toNativePtrDouble(driftNanosUncertaintyPerSecond),
            hardwareClockDiscontinuityCount));

  @core.override
  late final timeNanos = _GnssClock_get_timeNanos(_ptr);
  @core.override
  late final timeUncertaintyNanos = to_platform
      .toPlatformFromPointerDouble(_GnssClock_get_timeUncertaintyNanos(_ptr));
  @core.override
  late final leapSecond =
      to_platform.toPlatformFromPointerInt(_GnssClock_get_leapSecond(_ptr));
  @core.override
  late final fullBiasNanos = to_platform
      .toPlatformFromPointerInt64(_GnssClock_get_fullBiasNanos(_ptr));
  @core.override
  late final biasNanos =
      to_platform.toPlatformFromPointerDouble(_GnssClock_get_biasNanos(_ptr));
  @core.override
  late final biasUncertaintyNanos = to_platform
      .toPlatformFromPointerDouble(_GnssClock_get_biasUncertaintyNanos(_ptr));
  @core.override
  late final driftNanosPerSecond = to_platform
      .toPlatformFromPointerDouble(_GnssClock_get_driftNanosPerSecond(_ptr));
  @core.override
  late final driftNanosUncertaintyPerSecond =
      to_platform.toPlatformFromPointerDouble(
          _GnssClock_get_driftNanosUncertaintyPerSecond(_ptr));
  @core.override
  late final hardwareClockDiscontinuityCount =
      _GnssClock_get_hardwareClockDiscontinuityCount(_ptr);

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_GnssClock_free.cast());

  GnssClockImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(GnssClock? obj) {
    return (obj as GnssClockImpl?)?._ptr ?? ffi.nullptr;
  }

  static GnssClock? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : GnssClockImpl.fromNativePtr(ptr);
  }

  static GnssClock? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        GnssClockImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(GnssClock? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _GnssClock_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _GnssClock_clone =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_sensors_internal_GnssClock_clone')
        .asFunction(isLeaf: true);

final _GnssClock_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_runtime_sensors_internal_GnssClock_free');

final ffi.Pointer<ffi.Void> Function(
        core.int,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        core.int) _GnssClock_init =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Int64,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Int)>>(
            'yandex_flutter_runtime_sensors_internal_GnssClock_init')
        .asFunction(isLeaf: true);

final core.int Function(ffi.Pointer<ffi.Void>) _GnssClock_get_timeNanos = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssClock_get_timeNanos')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssClock_get_timeUncertaintyNanos = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssClock_get_timeUncertaintyNanos')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GnssClock_get_leapSecond = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_sensors_internal_GnssClock_get_leapSecond')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssClock_get_fullBiasNanos = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssClock_get_fullBiasNanos')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GnssClock_get_biasNanos = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_sensors_internal_GnssClock_get_biasNanos')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssClock_get_biasUncertaintyNanos = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssClock_get_biasUncertaintyNanos')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssClock_get_driftNanosPerSecond = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssClock_get_driftNanosPerSecond')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssClock_get_driftNanosUncertaintyPerSecond = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssClock_get_driftNanosUncertaintyPerSecond')
    .asFunction(isLeaf: true);
final core.int Function(
    ffi
        .Pointer<ffi.Void>) _GnssClock_get_hardwareClockDiscontinuityCount = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssClock_get_hardwareClockDiscontinuityCount')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'GnssMeasurementImpl.toPointer',
    toPlatform:
        '(val) => GnssMeasurementImpl.fromPointer(val, needFree: false)',
    platformType: 'GnssMeasurement')
final class GnssMeasurementImpl implements GnssMeasurement {
  GnssMeasurementImpl(
      core.int constellationType,
      core.int svid,
      core.double accumulatedDeltaRangeMeters,
      core.int accumulatedDeltaRangeState,
      core.double accumulatedDeltaRangeUncertaintyMeters,
      core.double? carrierFrequencyHz,
      core.double cn0DbHz,
      core.double pseudorangeRateMetersPerSecond,
      core.double pseudorangeRateUncertaintyMetersPerSecond,
      core.int receivedSvTimeNanos,
      core.int receivedSvTimeUncertaintyNanos,
      core.double? snrInDb,
      core.int state,
      core.double timeOffsetNanos,
      core.int multipathIndicator,
      core.int? carrierCycles,
      core.double? carrierPhase,
      core.double? carrierPhaseUncertainty)
      : this.fromNativePtr(_GnssMeasurement_init(
            constellationType,
            svid,
            accumulatedDeltaRangeMeters,
            accumulatedDeltaRangeState,
            accumulatedDeltaRangeUncertaintyMeters,
            to_native.toNativePtrFloat(carrierFrequencyHz),
            cn0DbHz,
            pseudorangeRateMetersPerSecond,
            pseudorangeRateUncertaintyMetersPerSecond,
            receivedSvTimeNanos,
            receivedSvTimeUncertaintyNanos,
            to_native.toNativePtrDouble(snrInDb),
            state,
            timeOffsetNanos,
            multipathIndicator,
            to_native.toNativePtrInt64(carrierCycles),
            to_native.toNativePtrDouble(carrierPhase),
            to_native.toNativePtrDouble(carrierPhaseUncertainty)));

  @core.override
  late final constellationType = _GnssMeasurement_get_constellationType(_ptr);
  @core.override
  late final svid = _GnssMeasurement_get_svid(_ptr);
  @core.override
  late final accumulatedDeltaRangeMeters =
      _GnssMeasurement_get_accumulatedDeltaRangeMeters(_ptr);
  @core.override
  late final accumulatedDeltaRangeState =
      _GnssMeasurement_get_accumulatedDeltaRangeState(_ptr);
  @core.override
  late final accumulatedDeltaRangeUncertaintyMeters =
      _GnssMeasurement_get_accumulatedDeltaRangeUncertaintyMeters(_ptr);
  @core.override
  late final carrierFrequencyHz = to_platform.toPlatformFromPointerFloat(
      _GnssMeasurement_get_carrierFrequencyHz(_ptr));
  @core.override
  late final cn0DbHz = _GnssMeasurement_get_cn0DbHz(_ptr);
  @core.override
  late final pseudorangeRateMetersPerSecond =
      _GnssMeasurement_get_pseudorangeRateMetersPerSecond(_ptr);
  @core.override
  late final pseudorangeRateUncertaintyMetersPerSecond =
      _GnssMeasurement_get_pseudorangeRateUncertaintyMetersPerSecond(_ptr);
  @core.override
  late final receivedSvTimeNanos =
      _GnssMeasurement_get_receivedSvTimeNanos(_ptr);
  @core.override
  late final receivedSvTimeUncertaintyNanos =
      _GnssMeasurement_get_receivedSvTimeUncertaintyNanos(_ptr);
  @core.override
  late final snrInDb = to_platform
      .toPlatformFromPointerDouble(_GnssMeasurement_get_snrInDb(_ptr));
  @core.override
  late final state = _GnssMeasurement_get_state(_ptr);
  @core.override
  late final timeOffsetNanos = _GnssMeasurement_get_timeOffsetNanos(_ptr);
  @core.override
  late final multipathIndicator = _GnssMeasurement_get_multipathIndicator(_ptr);
  @core.override
  late final carrierCycles = to_platform
      .toPlatformFromPointerInt64(_GnssMeasurement_get_carrierCycles(_ptr));
  @core.override
  late final carrierPhase = to_platform
      .toPlatformFromPointerDouble(_GnssMeasurement_get_carrierPhase(_ptr));
  @core.override
  late final carrierPhaseUncertainty = to_platform.toPlatformFromPointerDouble(
      _GnssMeasurement_get_carrierPhaseUncertainty(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_GnssMeasurement_free.cast());

  GnssMeasurementImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(GnssMeasurement? obj) {
    return (obj as GnssMeasurementImpl?)?._ptr ?? ffi.nullptr;
  }

  static GnssMeasurement? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : GnssMeasurementImpl.fromNativePtr(ptr);
  }

  static GnssMeasurement? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = GnssMeasurementImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(GnssMeasurement? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _GnssMeasurement_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GnssMeasurement_clone = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_sensors_internal_GnssMeasurement_clone')
        .asFunction(isLeaf: true);

final _GnssMeasurement_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_free');

final ffi.Pointer<ffi.Void> Function(
    core.int,
    core.int,
    core.double,
    core.int,
    core.double,
    ffi.Pointer<ffi.Void>,
    core.double,
    core.double,
    core.double,
    core.int,
    core.int,
    ffi.Pointer<ffi.Void>,
    core.int,
    core.double,
    core.int,
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _GnssMeasurement_init = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Pointer<ffi.Void> Function(
                ffi.Int,
                ffi.Int,
                ffi.Double,
                ffi.Int,
                ffi.Double,
                ffi.Pointer<ffi.Void>,
                ffi.Double,
                ffi.Double,
                ffi.Double,
                ffi.Int64,
                ffi.Int64,
                ffi.Pointer<ffi.Void>,
                ffi.Int,
                ffi.Double,
                ffi.Int,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>)>>('yandex_flutter_runtime_sensors_internal_GnssMeasurement_init')
    .asFunction(isLeaf: true);

final core.int Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurement_get_constellationType = lib.library
    .lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_constellationType')
    .asFunction(isLeaf: true);
final core.int Function(ffi.Pointer<ffi.Void>) _GnssMeasurement_get_svid = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_svid')
    .asFunction(isLeaf: true);
final core.double Function(
    ffi.Pointer<
        ffi.Void>) _GnssMeasurement_get_accumulatedDeltaRangeMeters = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_accumulatedDeltaRangeMeters')
    .asFunction(isLeaf: true);
final core.int Function(
    ffi.Pointer<
        ffi.Void>) _GnssMeasurement_get_accumulatedDeltaRangeState = lib.library
    .lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_accumulatedDeltaRangeState')
    .asFunction(isLeaf: true);
final core.double Function(
    ffi.Pointer<
        ffi
        .Void>) _GnssMeasurement_get_accumulatedDeltaRangeUncertaintyMeters = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_accumulatedDeltaRangeUncertaintyMeters')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurement_get_carrierFrequencyHz = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_carrierFrequencyHz')
    .asFunction(isLeaf: true);
final core.double Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurement_get_cn0DbHz = lib.library
    .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_cn0DbHz')
    .asFunction(isLeaf: true);
final core.double Function(
    ffi.Pointer<
        ffi.Void>) _GnssMeasurement_get_pseudorangeRateMetersPerSecond = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_pseudorangeRateMetersPerSecond')
    .asFunction(isLeaf: true);
final core.double Function(ffi.Pointer<ffi.Void>)
    _GnssMeasurement_get_pseudorangeRateUncertaintyMetersPerSecond = lib.library
        .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_pseudorangeRateUncertaintyMetersPerSecond')
        .asFunction(isLeaf: true);
final core.int Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurement_get_receivedSvTimeNanos = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_receivedSvTimeNanos')
    .asFunction(isLeaf: true);
final core.int Function(
    ffi.Pointer<
        ffi.Void>) _GnssMeasurement_get_receivedSvTimeUncertaintyNanos = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_receivedSvTimeUncertaintyNanos')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurement_get_snrInDb = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_snrInDb')
    .asFunction(isLeaf: true);
final core.int Function(ffi.Pointer<ffi.Void>) _GnssMeasurement_get_state = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_state')
    .asFunction(isLeaf: true);
final core.double Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurement_get_timeOffsetNanos = lib.library
    .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_timeOffsetNanos')
    .asFunction(isLeaf: true);
final core.int Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurement_get_multipathIndicator = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_multipathIndicator')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurement_get_carrierCycles = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_carrierCycles')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurement_get_carrierPhase = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_carrierPhase')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurement_get_carrierPhaseUncertainty = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurement_get_carrierPhaseUncertainty')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'GnssMeasurementsEventImpl.toPointer',
    toPlatform:
        '(val) => GnssMeasurementsEventImpl.fromPointer(val, needFree: false)',
    platformType: 'GnssMeasurementsEvent')
final class GnssMeasurementsEventImpl implements GnssMeasurementsEvent {
  GnssMeasurementsEventImpl(
      GnssClock clock, core.List<GnssMeasurement> measurements)
      : this.fromNativePtr(_GnssMeasurementsEvent_init(
            GnssClockImpl.getNativePtr(clock),
            GnssMeasurementContainerExtension.toNativeVector(measurements)));

  @core.override
  late final clock =
      GnssClockImpl.fromNativePtr(_GnssMeasurementsEvent_get_clock(_ptr));
  @core.override
  late final measurements = GnssMeasurementContainerExtension.toPlatformVector(
      _GnssMeasurementsEvent_get_measurements(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_GnssMeasurementsEvent_free.cast());

  GnssMeasurementsEventImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(GnssMeasurementsEvent? obj) {
    return (obj as GnssMeasurementsEventImpl?)?._ptr ?? ffi.nullptr;
  }

  static GnssMeasurementsEvent? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr
        ? null
        : GnssMeasurementsEventImpl.fromNativePtr(ptr);
  }

  static GnssMeasurementsEvent? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = GnssMeasurementsEventImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(GnssMeasurementsEvent? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _GnssMeasurementsEvent_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurementsEvent_clone = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurementsEvent_clone')
    .asFunction(isLeaf: true);

final _GnssMeasurementsEvent_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurementsEvent_free');

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _GnssMeasurementsEvent_init = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurementsEvent_init')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurementsEvent_get_clock = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurementsEvent_get_clock')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurementsEvent_get_measurements = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurementsEvent_get_measurements')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'GnssMeasurementsEventsNativeListenerImpl.getNativePtr',
    toPlatform:
        '(val) => GnssMeasurementsEventsNativeListenerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'GnssMeasurementsEventsNativeListener')
class GnssMeasurementsEventsNativeListenerImpl
    implements GnssMeasurementsEventsNativeListener, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_GnssMeasurementsEventsNativeListener_free.cast());

  /// @nodoc
  GnssMeasurementsEventsNativeListenerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  GnssMeasurementsEventsNativeListenerImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(
      GnssMeasurementsEventsNativeListener? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as GnssMeasurementsEventsNativeListenerImpl).ptr;
  }

  @internal

  /// @nodoc
  static GnssMeasurementsEventsNativeListener? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return GnssMeasurementsEventsNativeListenerImpl.fromNativePtr(ptr);
  }

  void onGnssMeasurementsEvent(GnssMeasurementsEvent event) {
    _GnssMeasurementsEventsNativeListener_onGnssMeasurementsEvent(
        ptr, GnssMeasurementsEventImpl.getNativePtr(event));
  }
}

final _GnssMeasurementsEventsNativeListener_free = lib.library.lookup<
        ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
    'yandex_flutter_runtime_sensors_internal_GnssMeasurementsEventsNativeListener_free');

final void Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<
        ffi
        .Void>) _GnssMeasurementsEventsNativeListener_onGnssMeasurementsEvent = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurementsEventsNativeListener_onGnssMeasurementsEvent')
    .asFunction();

extension GnssMeasurementsEventsPlatformProviderImpl
    on GnssMeasurementsEventsPlatformProvider {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, GnssMeasurementsEventsPlatformProvider>{};
  static final _listenerToPointer =
      <GnssMeasurementsEventsPlatformProvider, ffi.Pointer<ffi.Void>>{};

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _GnssMeasurementsEventsPlatformProvider_free(ptr);
    final listener = _pointerToListener[ptr];
    _listenerToPointer.remove(listener);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _renewNonExsistPointer(
      ffi.Pointer<ffi.Void> ptr) {
    if (!_GnssMeasurementsEventsPlatformProvider_exists(ptr)) {
      final listener = _pointerToListener[ptr];
      _pointerToListener.remove(ptr);
      _listenerToPointer.remove(listener);
      return _newNativeObject(listener!);
    }
    return ptr;
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(
      GnssMeasurementsEventsPlatformProvider obj) {
    final ptr = _GnssMeasurementsEventsPlatformProvider_new(
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
            _GnssMeasurementsEventsPlatformProvider_finish));
    _pointerToListener[ptr] = obj;
    _listenerToPointer[obj] = ptr;
    _GnssMeasurementsEventsPlatformProvidersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(
      GnssMeasurementsEventsPlatformProvider? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return _renewNonExsistPointer(foundPointer);
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _GnssMeasurementsEventsPlatformProvidersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurementsEventsPlatformProvider_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)
    _GnssMeasurementsEventsPlatformProvider_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_runtime_sensors_internal_GnssMeasurementsEventsPlatformProvider_new')
        .asFunction(isLeaf: true);

final void Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurementsEventsPlatformProvider_free = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurementsEventsPlatformProvider_free')
    .asFunction(isLeaf: true);
final core.bool Function(
    ffi
        .Pointer<ffi.Void>) _GnssMeasurementsEventsPlatformProvider_exists = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_sensors_internal_GnssMeasurementsEventsPlatformProvider_exists')
    .asFunction(isLeaf: true);

void _GnssMeasurementsEventsPlatformProvider_finish(
    ffi.Pointer<ffi.Void> _ptr) {
  final listener =
      GnssMeasurementsEventsPlatformProviderImpl._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.finish();
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
