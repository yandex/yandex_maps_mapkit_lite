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

part 'point.containers.dart';

/// @nodoc
final class PointNative extends ffi.Struct {
  @ffi.Double()
  external core.double latitude;
  @ffi.Double()
  external core.double longitude;
}

final PointNative Function(core.double, core.double) _PointNativeInit = lib
    .library
    .lookup<ffi.NativeFunction<PointNative Function(ffi.Double, ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_Point_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Point.toPointer',
    toPlatform: '(val) => Point.fromPointer(val, needFree: false)')
class Point {
  final core.double latitude;
  final core.double longitude;

  const Point({
    required this.latitude,
    required this.longitude,
  });

  /// @nodoc
  @internal
  Point.fromNative(PointNative native)
      : this(latitude: native.latitude, longitude: native.longitude);

  /// @nodoc
  @internal
  static PointNative toNative(Point c) {
    return _PointNativeInit(c.latitude, c.longitude);
  }

  /// @nodoc
  @internal
  static Point? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Point.fromNative(ptr.cast<PointNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Point? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<PointNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
