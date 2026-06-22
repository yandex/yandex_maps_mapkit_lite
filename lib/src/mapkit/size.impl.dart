part of 'size.dart';

final class Size2uNative extends ffi.Struct {
  @ffi.Uint32()
  external core.int width;
  @ffi.Uint32()
  external core.int height;
}

final Size2uNative Function(core.int, core.int) _Size2uNativeInit = lib.library
    .lookup<ffi.NativeFunction<Size2uNative Function(ffi.Uint32, ffi.Uint32)>>(
        'yandex_flutter_mapkit_Size2u_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Size2uImpl.toPointer',
    toPlatform: '(val) => Size2uImpl.fromPointer(val, needFree: false)',
    platformType: 'Size2u')
extension Size2uImpl on Size2u {
  static Size2u fromNative(Size2uNative native) {
    return Size2u(width: native.width, height: native.height);
  }

  static Size2uNative toNative(Size2u obj) {
    return _Size2uNativeInit(obj.width, obj.height);
  }

  static Size2u? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = Size2uImpl.fromNative(ptr.cast<Size2uNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Size2u? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<Size2uNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
