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

part 'xy_point.containers.dart';

/// @nodoc
final class XYPointNative extends ffi.Struct {
  @ffi.Double()
  external core.double x;
  @ffi.Double()
  external core.double y;
}

final XYPointNative Function(core.double, core.double) _XYPointNativeInit = lib
    .library
    .lookup<ffi.NativeFunction<XYPointNative Function(ffi.Double, ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_geo_XYPoint_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'XYPoint.toPointer',
    toPlatform: '(val) => XYPoint.fromPointer(val, needFree: false)')
class XYPoint {
  final core.double x;
  final core.double y;

  const XYPoint({
    required this.x,
    required this.y,
  });

  /// @nodoc
  @internal
  XYPoint.fromNative(XYPointNative native) : this(x: native.x, y: native.y);

  /// @nodoc
  @internal
  static XYPointNative toNative(XYPoint c) {
    return _XYPointNativeInit(c.x, c.y);
  }

  /// @nodoc
  @internal
  static XYPoint? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = XYPoint.fromNative(ptr.cast<XYPointNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(XYPoint? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<XYPointNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
