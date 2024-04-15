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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/localized_value.dart'
    as mapkit_localized_value;

part 'region.containers.dart';

/// @nodoc
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
    toNative: 'OfflineCacheRegion.toPointer',
    toPlatform: '(val) => OfflineCacheRegion.fromPointer(val, needFree: false)')
class OfflineCacheRegion {
  final core.int id;
  final core.String name;
  final core.String country;
  final mapkit_geometry_point.Point center;
  final mapkit_localized_value.LocalizedValue size;
  final core.DateTime releaseTime;
  final core.int? parentId;

  const OfflineCacheRegion(
    this.center,
    this.size,
    this.releaseTime, {
    required this.id,
    required this.name,
    required this.country,
    this.parentId,
  });

  /// @nodoc
  @internal
  OfflineCacheRegion.fromNative(OfflineCacheRegionNative native)
      : this(
            id: native.id,
            name: to_platform.toPlatformString(native.name),
            country: to_platform.toPlatformString(native.country),
            mapkit_geometry_point.Point.fromNative(native.center),
            mapkit_localized_value.LocalizedValue.fromNative(native.size),
            to_platform.toPlatformAbsTimestamp(native.releaseTime),
            parentId: to_platform.toPlatformFromPointerUint32(native.parentId));

  /// @nodoc
  @internal
  static OfflineCacheRegionNative toNative(OfflineCacheRegion c) {
    return _OfflineCacheRegionNativeInit(
        c.id,
        to_native.toNativeString(c.name),
        to_native.toNativeString(c.country),
        mapkit_geometry_point.Point.toNative(c.center),
        mapkit_localized_value.LocalizedValue.toNative(c.size),
        to_native.toNativeAbsTimestamp(c.releaseTime),
        to_native.toNativePtrUint32(c.parentId));
  }

  /// @nodoc
  @internal
  static OfflineCacheRegion? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        OfflineCacheRegion.fromNative(ptr.cast<OfflineCacheRegionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(OfflineCacheRegion? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<OfflineCacheRegionNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
