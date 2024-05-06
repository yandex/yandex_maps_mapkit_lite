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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'gnss_measurements.containers.dart';
part 'gnss_measurements.impl.dart';

abstract final class GnssClock implements ffi.Finalizable {
  factory GnssClock(
          core.int timeNanos,
          core.double? timeUncertaintyNanos,
          core.int? leapSecond,
          core.int? fullBiasNanos,
          core.double? biasNanos,
          core.double? biasUncertaintyNanos,
          core.double? driftNanosPerSecond,
          core.double? driftNanosUncertaintyPerSecond,
          core.int hardwareClockDiscontinuityCount) =>
      GnssClockImpl(
          timeNanos,
          timeUncertaintyNanos,
          leapSecond,
          fullBiasNanos,
          biasNanos,
          biasUncertaintyNanos,
          driftNanosPerSecond,
          driftNanosUncertaintyPerSecond,
          hardwareClockDiscontinuityCount);

  core.int get timeNanos;
  core.double? get timeUncertaintyNanos;
  core.int? get leapSecond;
  core.int? get fullBiasNanos;
  core.double? get biasNanos;
  core.double? get biasUncertaintyNanos;
  core.double? get driftNanosPerSecond;
  core.double? get driftNanosUncertaintyPerSecond;
  core.int get hardwareClockDiscontinuityCount;

  @core.override
  core.int get hashCode => core.Object.hashAll([
        timeNanos,
        timeUncertaintyNanos,
        leapSecond,
        fullBiasNanos,
        biasNanos,
        biasUncertaintyNanos,
        driftNanosPerSecond,
        driftNanosUncertaintyPerSecond,
        hardwareClockDiscontinuityCount
      ]);

  @core.override
  core.bool operator ==(covariant GnssClock other) {
    if (core.identical(this, other)) {
      return true;
    }
    return timeNanos == other.timeNanos &&
        timeUncertaintyNanos == other.timeUncertaintyNanos &&
        leapSecond == other.leapSecond &&
        fullBiasNanos == other.fullBiasNanos &&
        biasNanos == other.biasNanos &&
        biasUncertaintyNanos == other.biasUncertaintyNanos &&
        driftNanosPerSecond == other.driftNanosPerSecond &&
        driftNanosUncertaintyPerSecond ==
            other.driftNanosUncertaintyPerSecond &&
        hardwareClockDiscontinuityCount ==
            other.hardwareClockDiscontinuityCount;
  }

  @core.override
  core.String toString() {
    return "GnssClock(timeNanos: $timeNanos, timeUncertaintyNanos: $timeUncertaintyNanos, leapSecond: $leapSecond, fullBiasNanos: $fullBiasNanos, biasNanos: $biasNanos, biasUncertaintyNanos: $biasUncertaintyNanos, driftNanosPerSecond: $driftNanosPerSecond, driftNanosUncertaintyPerSecond: $driftNanosUncertaintyPerSecond, hardwareClockDiscontinuityCount: $hardwareClockDiscontinuityCount)";
  }
}

abstract final class GnssMeasurement implements ffi.Finalizable {
  factory GnssMeasurement(
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
          core.double? carrierPhaseUncertainty) =>
      GnssMeasurementImpl(
          constellationType,
          svid,
          accumulatedDeltaRangeMeters,
          accumulatedDeltaRangeState,
          accumulatedDeltaRangeUncertaintyMeters,
          carrierFrequencyHz,
          cn0DbHz,
          pseudorangeRateMetersPerSecond,
          pseudorangeRateUncertaintyMetersPerSecond,
          receivedSvTimeNanos,
          receivedSvTimeUncertaintyNanos,
          snrInDb,
          state,
          timeOffsetNanos,
          multipathIndicator,
          carrierCycles,
          carrierPhase,
          carrierPhaseUncertainty);

  core.int get constellationType;
  core.int get svid;
  core.double get accumulatedDeltaRangeMeters;
  core.int get accumulatedDeltaRangeState;
  core.double get accumulatedDeltaRangeUncertaintyMeters;
  core.double? get carrierFrequencyHz;
  core.double get cn0DbHz;
  core.double get pseudorangeRateMetersPerSecond;
  core.double get pseudorangeRateUncertaintyMetersPerSecond;
  core.int get receivedSvTimeNanos;
  core.int get receivedSvTimeUncertaintyNanos;
  core.double? get snrInDb;
  core.int get state;
  core.double get timeOffsetNanos;
  core.int get multipathIndicator;
  core.int? get carrierCycles;
  core.double? get carrierPhase;
  core.double? get carrierPhaseUncertainty;

