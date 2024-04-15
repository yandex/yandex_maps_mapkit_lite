import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'rotation_type.containers.dart';

/// The way rotation is handled.
@bindings_annotations.ContainerData(
    toNative: 'RotationType.toPointer',
    toPlatform: '(val) => RotationType.fromPointer(val, needFree: false)')
enum RotationType {
  /// Ignores the placemark direction; stable in screen space.
  NoRotation,

  /// Follows the placemark direction. For non-flat placemarks, the
  /// direction vector is projected onto the screen plane.
  Rotate,
  ;

  /// @nodoc
  @internal
  static RotationType fromInt(core.int val) {
    return RotationType.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(RotationType e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static RotationType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(RotationType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
