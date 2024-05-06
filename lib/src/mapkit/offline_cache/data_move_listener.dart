import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;

part 'data_move_listener.impl.dart';

/// Listener for the information about operations.
/// @attention This feature is not available in the free MapKit version.
abstract class OfflineCacheDataMoveListener {
  /// Called when the operation makes progress. Percent is the rate of
  /// completion in the range of 0 to 100.
  void onDataMoveProgress(core.int percent);

  /// Called when the request is completed.
  void onDataMoveCompleted();

  /// Called when an error occurs.
  void onDataMoveError(runtime_error.Error error);
}
