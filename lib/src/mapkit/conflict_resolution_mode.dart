import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'conflict_resolution_mode.containers.dart';
part 'conflict_resolution_mode.impl.dart';

/// Determines how feature participates in conflict resolution.
enum ConflictResolutionMode {
  /// Feature can be hidden (if supported) due to conflict with higher
  /// feature but will not conflict with lower features.
  Minor,

  /// Feature can be hidden (if supported) due to conflict with higher
  /// feature and can displace lower features.
  Equal,

  /// Feature can NOT be hidden but can displace lower features.
  Major,

  /// Feature doesn't participate in conflict resolution.
  Ignore,
  ;
}
