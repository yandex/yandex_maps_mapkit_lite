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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'polyline_builder.containers.dart';
part 'polyline_builder.impl.dart';

/// A builder class for polyline elements.
abstract class PolylineBuilder implements ffi.Finalizable {
  /// Appends a polyline.
  void appendPolyline(mapkit_geometry_geometry.Polyline polyline);

  /// Appends a point.
  void appendPoint(mapkit_geometry_point.Point point);

  /// Builds a polyline.
  mapkit_geometry_geometry.Polyline build();
}

class PolylineBuilderFactory {
  PolylineBuilderFactory._();

  static PolylineBuilder create() {
    return _create();
  }
}
