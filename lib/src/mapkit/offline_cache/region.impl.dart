part of 'region.dart';

final class OfflineCacheRegionNative extends ffi.Struct {
  @ffi.Uint32()
  external core.int id;
  external native_types.NativeString name;
  external native_types.NativeString country;
  external mapkit_geometry_point.PointNative center;
  external mapkit_localized_value.LocalizedValueNative size;
  external native_types.NativeAbsTimestamp releaseTime;
  external ffi.Pointer<ffi.Void> parentId;
}

final OfflineCacheRegionNative Function(
        core.int,
        native_types.NativeString,
        native_types.NativeString,
        mapkit_geometry_point.PointNative,
        mapkit_localized_value.LocalizedValueNative,
        native_types.NativeAbsTimestamp,
        ffi.Pointer<ffi.Void>) _OfflineCacheRegionNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    OfflineCacheRegionNative Function(
                        ffi.Uint32,
                        native_types.NativeString,
                        native_types.NativeString,
                        mapkit_geometry_point.PointNative,
                        mapkit_localized_value.LocalizedValueNative,
                        native_types.NativeAbsTimestamp,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineCacheRegion_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'OfflineCacheRegionImpl.toPointer',
    toPlatform:
        '(val) => OfflineCacheRegionImpl.fromPointer(val, needFree: false)',
    platformType: 'OfflineCacheRegion')
extension OfflineCacheRegionImpl on OfflineCacheRegion {
  static OfflineCacheRegion fromNative(OfflineCacheRegionNative native) {
    return OfflineCacheRegion(
        id: native.id,
        name: to_platform.toPlatformString(native.name),
        country: to_platform.toPlatformString(native.country),
        mapkit_geometry_point.PointImpl.fromNative(native.center),
        mapkit_localized_value.LocalizedValueImpl.fromNative(native.size),
        to_platform.toPlatformAbsTimestamp(native.releaseTime),
        parentId: to_platform.toPlatformFromPointerUint32(native.parentId));
  }

  static OfflineCacheRegionNative toNative(OfflineCacheRegion obj) {
    return _OfflineCacheRegionNativeInit(
        obj.id,
        to_native.toNativeString(obj.name),
        to_native.toNativeString(obj.country),
        mapkit_geometry_point.PointImpl.toNative(obj.center),
        mapkit_localized_value.LocalizedValueImpl.toNative(obj.size),
        to_native.toNativeAbsTimestamp(obj.releaseTime),
        to_native.toNativePtrUint32(obj.parentId));
  }

  static OfflineCacheRegion? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = OfflineCacheRegionImpl.fromNative(
        ptr.cast<OfflineCacheRegionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(OfflineCacheRegion? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<OfflineCacheRegionNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
