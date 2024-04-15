import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'region_state.containers.dart';

/// The state of the region.
/// @attention This feature is not available in the free MapKit version.
@bindings_annotations.ContainerData(
    toNative: 'OfflineCacheRegionState.toPointer',
    toPlatform:
        '(val) => OfflineCacheRegionState.fromPointer(val, needFree: false)')
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

  /// @nodoc
  @internal
  static OfflineCacheRegionState fromInt(core.int val) {
    return OfflineCacheRegionState.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(OfflineCacheRegionState e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static OfflineCacheRegionState? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(OfflineCacheRegionState? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
