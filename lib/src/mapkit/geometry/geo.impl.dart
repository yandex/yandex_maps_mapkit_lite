part of 'geo.dart';

core.double _distance(mapkit_geometry_point.Point firstPoint,
    mapkit_geometry_point.Point secondPoint) {
  final result = _Geo_distance(
      mapkit_geometry_point.PointImpl.toNative(firstPoint),
      mapkit_geometry_point.PointImpl.toNative(secondPoint));
  return result;
}

mapkit_geometry_point.Point _closestPoint(mapkit_geometry_point.Point point,
    mapkit_geometry_geometry.Segment segment) {
  final result = _Geo_closestPoint(
      mapkit_geometry_point.PointImpl.toNative(point),
      mapkit_geometry_geometry.SegmentImpl.toNative(segment));
  return mapkit_geometry_point.PointImpl.fromNative(result);
}

mapkit_geometry_point.Point _pointOnSegmentByFactor(
  mapkit_geometry_geometry.Segment segment, {
  required core.double factor,
}) {
  final result = _Geo_pointOnSegmentByFactor(
      mapkit_geometry_geometry.SegmentImpl.toNative(segment), factor);
  return mapkit_geometry_point.PointImpl.fromNative(result);
}

core.double _course(mapkit_geometry_point.Point firstPoint,
    mapkit_geometry_point.Point secondPoint) {
  final result = _Geo_course(
      mapkit_geometry_point.PointImpl.toNative(firstPoint),
      mapkit_geometry_point.PointImpl.toNative(secondPoint));
  return result;
}

final core.double Function(
        mapkit_geometry_point.PointNative, mapkit_geometry_point.PointNative)
    _Geo_distance = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Double Function(mapkit_geometry_point.PointNative,
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_geometry_Geo_distance')
        .asFunction();
final mapkit_geometry_point.PointNative Function(
        mapkit_geometry_point.PointNative,
        mapkit_geometry_geometry.SegmentNative) _Geo_closestPoint =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_point.PointNative Function(
                        mapkit_geometry_point.PointNative,
                        mapkit_geometry_geometry.SegmentNative)>>(
            'yandex_flutter_mapkit_geometry_Geo_closestPoint')
        .asFunction();
final mapkit_geometry_point.PointNative Function(
        mapkit_geometry_geometry.SegmentNative, core.double)
    _Geo_pointOnSegmentByFactor = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_point.PointNative Function(
                        mapkit_geometry_geometry.SegmentNative, ffi.Double)>>(
            'yandex_flutter_mapkit_geometry_Geo_pointOnSegmentByFactor')
        .asFunction();
final core.double Function(
        mapkit_geometry_point.PointNative, mapkit_geometry_point.PointNative)
    _Geo_course = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Double Function(mapkit_geometry_point.PointNative,
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_geometry_Geo_course')
        .asFunction();
