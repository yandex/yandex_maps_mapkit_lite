part of 'rect.dart';

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
    toNative: 'RectImpl.toPointer',
    toPlatform: '(val) => RectImpl.fromPointer(val, needFree: false)',
    platformType: 'Rect')
extension RectImpl on Rect {
  static Rect fromNative(RectNative native) {
    return Rect(to_platform.toPlatformPoint(native.min),
        to_platform.toPlatformPoint(native.max));
  }

  static RectNative toNative(Rect obj) {
    return _RectNativeInit(
        to_native.toNativePoint(obj.min), to_native.toNativePoint(obj.max));
  }

  static Rect? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = RectImpl.fromNative(ptr.cast<RectNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Rect? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<RectNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
