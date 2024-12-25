import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/indoor/indoor_plan.dart'
    as mapkit_indoor_indoor_plan;

part 'indoor_state_listener.impl.dart';

/// Allows to handle events related to Indoor state.
abstract class IndoorStateListener {
  /// Notifies when user view focuses on a new plan (plan is NonNull).
  ///
  /// [activePlan] is valid until onActivePlanLeft call.
  void onActivePlanFocused(mapkit_indoor_indoor_plan.IndoorPlan activePlan);

  /// Notifies when user view leaves focus on a current active plan.
  void onActivePlanLeft();

  /// Notifies when the current active level is changed on the active plan.
  void onActiveLevelChanged(core.String activeLevelId);
}
