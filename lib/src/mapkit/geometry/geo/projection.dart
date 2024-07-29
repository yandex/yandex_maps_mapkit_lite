import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geo/xy_point.dart'
    as mapkit_geometry_geo_xy_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'projection.containers.dart';
part 'projection.impl.dart';

/// Makes two conversions: world->XY and XY->world, where XY are tile
/// indexes. There are two main derived classes: spherical mercator
/// (google, osm) and wgs84 mercator (yandex).
abstract class Projection implements ffi.Finalizable {
  /// Converts the world coordinates to a flat world position.
  mapkit_geometry_geo_xy_point.XYPoint worldToXY(
    mapkit_geometry_point.Point geoPoint, {
    required core.int zoom,
  });

  /// Converts the flat world position to world coordinates.
  mapkit_geometry_point.Point xyToWorld(
    mapkit_geometry_geo_xy_point.XYPoint xyPoint, {
    required core.int zoom,
  });

  core.bool isValid();
}
