part of 'visible_region.dart';

final class VisibleRegionNative extends ffi.Struct {
  external mapkit_geometry_point.PointNative topLeft;
  external mapkit_geometry_point.PointNative topRight;
  external mapkit_geometry_point.PointNative bottomLeft;
  external mapkit_geometry_point.PointNative bottomRight;
}

final VisibleRegionNative Function(
        mapkit_geometry_point.PointNative,
        mapkit_geometry_point.PointNative,
        mapkit_geometry_point.PointNative,
        mapkit_geometry_point.PointNative) _VisibleRegionNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    VisibleRegionNative Function(
                        mapkit_geometry_point.PointNative,
                        mapkit_geometry_point.PointNative,
                        mapkit_geometry_point.PointNative,
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_map_VisibleRegion_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'VisibleRegionImpl.toPointer',
    toPlatform: '(val) => VisibleRegionImpl.fromPointer(val, needFree: false)',
    platformType: 'VisibleRegion')
extension VisibleRegionImpl on VisibleRegion {
  static VisibleRegion fromNative(VisibleRegionNative native) {
    return VisibleRegion(
        mapkit_geometry_point.PointImpl.fromNative(native.topLeft),
        mapkit_geometry_point.PointImpl.fromNative(native.topRight),
        mapkit_geometry_point.PointImpl.fromNative(native.bottomLeft),
        mapkit_geometry_point.PointImpl.fromNative(native.bottomRight));
  }

  static VisibleRegionNative toNative(VisibleRegion obj) {
    return _VisibleRegionNativeInit(
        mapkit_geometry_point.PointImpl.toNative(obj.topLeft),
        mapkit_geometry_point.PointImpl.toNative(obj.topRight),
        mapkit_geometry_point.PointImpl.toNative(obj.bottomLeft),
        mapkit_geometry_point.PointImpl.toNative(obj.bottomRight));
  }

  static VisibleRegion? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        VisibleRegionImpl.fromNative(ptr.cast<VisibleRegionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(VisibleRegion? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<VisibleRegionNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

mapkit_geometry_geometry.Geometry _toPolygon(VisibleRegion visibleRegion) {
  return mapkit_geometry_geometry.GeometryImpl.toPlatform(
      _VisibleRegionUtils_toPolygon(VisibleRegionImpl.toNative(visibleRegion)));
}

mapkit_geometry_geometry.BoundingBox _getBounds(VisibleRegion visibleRegion) {
  return mapkit_geometry_geometry.BoundingBoxImpl.fromNative(
      _VisibleRegionUtils_getBounds(VisibleRegionImpl.toNative(visibleRegion)));
}

final mapkit_geometry_geometry.GeometryNative Function(VisibleRegionNative)
    _VisibleRegionUtils_toPolygon = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geometry.GeometryNative Function(
                        VisibleRegionNative)>>(
            'yandex_flutter_mapkit_map_VisibleRegionUtils_toPolygon')
        .asFunction();
final mapkit_geometry_geometry.BoundingBoxNative Function(VisibleRegionNative)
    _VisibleRegionUtils_getBounds = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geometry.BoundingBoxNative Function(
                        VisibleRegionNative)>>(
            'yandex_flutter_mapkit_map_VisibleRegionUtils_getBounds')
        .asFunction();
