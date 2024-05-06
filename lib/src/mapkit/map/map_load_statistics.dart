import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
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

part 'map_load_statistics.containers.dart';
part 'map_load_statistics.impl.dart';

final class MapLoadStatistics {
  final core.Duration curZoomGeometryLoaded;
  final core.Duration curZoomPlacemarksLoaded;
  final core.Duration curZoomLabelsLoaded;
  final core.Duration delayedGeometryLoaded;
  final core.Duration curZoomModelsLoaded;
  final core.Duration fullyLoaded;
  final core.Duration fullyAppeared;
  final core.int renderObjectCount;
  final core.int tileMemoryUsage;

  const MapLoadStatistics(
    this.curZoomGeometryLoaded,
    this.curZoomPlacemarksLoaded,
    this.curZoomLabelsLoaded,
    this.delayedGeometryLoaded,
    this.curZoomModelsLoaded,
    this.fullyLoaded,
    this.fullyAppeared, {
    required this.renderObjectCount,
    required this.tileMemoryUsage,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([
        curZoomGeometryLoaded,
        curZoomPlacemarksLoaded,
        curZoomLabelsLoaded,
        delayedGeometryLoaded,
        curZoomModelsLoaded,
        fullyLoaded,
        fullyAppeared,
        renderObjectCount,
        tileMemoryUsage
      ]);

  @core.override
  core.bool operator ==(covariant MapLoadStatistics other) {
    if (core.identical(this, other)) {
      return true;
    }
    return curZoomGeometryLoaded == other.curZoomGeometryLoaded &&
        curZoomPlacemarksLoaded == other.curZoomPlacemarksLoaded &&
        curZoomLabelsLoaded == other.curZoomLabelsLoaded &&
        delayedGeometryLoaded == other.delayedGeometryLoaded &&
        curZoomModelsLoaded == other.curZoomModelsLoaded &&
        fullyLoaded == other.fullyLoaded &&
        fullyAppeared == other.fullyAppeared &&
        renderObjectCount == other.renderObjectCount &&
        tileMemoryUsage == other.tileMemoryUsage;
  }

  @core.override
  core.String toString() {
    return "MapLoadStatistics(curZoomGeometryLoaded: $curZoomGeometryLoaded, curZoomPlacemarksLoaded: $curZoomPlacemarksLoaded, curZoomLabelsLoaded: $curZoomLabelsLoaded, delayedGeometryLoaded: $delayedGeometryLoaded, curZoomModelsLoaded: $curZoomModelsLoaded, fullyLoaded: $fullyLoaded, fullyAppeared: $fullyAppeared, renderObjectCount: $renderObjectCount, tileMemoryUsage: $tileMemoryUsage)";
  }
}
