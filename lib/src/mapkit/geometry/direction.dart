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

part 'direction.containers.dart';

/// @nodoc
final class DirectionNative extends ffi.Struct {
  @ffi.Double()
  external core.double azimuth;
  @ffi.Double()
  external core.double tilt;
}

final DirectionNative Function(core.double, core.double) _DirectionNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    DirectionNative Function(ffi.Double, ffi.Double)>>(
            'yandex_flutter_mapkit_geometry_Direction_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Direction.toPointer',
    toPlatform: '(val) => Direction.fromPointer(val, needFree: false)')
class Direction {
  final core.double azimuth;
  final core.double tilt;

  const Direction({
    required this.azimuth,
    required this.tilt,
  });

  /// @nodoc
  @internal
  Direction.fromNative(DirectionNative native)
      : this(azimuth: native.azimuth, tilt: native.tilt);

  /// @nodoc
  @internal
  static DirectionNative toNative(Direction c) {
    return _DirectionNativeInit(c.azimuth, c.tilt);
  }

  /// @nodoc
  @internal
  static Direction? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Direction.fromNative(ptr.cast<DirectionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Direction? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<DirectionNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
