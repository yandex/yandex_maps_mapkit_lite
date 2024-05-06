import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geo/projection.dart'
    as mapkit_geometry_geo_projection;

part 'projections.impl.dart';

class Projections {
  Projections._();

  static mapkit_geometry_geo_projection.Projection get wgs84Mercator =>
      _wgs84Mercator;
  static mapkit_geometry_geo_projection.Projection get sphericalMercator =>
      _sphericalMercator;
}