  @core.override
  core.int get hashCode => core.Object.hashAll([
        constellationType,
        svid,
        accumulatedDeltaRangeMeters,
        accumulatedDeltaRangeState,
        accumulatedDeltaRangeUncertaintyMeters,
        carrierFrequencyHz,
        cn0DbHz,
        pseudorangeRateMetersPerSecond,
        pseudorangeRateUncertaintyMetersPerSecond,
        receivedSvTimeNanos,
        receivedSvTimeUncertaintyNanos,
        snrInDb,
        state,
        timeOffsetNanos,
        multipathIndicator,
        carrierCycles,
        carrierPhase,
        carrierPhaseUncertainty
      ]);

  @core.override
  core.bool operator ==(covariant GnssMeasurement other) {
    if (core.identical(this, other)) {
      return true;
    }
    return constellationType == other.constellationType &&
        svid == other.svid &&
        accumulatedDeltaRangeMeters == other.accumulatedDeltaRangeMeters &&
        accumulatedDeltaRangeState == other.accumulatedDeltaRangeState &&
        accumulatedDeltaRangeUncertaintyMeters ==
            other.accumulatedDeltaRangeUncertaintyMeters &&
        carrierFrequencyHz == other.carrierFrequencyHz &&
        cn0DbHz == other.cn0DbHz &&
        pseudorangeRateMetersPerSecond ==
            other.pseudorangeRateMetersPerSecond &&
        pseudorangeRateUncertaintyMetersPerSecond ==
            other.pseudorangeRateUncertaintyMetersPerSecond &&
        receivedSvTimeNanos == other.receivedSvTimeNanos &&
        receivedSvTimeUncertaintyNanos ==
            other.receivedSvTimeUncertaintyNanos &&
        snrInDb == other.snrInDb &&
        state == other.state &&
        timeOffsetNanos == other.timeOffsetNanos &&
        multipathIndicator == other.multipathIndicator &&
        carrierCycles == other.carrierCycles &&
        carrierPhase == other.carrierPhase &&
        carrierPhaseUncertainty == other.carrierPhaseUncertainty;
  }

  @core.override
  core.String toString() {
    return "GnssMeasurement(constellationType: $constellationType, svid: $svid, accumulatedDeltaRangeMeters: $accumulatedDeltaRangeMeters, accumulatedDeltaRangeState: $accumulatedDeltaRangeState, accumulatedDeltaRangeUncertaintyMeters: $accumulatedDeltaRangeUncertaintyMeters, carrierFrequencyHz: $carrierFrequencyHz, cn0DbHz: $cn0DbHz, pseudorangeRateMetersPerSecond: $pseudorangeRateMetersPerSecond, pseudorangeRateUncertaintyMetersPerSecond: $pseudorangeRateUncertaintyMetersPerSecond, receivedSvTimeNanos: $receivedSvTimeNanos, receivedSvTimeUncertaintyNanos: $receivedSvTimeUncertaintyNanos, snrInDb: $snrInDb, state: $state, timeOffsetNanos: $timeOffsetNanos, multipathIndicator: $multipathIndicator, carrierCycles: $carrierCycles, carrierPhase: $carrierPhase, carrierPhaseUncertainty: $carrierPhaseUncertainty)";
  }
}

abstract final class GnssMeasurementsEvent implements ffi.Finalizable {
  factory GnssMeasurementsEvent(
          GnssClock clock, core.List<GnssMeasurement> measurements) =>
      GnssMeasurementsEventImpl(clock, measurements);

  GnssClock get clock;
  core.List<GnssMeasurement> get measurements;

  @core.override
  core.int get hashCode => core.Object.hashAll([clock, measurements]);

  @core.override
  core.bool operator ==(covariant GnssMeasurementsEvent other) {
    if (core.identical(this, other)) {
      return true;
    }
    return clock == other.clock && measurements == other.measurements;
  }

  @core.override
  core.String toString() {
    return "GnssMeasurementsEvent(clock: $clock, measurements: $measurements)";
  }
}

///
abstract class GnssMeasurementsEventsNativeListener implements ffi.Finalizable {
  void onGnssMeasurementsEvent(GnssMeasurementsEvent event);
}

///
abstract class GnssMeasurementsEventsPlatformProvider {
  void finish();
}
