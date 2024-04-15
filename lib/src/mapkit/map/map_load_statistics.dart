import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
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

/// @nodoc
final class MapLoadStatisticsNative extends ffi.Struct {
  external native_types.NativeInterval curZoomGeometryLoaded;
  external native_types.NativeInterval curZoomPlacemarksLoaded;
  external native_types.NativeInterval curZoomLabelsLoaded;
  external native_types.NativeInterval delayedGeometryLoaded;
  external native_types.NativeInterval curZoomModelsLoaded;
  external native_types.NativeInterval fullyLoaded;
  external native_types.NativeInterval fullyAppeared;
  @ffi.Int()
  external core.int renderObjectCount;
  @ffi.Uint32()
  external core.int tileMemoryUsage;
}

final MapLoadStatisticsNative Function(
        native_types.NativeInterval,
        native_types.NativeInterval,
        native_types.NativeInterval,
        native_types.NativeInterval,
        native_types.NativeInterval,
        native_types.NativeInterval,
        native_types.NativeInterval,
        core.int,
        core.int) _MapLoadStatisticsNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    MapLoadStatisticsNative Function(
                        native_types.NativeInterval,
                        native_types.NativeInterval,
                        native_types.NativeInterval,
                        native_types.NativeInterval,
                        native_types.NativeInterval,
                        native_types.NativeInterval,
                        native_types.NativeInterval,
                        ffi.Int,
                        ffi.Uint32)>>(
            'yandex_flutter_mapkit_map_MapLoadStatistics_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'MapLoadStatistics.toPointer',
    toPlatform: '(val) => MapLoadStatistics.fromPointer(val, needFree: false)')
class MapLoadStatistics {
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

  /// @nodoc
  @internal
  MapLoadStatistics.fromNative(MapLoadStatisticsNative native)
      : this(
            to_platform.toPlatformTimeInterval(native.curZoomGeometryLoaded),
            to_platform.toPlatformTimeInterval(native.curZoomPlacemarksLoaded),
            to_platform.toPlatformTimeInterval(native.curZoomLabelsLoaded),
            to_platform.toPlatformTimeInterval(native.delayedGeometryLoaded),
            to_platform.toPlatformTimeInterval(native.curZoomModelsLoaded),
            to_platform.toPlatformTimeInterval(native.fullyLoaded),
            to_platform.toPlatformTimeInterval(native.fullyAppeared),
            renderObjectCount: native.renderObjectCount,
            tileMemoryUsage: native.tileMemoryUsage);

  /// @nodoc
  @internal
  static MapLoadStatisticsNative toNative(MapLoadStatistics c) {
    return _MapLoadStatisticsNativeInit(
        to_native.toNativeTimeInterval(c.curZoomGeometryLoaded),
        to_native.toNativeTimeInterval(c.curZoomPlacemarksLoaded),
        to_native.toNativeTimeInterval(c.curZoomLabelsLoaded),
        to_native.toNativeTimeInterval(c.delayedGeometryLoaded),
        to_native.toNativeTimeInterval(c.curZoomModelsLoaded),
        to_native.toNativeTimeInterval(c.fullyLoaded),
        to_native.toNativeTimeInterval(c.fullyAppeared),
        c.renderObjectCount,
        c.tileMemoryUsage);
  }

  /// @nodoc
  @internal
  static MapLoadStatistics? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        MapLoadStatistics.fromNative(ptr.cast<MapLoadStatisticsNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(MapLoadStatistics? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<MapLoadStatisticsNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
