import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geo/projection.dart'
    as mapkit_geometry_geo_projection;

class Projections {
  Projections._();

  static mapkit_geometry_geo_projection.Projection get wgs84Mercator {
    return mapkit_geometry_geo_projection.Projection.fromNativePtr(
        _Projections_get_wgs84Mercator());
  }

  static mapkit_geometry_geo_projection.Projection get sphericalMercator {
    return mapkit_geometry_geo_projection.Projection.fromNativePtr(
        _Projections_get_sphericalMercator());
  }
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
