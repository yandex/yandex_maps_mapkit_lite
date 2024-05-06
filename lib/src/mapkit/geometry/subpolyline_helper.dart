import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;

part 'subpolyline_helper.impl.dart';

class SubpolylineHelper {
  SubpolylineHelper._();

  /// Cuts subpolyline geometry from polyline.
  static mapkit_geometry_geometry.Polyline subpolyline(
      mapkit_geometry_geometry.Polyline polyline,
      mapkit_geometry_geometry.Subpolyline subpolyline) {
    return _subpolyline(
      polyline,
      subpolyline,
    );
  }

  /// Calculates length of subpolyline geometry.
  static core.double subpolylineLength(
      mapkit_geometry_geometry.Polyline polyline,
      mapkit_geometry_geometry.Subpolyline subpolyline) {
    return _subpolylineLength(
      polyline,
      subpolyline,
    );
  }
}
