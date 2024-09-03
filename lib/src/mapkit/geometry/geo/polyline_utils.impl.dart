part of 'polyline_utils.dart';

core.List<mapkit_geometry_geometry.PolylinePosition> _positionsOfFork(
    mapkit_geometry_geometry.Polyline firstPolyline,
    mapkit_geometry_geometry.PolylinePosition firstPolylinePosition,
    mapkit_geometry_geometry.Polyline secondPolyline,
    mapkit_geometry_geometry.PolylinePosition secondPolylinePosition) {
  final result = mapkit_geometry_geometry.PolylinePositionContainerExtension
      .toPlatformVector(_PolylineUtils_positionsOfFork(
          mapkit_geometry_geometry.PolylineImpl.getNativePtr(firstPolyline),
          mapkit_geometry_geometry.PolylinePositionImpl.toNative(
              firstPolylinePosition),
          mapkit_geometry_geometry.PolylineImpl.getNativePtr(secondPolyline),
          mapkit_geometry_geometry.PolylinePositionImpl.toNative(
              secondPolylinePosition)));
  return result;
}

mapkit_geometry_geometry.PolylinePosition _advancePolylinePosition(
  mapkit_geometry_geometry.Polyline polyline,
  mapkit_geometry_geometry.PolylinePosition position, {
  required core.double distance,
}) {
  final result = mapkit_geometry_geometry.PolylinePositionImpl.fromNative(
      _PolylineUtils_advancePolylinePosition(
          mapkit_geometry_geometry.PolylineImpl.getNativePtr(polyline),
          mapkit_geometry_geometry.PolylinePositionImpl.toNative(position),
          distance));
  return result;
}

mapkit_geometry_point.Point _pointByPolylinePosition(
    mapkit_geometry_geometry.Polyline geometry,
    mapkit_geometry_geometry.PolylinePosition position) {
  final result = mapkit_geometry_point.PointImpl.fromNative(
      _PolylineUtils_pointByPolylinePosition(
          mapkit_geometry_geometry.PolylineImpl.getNativePtr(geometry),
          mapkit_geometry_geometry.PolylinePositionImpl.toNative(position)));
  return result;
}

core.double _distanceBetweenPolylinePositions(
    mapkit_geometry_geometry.Polyline polyline,
    mapkit_geometry_geometry.PolylinePosition from,
    mapkit_geometry_geometry.PolylinePosition to) {
  final result = _PolylineUtils_distanceBetweenPolylinePositions(
      mapkit_geometry_geometry.PolylineImpl.getNativePtr(polyline),
      mapkit_geometry_geometry.PolylinePositionImpl.toNative(from),
      mapkit_geometry_geometry.PolylinePositionImpl.toNative(to));
  return result;
}

mapkit_geometry_geo_polyline_index.PolylineIndex _createPolylineIndex(
    mapkit_geometry_geometry.Polyline polyline) {
  final result =
      mapkit_geometry_geo_polyline_index.PolylineIndexImpl.fromNativePtr(
          _PolylineUtils_createPolylineIndex(
              mapkit_geometry_geometry.PolylineImpl.getNativePtr(polyline)));
  return result;
}

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_geometry.PolylinePositionNative,
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_geometry.PolylinePositionNative)
    _PolylineUtils_positionsOfFork = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.PolylinePositionNative,
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.PolylinePositionNative)>>(
            'yandex_flutter_mapkit_geometry_geo_PolylineUtils_positionsOfFork')
        .asFunction();
final mapkit_geometry_geometry.PolylinePositionNative Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_geometry.PolylinePositionNative,
    core
        .double) _PolylineUtils_advancePolylinePosition = lib.library
    .lookup<
            ffi.NativeFunction<
                mapkit_geometry_geometry.PolylinePositionNative Function(
                    ffi.Pointer<ffi.Void>,
                    mapkit_geometry_geometry.PolylinePositionNative,
                    ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineUtils_advancePolylinePosition')
    .asFunction();
final mapkit_geometry_point.PointNative Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_geometry
        .PolylinePositionNative) _PolylineUtils_pointByPolylinePosition = lib
    .library
    .lookup<
            ffi.NativeFunction<
                mapkit_geometry_point.PointNative Function(
                    ffi.Pointer<ffi.Void>,
                    mapkit_geometry_geometry.PolylinePositionNative)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineUtils_pointByPolylinePosition')
    .asFunction();
final core.double Function(
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_geometry.PolylinePositionNative,
        mapkit_geometry_geometry.PolylinePositionNative)
    _PolylineUtils_distanceBetweenPolylinePositions = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Double Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.PolylinePositionNative,
                        mapkit_geometry_geometry.PolylinePositionNative)>>(
            'yandex_flutter_mapkit_geometry_geo_PolylineUtils_distanceBetweenPolylinePositions')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PolylineUtils_createPolylineIndex = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineUtils_createPolylineIndex')
    .asFunction();
