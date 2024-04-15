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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'polyline_index.containers.dart';

/// Provides methods for binding locations to a polyline
@bindings_annotations.ContainerData(
    toNative: 'PolylineIndex.getNativePtr',
    toPlatform:
        '(val) => PolylineIndex.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class PolylineIndex implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_PolylineIndex_free.cast());

  /// @nodoc
  PolylineIndex.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  PolylineIndex.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PolylineIndex? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  @internal

  /// @nodoc
  static PolylineIndex? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PolylineIndex.fromNativePtr(ptr);
  }

  /// Finds closest polyline position. Returns null if there is no position
  /// that satisfies the condition distance(point, position) <
  /// maxLocationBias.
  ///
  /// Two modes are available: 1. Find the closest polyline position to a
  /// raw point [PolylineIndexPriority.ClosestToRawPoint] 2. Find the
  /// closest polyline position to the polyline start
  /// [PolylineIndexPriority.ClosestToStart].
  mapkit_geometry_geometry.PolylinePosition?
      closestPolylinePositionWithPriority(
    mapkit_geometry_point.Point point,
    PolylineIndexPriority priority, {
    required core.double maxLocationBias,
  }) {
    return mapkit_geometry_geometry.PolylinePosition.fromPointer(
        _PolylineIndex_closestPolylinePositionWithPriority(
            ptr,
            mapkit_geometry_point.Point.toNative(point),
            PolylineIndexPriority.toInt(priority),
            maxLocationBias));
  }

  /// Finds the closest polyline position between the two positions.
  /// Returns null if there is no position that satisfies the condition
  /// distance(point, position) < maxLocationBias.
  mapkit_geometry_geometry.PolylinePosition? closestPolylinePosition(
    mapkit_geometry_point.Point point,
    mapkit_geometry_geometry.PolylinePosition positionFrom,
    mapkit_geometry_geometry.PolylinePosition positionTo, {
    required core.double maxLocationBias,
  }) {
    return mapkit_geometry_geometry.PolylinePosition.fromPointer(
        _PolylineIndex_closestPolylinePosition(
            ptr,
            mapkit_geometry_point.Point.toNative(point),
            mapkit_geometry_geometry.PolylinePosition.toNative(positionFrom),
            mapkit_geometry_geometry.PolylinePosition.toNative(positionTo),
            maxLocationBias));
  }
}

final _PolylineIndex_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineIndex_free');

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point.PointNative,
    core.int,
    core
        .double) _PolylineIndex_closestPolylinePositionWithPriority = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative, ffi.Int64, ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineIndex_closestPolylinePositionWithPriority')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point.PointNative,
    mapkit_geometry_geometry.PolylinePositionNative,
    mapkit_geometry_geometry.PolylinePositionNative,
    core
        .double) _PolylineIndex_closestPolylinePosition = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative,
                    mapkit_geometry_geometry.PolylinePositionNative,
                    mapkit_geometry_geometry.PolylinePositionNative,
                    ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineIndex_closestPolylinePosition')
    .asFunction();

@bindings_annotations.ContainerData(
    toNative: 'PolylineIndexPriority.toPointer',
    toPlatform:
        '(val) => PolylineIndexPriority.fromPointer(val, needFree: false)')
enum PolylineIndexPriority {
  ClosestToRawPoint,
  ClosestToStart,
  ;

  /// @nodoc
  @internal
  static PolylineIndexPriority fromInt(core.int val) {
    return PolylineIndexPriority.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(PolylineIndexPriority e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static PolylineIndexPriority? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(PolylineIndexPriority? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
