part of 'point.dart';

final class PointNative extends ffi.Struct {
  @ffi.Double()
  external core.double latitude;
  @ffi.Double()
  external core.double longitude;
}

final PointNative Function(core.double, core.double) _PointNativeInit = lib
    .library
    .lookup<ffi.NativeFunction<PointNative Function(ffi.Double, ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_Point_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'PointImpl.toPointer',
    toPlatform: '(val) => PointImpl.fromPointer(val, needFree: false)',
    platformType: 'Point')
extension PointImpl on Point {
  static Point fromNative(PointNative native) {
    return Point(latitude: native.latitude, longitude: native.longitude);
  }

  static PointNative toNative(Point obj) {
    return _PointNativeInit(obj.latitude, obj.longitude);
  }

  static Point? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = PointImpl.fromNative(ptr.cast<PointNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Point? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<PointNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
