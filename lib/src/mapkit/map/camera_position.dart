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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'camera_position.containers.dart';

/// @nodoc
final class CameraPositionNative extends ffi.Struct {
  external mapkit_geometry_point.PointNative target;
  @ffi.Float()
  external core.double zoom;
  @ffi.Float()
  external core.double azimuth;
  @ffi.Float()
  external core.double tilt;
}

final CameraPositionNative Function(
    mapkit_geometry_point.PointNative,
    core.double,
    core.double,
    core
        .double) _CameraPositionNativeInit = lib.library
    .lookup<
        ffi.NativeFunction<
            CameraPositionNative Function(
                mapkit_geometry_point.PointNative,
                ffi.Float,
                ffi.Float,
                ffi.Float)>>('yandex_flutter_mapkit_map_CameraPosition_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'CameraPosition.toPointer',
    toPlatform: '(val) => CameraPosition.fromPointer(val, needFree: false)')
class CameraPosition {
  final mapkit_geometry_point.Point target;
  final core.double zoom;
  final core.double azimuth;
  final core.double tilt;

  const CameraPosition(
    this.target, {
    required this.zoom,
    required this.azimuth,
    required this.tilt,
  });

  /// @nodoc
  @internal
  CameraPosition.fromNative(CameraPositionNative native)
      : this(mapkit_geometry_point.Point.fromNative(native.target),
            zoom: native.zoom, azimuth: native.azimuth, tilt: native.tilt);

  /// @nodoc
  @internal
  static CameraPositionNative toNative(CameraPosition c) {
    return _CameraPositionNativeInit(
        mapkit_geometry_point.Point.toNative(c.target),
        c.zoom,
        c.azimuth,
        c.tilt);
  }

  /// @nodoc
  @internal
  static CameraPosition? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        CameraPosition.fromNative(ptr.cast<CameraPositionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(CameraPosition? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<CameraPositionNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
