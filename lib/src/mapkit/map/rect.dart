import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:math' as math;
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

part 'rect.containers.dart';

/// @nodoc
final class RectNative extends ffi.Struct {
  external native_types.NativePoint min;
  external native_types.NativePoint max;
}

final RectNative Function(native_types.NativePoint, native_types.NativePoint)
    _RectNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    RectNative Function(
                        native_types.NativePoint, native_types.NativePoint)>>(
            'yandex_flutter_mapkit_map_Rect_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Rect.toPointer',
    toPlatform: '(val) => Rect.fromPointer(val, needFree: false)')
class Rect {
  final math.Point<core.double> min;
  final math.Point<core.double> max;

  const Rect(this.min, this.max);

  /// @nodoc
  @internal
  Rect.fromNative(RectNative native)
      : this(to_platform.toPlatformPoint(native.min),
            to_platform.toPlatformPoint(native.max));

  /// @nodoc
  @internal
  static RectNative toNative(Rect c) {
    return _RectNativeInit(
        to_native.toNativePoint(c.min), to_native.toNativePoint(c.max));
  }

  /// @nodoc
  @internal
  static Rect? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Rect.fromNative(ptr.cast<RectNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Rect? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<RectNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
