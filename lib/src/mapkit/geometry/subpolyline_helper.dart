import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;

class SubpolylineHelper {
  SubpolylineHelper._();

  /// Cuts subpolyline geometry from polyline.
  static mapkit_geometry_geometry.Polyline subpolyline(
      mapkit_geometry_geometry.Polyline polyline,
      mapkit_geometry_geometry.Subpolyline subpolyline) {
    return mapkit_geometry_geometry.Polyline.fromNativePtr(
        _SubpolylineHelper_subpolyline(
            mapkit_geometry_geometry.Polyline.getNativePtr(polyline),
            mapkit_geometry_geometry.Subpolyline.toNative(subpolyline)));
  }

  /// Calculates length of subpolyline geometry.
  static core.double subpolylineLength(
      mapkit_geometry_geometry.Polyline polyline,
      mapkit_geometry_geometry.Subpolyline subpolyline) {
    return _SubpolylineHelper_subpolylineLength(
        mapkit_geometry_geometry.Polyline.getNativePtr(polyline),
        mapkit_geometry_geometry.Subpolyline.toNative(subpolyline));
  }
}

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, mapkit_geometry_geometry.SubpolylineNative)
    _SubpolylineHelper_subpolyline = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.SubpolylineNative)>>(
            'yandex_flutter_mapkit_geometry_SubpolylineHelper_subpolyline')
        .asFunction();
final core.double Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_geometry
        .SubpolylineNative) _SubpolylineHelper_subpolylineLength = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Double Function(ffi.Pointer<ffi.Void>,
                    mapkit_geometry_geometry.SubpolylineNative)>>(
        'yandex_flutter_mapkit_geometry_SubpolylineHelper_subpolylineLength')
    .asFunction();
