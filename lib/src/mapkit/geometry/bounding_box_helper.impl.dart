part of 'bounding_box_helper.dart';

mapkit_geometry_geometry.BoundingBox _getBounds(
    mapkit_geometry_geometry.BoundingBox bbox) {
  final result = _BoundingBoxHelper_getBounds(
      mapkit_geometry_geometry.BoundingBoxImpl.toNative(bbox));
  return mapkit_geometry_geometry.BoundingBoxImpl.fromNative(result);
}

mapkit_geometry_geometry.BoundingBox _getBoundsFromPoint(
    mapkit_geometry_point.Point point) {
  final result = _BoundingBoxHelper_getBoundsFromPoint(
      mapkit_geometry_point.PointImpl.toNative(point));
  return mapkit_geometry_geometry.BoundingBoxImpl.fromNative(result);
}

mapkit_geometry_geometry.BoundingBox _getBoundsFromPolyline(
    mapkit_geometry_geometry.Polyline polyline) {
  final result = _BoundingBoxHelper_getBoundsFromPolyline(
      mapkit_geometry_geometry.PolylineImpl.getNativePtr(polyline));
  return mapkit_geometry_geometry.BoundingBoxImpl.fromNative(result);
}

mapkit_geometry_geometry.BoundingBox _getBoundsFromRing(
    mapkit_geometry_geometry.LinearRing ring) {
  final result = _BoundingBoxHelper_getBoundsFromRing(
      mapkit_geometry_geometry.LinearRingImpl.getNativePtr(ring));
  return mapkit_geometry_geometry.BoundingBoxImpl.fromNative(result);
}

mapkit_geometry_geometry.BoundingBox _getBoundsFromPolygon(
    mapkit_geometry_geometry.Polygon polygon) {
  final result = _BoundingBoxHelper_getBoundsFromPolygon(
      mapkit_geometry_geometry.PolygonImpl.getNativePtr(polygon));
  return mapkit_geometry_geometry.BoundingBoxImpl.fromNative(result);
}

mapkit_geometry_geometry.BoundingBox _getBoundsFromTwoBoxes(
    mapkit_geometry_geometry.BoundingBox first,
    mapkit_geometry_geometry.BoundingBox second) {
  final result = _BoundingBoxHelper_getBoundsFromTwoBoxes(
      mapkit_geometry_geometry.BoundingBoxImpl.toNative(first),
      mapkit_geometry_geometry.BoundingBoxImpl.toNative(second));
  return mapkit_geometry_geometry.BoundingBoxImpl.fromNative(result);
}

final mapkit_geometry_geometry.BoundingBoxNative Function(
        mapkit_geometry_geometry.BoundingBoxNative)
    _BoundingBoxHelper_getBounds = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geometry.BoundingBoxNative Function(
                        mapkit_geometry_geometry.BoundingBoxNative)>>(
            'yandex_flutter_mapkit_geometry_BoundingBoxHelper_getBounds')
        .asFunction();
final mapkit_geometry_geometry.BoundingBoxNative Function(
    mapkit_geometry_point
        .PointNative) _BoundingBoxHelper_getBoundsFromPoint = lib.library
    .lookup<
            ffi.NativeFunction<
                mapkit_geometry_geometry.BoundingBoxNative Function(
                    mapkit_geometry_point.PointNative)>>(
        'yandex_flutter_mapkit_geometry_BoundingBoxHelper_getBoundsFromPoint')
    .asFunction();
final mapkit_geometry_geometry.BoundingBoxNative Function(
    ffi
        .Pointer<ffi.Void>) _BoundingBoxHelper_getBoundsFromPolyline = lib
    .library
    .lookup<
            ffi.NativeFunction<
                mapkit_geometry_geometry.BoundingBoxNative Function(
                    ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_BoundingBoxHelper_getBoundsFromPolyline')
    .asFunction();
final mapkit_geometry_geometry.BoundingBoxNative Function(
    ffi
        .Pointer<ffi.Void>) _BoundingBoxHelper_getBoundsFromRing = lib.library
    .lookup<
            ffi.NativeFunction<
                mapkit_geometry_geometry.BoundingBoxNative Function(
                    ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_BoundingBoxHelper_getBoundsFromRing')
    .asFunction();
final mapkit_geometry_geometry.BoundingBoxNative Function(
    ffi
        .Pointer<ffi.Void>) _BoundingBoxHelper_getBoundsFromPolygon = lib
    .library
    .lookup<
            ffi.NativeFunction<
                mapkit_geometry_geometry.BoundingBoxNative Function(
                    ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_BoundingBoxHelper_getBoundsFromPolygon')
    .asFunction();
final mapkit_geometry_geometry.BoundingBoxNative Function(
    mapkit_geometry_geometry.BoundingBoxNative,
    mapkit_geometry_geometry
        .BoundingBoxNative) _BoundingBoxHelper_getBoundsFromTwoBoxes = lib
    .library
    .lookup<
            ffi.NativeFunction<
                mapkit_geometry_geometry.BoundingBoxNative Function(
                    mapkit_geometry_geometry.BoundingBoxNative,
                    mapkit_geometry_geometry.BoundingBoxNative)>>(
        'yandex_flutter_mapkit_geometry_BoundingBoxHelper_getBoundsFromTwoBoxes')
    .asFunction();
