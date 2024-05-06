part of 'xy_point.dart';

final class XYPointNative extends ffi.Struct {
  @ffi.Double()
  external core.double x;
  @ffi.Double()
  external core.double y;
}

final XYPointNative Function(core.double, core.double) _XYPointNativeInit = lib
    .library
    .lookup<ffi.NativeFunction<XYPointNative Function(ffi.Double, ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_geo_XYPoint_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'XYPointImpl.toPointer',
    toPlatform: '(val) => XYPointImpl.fromPointer(val, needFree: false)',
    platformType: 'XYPoint')
extension XYPointImpl on XYPoint {
  static XYPoint fromNative(XYPointNative native) {
    return XYPoint(x: native.x, y: native.y);
  }

  static XYPointNative toNative(XYPoint obj) {
    return _XYPointNativeInit(obj.x, obj.y);
  }

  static XYPoint? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = XYPointImpl.fromNative(ptr.cast<XYPointNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(XYPoint? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<XYPointNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
