import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
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

part 'request_point.containers.dart';

/// The waypoint and a point the path must go through.
@bindings_annotations.ContainerData(
    toNative: 'RequestPointType.toPointer',
    toPlatform: '(val) => RequestPointType.fromPointer(val, needFree: false)')
enum RequestPointType {
  /// The target waypoint.
  Waypoint,

  /// A point the route must pass through.
  Viapoint,
  ;

  /// @nodoc
  @internal
  static RequestPointType fromInt(core.int val) {
    return RequestPointType.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(RequestPointType e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static RequestPointType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(RequestPointType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'RequestPoint.toPointer',
    toPlatform: '(val) => RequestPoint.fromPointer(val, needFree: false)')
class RequestPoint implements ffi.Finalizable {
  late final point =
      mapkit_geometry_point.Point.fromNative(_RequestPoint_get_point(_ptr));
  late final type = RequestPointType.fromInt(_RequestPoint_get_type(_ptr));
  late final pointContext = to_platform
      .toPlatformFromPointerString(_RequestPoint_get_pointContext(_ptr));
  late final drivingArrivalPointId = to_platform.toPlatformFromPointerString(
      _RequestPoint_get_drivingArrivalPointId(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_RequestPoint_free.cast());

  RequestPoint(mapkit_geometry_point.Point point, RequestPointType type,
      core.String? pointContext, core.String? drivingArrivalPointId)
      : this.fromNativePtr(_RequestPoint_init(
            mapkit_geometry_point.Point.toNative(point),
            RequestPointType.toInt(type),
            to_native.toNativePtrString(pointContext),
            to_native.toNativePtrString(drivingArrivalPointId)));

  /// @nodoc
  @internal
  RequestPoint.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(RequestPoint? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static RequestPoint? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return RequestPoint.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static RequestPoint? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        RequestPoint.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(RequestPoint? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _RequestPoint_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _RequestPoint_clone = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RequestPoint_clone')
        .asFunction(isLeaf: true);

final _RequestPoint_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_RequestPoint_free');

final ffi.Pointer<ffi.Void> Function(mapkit_geometry_point.PointNative,
        core.int, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _RequestPoint_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        mapkit_geometry_point.PointNative,
                        ffi.Int64,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RequestPoint_init')
        .asFunction(isLeaf: true);

final mapkit_geometry_point.PointNative Function(ffi.Pointer<ffi.Void>)
    _RequestPoint_get_point = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_point.PointNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RequestPoint_get_point')
        .asFunction(isLeaf: true);
final core.int Function(ffi.Pointer<ffi.Void>) _RequestPoint_get_type = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_RequestPoint_get_type')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _RequestPoint_get_pointContext = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RequestPoint_get_pointContext')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _RequestPoint_get_drivingArrivalPointId = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RequestPoint_get_drivingArrivalPointId')
        .asFunction(isLeaf: true);
