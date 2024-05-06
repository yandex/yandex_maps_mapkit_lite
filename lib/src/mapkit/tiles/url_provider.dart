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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/tile_id.dart'
    as mapkit_tile_id;
import 'package:yandex_maps_mapkit_lite/src/mapkit/version.dart'
    as mapkit_version;

part 'url_provider.impl.dart';

/// Provides a formatted URL.
abstract class TilesUrlProvider {
  /// Create s a URL based on the tile ID, version, and features. Features
  /// are some layer customisations. Tiles with appropriate features are
  /// prioretized over tiles without them when loading.
  ///
  /// This method may be called on any thread. Its implementation must be thread-safe.
  core.String formatUrl(
      mapkit_tile_id.TileId tileId,
      mapkit_version.Version version,
      core.Map<core.String, core.String> features);
}
