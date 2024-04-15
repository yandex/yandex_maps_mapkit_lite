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

part 'span.containers.dart';

/// @nodoc
final class SpanNative extends ffi.Struct {
  @ffi.Double()
  external core.double horizontalAngle;
  @ffi.Double()
  external core.double verticalAngle;
}

final SpanNative Function(core.double, core.double) _SpanNativeInit = lib
    .library
    .lookup<ffi.NativeFunction<SpanNative Function(ffi.Double, ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_Span_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Span.toPointer',
    toPlatform: '(val) => Span.fromPointer(val, needFree: false)')
class Span {
  final core.double horizontalAngle;
  final core.double verticalAngle;

  const Span({
    required this.horizontalAngle,
    required this.verticalAngle,
  });

  /// @nodoc
  @internal
  Span.fromNative(SpanNative native)
      : this(
            horizontalAngle: native.horizontalAngle,
            verticalAngle: native.verticalAngle);

  /// @nodoc
  @internal
  static SpanNative toNative(Span c) {
    return _SpanNativeInit(c.horizontalAngle, c.verticalAngle);
  }

  /// @nodoc
  @internal
  static Span? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Span.fromNative(ptr.cast<SpanNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Span? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<SpanNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
