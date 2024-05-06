import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/version.dart'
    as mapkit_version;

part 'raw_tile.containers.dart';
part 'raw_tile.impl.dart';

abstract final class RawTile implements ffi.Finalizable {
  factory RawTile(
          mapkit_version.Version version,
          core.Map<core.String, core.String> features,
          core.String etag,
          RawTileUseCache useCache,
          RawTileState state,
          typed_data.ByteBuffer rawData) =>
      RawTileImpl(version, features, etag, useCache, state, rawData);

  mapkit_version.Version get version;
  core.Map<core.String, core.String> get features;
  core.String get etag;
  RawTileUseCache get useCache;
  RawTileState get state;
  typed_data.ByteBuffer get rawData;

  @core.override
  core.int get hashCode =>
      core.Object.hashAll([version, features, etag, useCache, state, rawData]);

  @core.override
  core.bool operator ==(covariant RawTile other) {
    if (core.identical(this, other)) {
      return true;
    }
    return version == other.version &&
        features == other.features &&
        etag == other.etag &&
        useCache == other.useCache &&
        state == other.state &&
        rawData == other.rawData;
  }

  @core.override
  core.String toString() {
    return "RawTile(version: $version, features: $features, etag: $etag, useCache: $useCache, state: $state, rawData: $rawData)";
  }
}

/// Available tile states.
enum RawTileState {
  /// Tile is available.
  Ok,

  /// Tile was not modified.
  NotModified,

  /// An error occurred when processing the tile.
  Error,
  ;
}

enum RawTileUseCache {
  Yes,
  No,
  ;
}
