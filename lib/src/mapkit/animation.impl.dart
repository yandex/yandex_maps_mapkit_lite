part of 'animation.dart';

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
    toNative: 'AnimationImpl.toPointer',
    toPlatform: '(val) => AnimationImpl.fromPointer(val, needFree: false)',
    platformType: 'Animation')
extension AnimationImpl on Animation {
  static Animation fromNative(AnimationNative native) {
    return Animation(AnimationTypeImpl.fromInt(native.type),
        duration: native.duration);
  }

  static AnimationNative toNative(Animation obj) {
    return _AnimationNativeInit(
        AnimationTypeImpl.toInt(obj.type), obj.duration);
  }

  static Animation? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = AnimationImpl.fromNative(ptr.cast<AnimationNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Animation? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<AnimationNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'AnimationTypeImpl.toPointer',
    toPlatform: '(val) => AnimationTypeImpl.fromPointer(val, needFree: false)',
    platformType: 'AnimationType')
extension AnimationTypeImpl on AnimationType {
  static core.int toInt(AnimationType e) {
    return e.index;
  }

  static AnimationType fromInt(core.int val) {
    return AnimationType.values[val];
  }

  static AnimationType? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(AnimationType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
