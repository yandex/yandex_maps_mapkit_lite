part of 'projections.dart';

mapkit_geometry_geo_projection.Projection get _wgs84Mercator {
  return mapkit_geometry_geo_projection.ProjectionImpl.fromNativePtr(
      _Projections_get_wgs84Mercator());
}

mapkit_geometry_geo_projection.Projection get _sphericalMercator {
  return mapkit_geometry_geo_projection.ProjectionImpl.fromNativePtr(
      _Projections_get_sphericalMercator());
}

final ffi.Pointer<ffi.Void> Function() _Projections_get_wgs84Mercator = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function()>>(
        'yandex_flutter_mapkit_geometry_geo_Projections_get_wgs84Mercator')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function() _Projections_get_sphericalMercator = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function()>>(
        'yandex_flutter_mapkit_geometry_geo_Projections_get_sphericalMercator')
    .asFunction(isLeaf: true);
