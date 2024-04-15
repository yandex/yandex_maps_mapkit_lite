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

part 'location.containers.dart';

/// @nodoc
final class LocationNative extends ffi.Struct {
  external mapkit_geometry_point.PointNative position;
  external ffi.Pointer<ffi.Void> accuracy;
  external ffi.Pointer<ffi.Void> altitude;
  external ffi.Pointer<ffi.Void> altitudeAccuracy;
  external ffi.Pointer<ffi.Void> heading;
  external ffi.Pointer<ffi.Void> speed;
  external native_types.NativeAbsTimestamp absoluteTimestamp;
  external native_types.NativeRelTimestamp relativeTimestamp;
}

final LocationNative Function(
  mapkit_geometry_point.PointNative,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
  native_types.NativeAbsTimestamp,
  native_types.NativeRelTimestamp,
) _LocationNativeInit = lib.library
    .lookup<
        ffi.NativeFunction<
            LocationNative Function(
              mapkit_geometry_point.PointNative,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              native_types.NativeAbsTimestamp,
              native_types.NativeRelTimestamp,
            )>>('yandex_flutter_mapkit_location_Location_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Location.toPointer',
    toPlatform: '(val) => Location.fromPointer(val, needFree: false)')
class Location {
  final mapkit_geometry_point.Point position;
  final core.double? accuracy;
  final core.double? altitude;
  final core.double? altitudeAccuracy;
  final core.double? heading;
  final core.double? speed;
  final core.DateTime absoluteTimestamp;
  final core.DateTime relativeTimestamp;

  const Location(
    this.position,
    this.absoluteTimestamp,
    this.relativeTimestamp, {
    this.accuracy,
    this.altitude,
    this.altitudeAccuracy,
    this.heading,
    this.speed,
  });

  /// @nodoc
  @internal
  Location.fromNative(LocationNative native)
      : this(
          mapkit_geometry_point.Point.fromNative(native.position),
          accuracy: to_platform.toPlatformFromPointerDouble(native.accuracy),
          altitude: to_platform.toPlatformFromPointerDouble(native.altitude),
          altitudeAccuracy:
              to_platform.toPlatformFromPointerDouble(native.altitudeAccuracy),
          heading: to_platform.toPlatformFromPointerDouble(native.heading),
          speed: to_platform.toPlatformFromPointerDouble(native.speed),
          to_platform.toPlatformAbsTimestamp(native.absoluteTimestamp),
          to_platform.toPlatformRelTimestamp(native.relativeTimestamp),
        );

  /// @nodoc
  @internal
  static LocationNative toNative(Location c) {
    return _LocationNativeInit(
      mapkit_geometry_point.Point.toNative(c.position),
      to_native.toNativePtrDouble(c.accuracy),
      to_native.toNativePtrDouble(c.altitude),
      to_native.toNativePtrDouble(c.altitudeAccuracy),
      to_native.toNativePtrDouble(c.heading),
      to_native.toNativePtrDouble(c.speed),
      to_native.toNativeAbsTimestamp(c.absoluteTimestamp),
      to_native.toNativeRelTimestamp(c.relativeTimestamp),
    );
  }

  /// @nodoc
  @internal
  static Location? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Location.fromNative(ptr.cast<LocationNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Location? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LocationNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
