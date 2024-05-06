part of 'zoom_range.dart';

final class ZoomRangeIdlNative extends ffi.Struct {
  @ffi.Uint32()
  external core.int zMin;
  @ffi.Uint32()
  external core.int zMax;
}

final ZoomRangeIdlNative Function(core.int, core.int) _ZoomRangeIdlNativeInit =
    lib.library
        .lookup<
            ffi.NativeFunction<
                ZoomRangeIdlNative Function(ffi.Uint32,
                    ffi.Uint32)>>('yandex_flutter_mapkit_ZoomRangeIdl_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ZoomRangeIdlImpl.toPointer',
    toPlatform: '(val) => ZoomRangeIdlImpl.fromPointer(val, needFree: false)',
    platformType: 'ZoomRangeIdl')
extension ZoomRangeIdlImpl on ZoomRangeIdl {
  static ZoomRangeIdl fromNative(ZoomRangeIdlNative native) {
    return ZoomRangeIdl(zMin: native.zMin, zMax: native.zMax);
  }

  static ZoomRangeIdlNative toNative(ZoomRangeIdl obj) {
    return _ZoomRangeIdlNativeInit(obj.zMin, obj.zMax);
  }

  static ZoomRangeIdl? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        ZoomRangeIdlImpl.fromNative(ptr.cast<ZoomRangeIdlNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(ZoomRangeIdl? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ZoomRangeIdlNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
