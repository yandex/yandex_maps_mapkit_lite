part of 'map_load_statistics.dart';

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
    toNative: 'MapLoadStatisticsImpl.toPointer',
    toPlatform:
        '(val) => MapLoadStatisticsImpl.fromPointer(val, needFree: false)',
    platformType: 'MapLoadStatistics')
extension MapLoadStatisticsImpl on MapLoadStatistics {
  static MapLoadStatistics fromNative(MapLoadStatisticsNative native) {
    return MapLoadStatistics(
        to_platform.toPlatformTimeInterval(native.curZoomGeometryLoaded),
        to_platform.toPlatformTimeInterval(native.curZoomPlacemarksLoaded),
        to_platform.toPlatformTimeInterval(native.curZoomLabelsLoaded),
        to_platform.toPlatformTimeInterval(native.delayedGeometryLoaded),
        to_platform.toPlatformTimeInterval(native.curZoomModelsLoaded),
        to_platform.toPlatformTimeInterval(native.fullyLoaded),
        to_platform.toPlatformTimeInterval(native.fullyAppeared),
        renderObjectCount: native.renderObjectCount,
        tileMemoryUsage: native.tileMemoryUsage);
  }

  static MapLoadStatisticsNative toNative(MapLoadStatistics obj) {
    return _MapLoadStatisticsNativeInit(
        to_native.toNativeTimeInterval(obj.curZoomGeometryLoaded),
        to_native.toNativeTimeInterval(obj.curZoomPlacemarksLoaded),
        to_native.toNativeTimeInterval(obj.curZoomLabelsLoaded),
        to_native.toNativeTimeInterval(obj.delayedGeometryLoaded),
        to_native.toNativeTimeInterval(obj.curZoomModelsLoaded),
        to_native.toNativeTimeInterval(obj.fullyLoaded),
        to_native.toNativeTimeInterval(obj.fullyAppeared),
        obj.renderObjectCount,
        obj.tileMemoryUsage);
  }

  static MapLoadStatistics? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = MapLoadStatisticsImpl.fromNative(
        ptr.cast<MapLoadStatisticsNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(MapLoadStatistics? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<MapLoadStatisticsNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
