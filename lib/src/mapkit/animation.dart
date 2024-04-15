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

part 'animation.containers.dart';

/// @nodoc
final class AnimationNative extends ffi.Struct {
  @ffi.Int64()
  external core.int type;
  @ffi.Float()
  external core.double duration;
}

final AnimationNative Function(core.int, core.double) _AnimationNativeInit = lib
    .library
    .lookup<ffi.NativeFunction<AnimationNative Function(ffi.Int64, ffi.Float)>>(
        'yandex_flutter_mapkit_Animation_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Animation.toPointer',
    toPlatform: '(val) => Animation.fromPointer(val, needFree: false)')
class Animation {
  final AnimationType type;
  final core.double duration;

  const Animation(
    this.type, {
    required this.duration,
  });

  /// @nodoc
  @internal
  Animation.fromNative(AnimationNative native)
      : this(AnimationType.fromInt(native.type), duration: native.duration);

  /// @nodoc
  @internal
  static AnimationNative toNative(Animation c) {
    return _AnimationNativeInit(AnimationType.toInt(c.type), c.duration);
  }

  /// @nodoc
  @internal
  static Animation? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Animation.fromNative(ptr.cast<AnimationNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Animation? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<AnimationNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

/// Available animation types.
@bindings_annotations.ContainerData(
    toNative: 'AnimationType.toPointer',
    toPlatform: '(val) => AnimationType.fromPointer(val, needFree: false)')
enum AnimationType {
  /// Smooth interpolation between start and finish states.
  Smooth,

  /// Movement with constant speed during animation time.
  Linear,
  ;

  /// @nodoc
  @internal
  static AnimationType fromInt(core.int val) {
    return AnimationType.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(AnimationType e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static AnimationType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(AnimationType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
