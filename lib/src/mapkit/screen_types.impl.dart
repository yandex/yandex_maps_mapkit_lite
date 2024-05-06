part of 'screen_types.dart';

final class ScreenPointNative extends ffi.Struct {
  @ffi.Float()
  external core.double x;
  @ffi.Float()
  external core.double y;
}

final ScreenPointNative Function(core.double, core.double)
    _ScreenPointNativeInit = lib.library
        .lookup<
            ffi.NativeFunction<
                ScreenPointNative Function(ffi.Float,
                    ffi.Float)>>('yandex_flutter_mapkit_ScreenPoint_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ScreenPointImpl.toPointer',
    toPlatform: '(val) => ScreenPointImpl.fromPointer(val, needFree: false)',
    platformType: 'ScreenPoint')
extension ScreenPointImpl on ScreenPoint {
  static ScreenPoint fromNative(ScreenPointNative native) {
    return ScreenPoint(x: native.x, y: native.y);
  }

  static ScreenPointNative toNative(ScreenPoint obj) {
    return _ScreenPointNativeInit(obj.x, obj.y);
  }

  static ScreenPoint? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        ScreenPointImpl.fromNative(ptr.cast<ScreenPointNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(ScreenPoint? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ScreenPointNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

final class ScreenRectNative extends ffi.Struct {
  external ScreenPointNative topLeft;
  external ScreenPointNative bottomRight;
}

final ScreenRectNative Function(ScreenPointNative, ScreenPointNative)
    _ScreenRectNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    ScreenRectNative Function(
                        ScreenPointNative, ScreenPointNative)>>(
            'yandex_flutter_mapkit_ScreenRect_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ScreenRectImpl.toPointer',
    toPlatform: '(val) => ScreenRectImpl.fromPointer(val, needFree: false)',
    platformType: 'ScreenRect')
extension ScreenRectImpl on ScreenRect {
  static ScreenRect fromNative(ScreenRectNative native) {
    return ScreenRect(ScreenPointImpl.fromNative(native.topLeft),
        ScreenPointImpl.fromNative(native.bottomRight));
  }

  static ScreenRectNative toNative(ScreenRect obj) {
    return _ScreenRectNativeInit(ScreenPointImpl.toNative(obj.topLeft),
        ScreenPointImpl.toNative(obj.bottomRight));
  }

  static ScreenRect? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = ScreenRectImpl.fromNative(ptr.cast<ScreenRectNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(ScreenRect? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ScreenRectNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
