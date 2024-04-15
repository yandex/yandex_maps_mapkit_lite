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

part 'jam_segment.containers.dart';

/// The intensity of traffic.
@bindings_annotations.ContainerData(
    toNative: 'JamType.toPointer',
    toPlatform: '(val) => JamType.fromPointer(val, needFree: false)')
enum JamType {
  /// Unknown intensity.
  Unknown,

  /// Route is blocked.
  Blocked,

  /// Route is free.
  Free,

  /// Light traffic on route.
  Light,

  /// Heavy traffic on route.
  Hard,

  /// Very heavy traffic on route.
  VeryHard,
  ;

  /// @nodoc
  @internal
  static JamType fromInt(core.int val) {
    return JamType.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(JamType e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static JamType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(JamType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

/// @nodoc
final class JamSegmentNative extends ffi.Struct {
  @ffi.Int64()
  external core.int jamType;
  @ffi.Double()
  external core.double speed;
}

final JamSegmentNative Function(core.int, core.double) _JamSegmentNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    JamSegmentNative Function(ffi.Int64, ffi.Double)>>(
            'yandex_flutter_mapkit_navigation_JamSegment_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'JamSegment.toPointer',
    toPlatform: '(val) => JamSegment.fromPointer(val, needFree: false)')
class JamSegment {
  final JamType jamType;
  final core.double speed;

  const JamSegment(
    this.jamType, {
    required this.speed,
  });

  /// @nodoc
  @internal
  JamSegment.fromNative(JamSegmentNative native)
      : this(JamType.fromInt(native.jamType), speed: native.speed);

  /// @nodoc
  @internal
  static JamSegmentNative toNative(JamSegment c) {
    return _JamSegmentNativeInit(JamType.toInt(c.jamType), c.speed);
  }

  /// @nodoc
  @internal
  static JamSegment? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = JamSegment.fromNative(ptr.cast<JamSegmentNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(JamSegment? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<JamSegmentNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
