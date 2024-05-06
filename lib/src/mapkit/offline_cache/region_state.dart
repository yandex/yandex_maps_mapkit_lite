import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'region_state.containers.dart';
part 'region_state.impl.dart';

/// The state of the region.
/// @attention This feature is not available in the free MapKit version.
enum OfflineCacheRegionState {
  /// Available for download on the server.
  Available,

  /// Download in progress.
  Downloading,

  /// Download is paused.
  Paused,

  /// Cache data installation is finished.
  Completed,

  /// The region was completed but there is a newer version on the server.
  Outdated,

  /// The region was removed from regions list and will never be updated
  Unsupported,

  /// The region is significantly outdated or it contains invalid data. OCM
  /// will redownload it automatically if autoupdate enabled.
  NeedUpdate,
  ;
}
