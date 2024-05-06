part of 'camera_position.dart';

final class CameraPositionNative extends ffi.Struct {
  external mapkit_geometry_point.PointNative target;
  @ffi.Float()
  external core.double zoom;
  @ffi.Float()
  external core.double azimuth;
  @ffi.Float()
  external core.double tilt;
}

final CameraPositionNative Function(
    mapkit_geometry_point.PointNative,
    core.double,
    core.double,
    core
        .double) _CameraPositionNativeInit = lib.library
    .lookup<
        ffi.NativeFunction<
            CameraPositionNative Function(
                mapkit_geometry_point.PointNative,
                ffi.Float,
                ffi.Float,
                ffi.Float)>>('yandex_flutter_mapkit_map_CameraPosition_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'CameraPositionImpl.toPointer',
    toPlatform: '(val) => CameraPositionImpl.fromPointer(val, needFree: false)',
    platformType: 'CameraPosition')
extension CameraPositionImpl on CameraPosition {
  static CameraPosition fromNative(CameraPositionNative native) {
    return CameraPosition(
        mapkit_geometry_point.PointImpl.fromNative(native.target),
        zoom: native.zoom,
        azimuth: native.azimuth,
        tilt: native.tilt);
  }

  static CameraPositionNative toNative(CameraPosition obj) {
    return _CameraPositionNativeInit(
        mapkit_geometry_point.PointImpl.toNative(obj.target),
        obj.zoom,
        obj.azimuth,
        obj.tilt);
  }

  static CameraPosition? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        CameraPositionImpl.fromNative(ptr.cast<CameraPositionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(CameraPosition? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<CameraPositionNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
