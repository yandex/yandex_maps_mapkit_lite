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

part 'visible_region.containers.dart';

/// @nodoc
final class VisibleRegionNative extends ffi.Struct {
  external mapkit_geometry_point.PointNative topLeft;
  external mapkit_geometry_point.PointNative topRight;
  external mapkit_geometry_point.PointNative bottomLeft;
  external mapkit_geometry_point.PointNative bottomRight;
}

final VisibleRegionNative Function(
        mapkit_geometry_point.PointNative,
        mapkit_geometry_point.PointNative,
        mapkit_geometry_point.PointNative,
        mapkit_geometry_point.PointNative) _VisibleRegionNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    VisibleRegionNative Function(
                        mapkit_geometry_point.PointNative,
                        mapkit_geometry_point.PointNative,
                        mapkit_geometry_point.PointNative,
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_map_VisibleRegion_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'VisibleRegion.toPointer',
    toPlatform: '(val) => VisibleRegion.fromPointer(val, needFree: false)')
class VisibleRegion {
  final mapkit_geometry_point.Point topLeft;
  final mapkit_geometry_point.Point topRight;
  final mapkit_geometry_point.Point bottomLeft;
  final mapkit_geometry_point.Point bottomRight;

  const VisibleRegion(
      this.topLeft, this.topRight, this.bottomLeft, this.bottomRight);

  /// @nodoc
  @internal
  VisibleRegion.fromNative(VisibleRegionNative native)
      : this(
            mapkit_geometry_point.Point.fromNative(native.topLeft),
            mapkit_geometry_point.Point.fromNative(native.topRight),
            mapkit_geometry_point.Point.fromNative(native.bottomLeft),
            mapkit_geometry_point.Point.fromNative(native.bottomRight));

  /// @nodoc
  @internal
  static VisibleRegionNative toNative(VisibleRegion c) {
    return _VisibleRegionNativeInit(
        mapkit_geometry_point.Point.toNative(c.topLeft),
        mapkit_geometry_point.Point.toNative(c.topRight),
        mapkit_geometry_point.Point.toNative(c.bottomLeft),
        mapkit_geometry_point.Point.toNative(c.bottomRight));
  }

  /// @nodoc
  @internal
  static VisibleRegion? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        VisibleRegion.fromNative(ptr.cast<VisibleRegionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(VisibleRegion? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<VisibleRegionNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

class VisibleRegionUtils {
  VisibleRegionUtils._();

  /// Converts visible region to polygon geometry
  static mapkit_geometry_geometry.Geometry toPolygon(
      VisibleRegion visibleRegion) {
    return mapkit_geometry_geometry.Geometry.toPlatform(
        _VisibleRegionUtils_toPolygon(VisibleRegion.toNative(visibleRegion)));
  }

  /// Return BoundingBox for provided [VisibleRegion]
  static mapkit_geometry_geometry.BoundingBox getBounds(
      VisibleRegion visibleRegion) {
    return mapkit_geometry_geometry.BoundingBox.fromNative(
        _VisibleRegionUtils_getBounds(VisibleRegion.toNative(visibleRegion)));
  }
}

final mapkit_geometry_geometry.GeometryNative Function(VisibleRegionNative)
    _VisibleRegionUtils_toPolygon = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geometry.GeometryNative Function(
                        VisibleRegionNative)>>(
            'yandex_flutter_mapkit_map_VisibleRegionUtils_toPolygon')
        .asFunction();
final mapkit_geometry_geometry.BoundingBoxNative Function(VisibleRegionNative)
    _VisibleRegionUtils_getBounds = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geometry.BoundingBoxNative Function(
                        VisibleRegionNative)>>(
            'yandex_flutter_mapkit_map_VisibleRegionUtils_getBounds')
        .asFunction();
