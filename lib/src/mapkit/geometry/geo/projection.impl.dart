part of 'projection.dart';

@bindings_annotations.WeakInterface('mapkit.geometry.geo.Projection')
@bindings_annotations.ContainerData(
    toNative: 'ProjectionImpl.getNativePtr',
    toPlatform:
        '(val) => ProjectionImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Projection')
class ProjectionImpl implements Projection, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Projection_free.cast());

  /// @nodoc
  ProjectionImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  ProjectionImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory ProjectionImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Projection? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as ProjectionImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _Projection_check(ptr);
  }

  @internal

  /// @nodoc
  static Projection? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return ProjectionImpl.fromNativePtr(ptr);
  }

  mapkit_geometry_geo_xy_point.XYPoint worldToXY(
    mapkit_geometry_point.Point geoPoint, {
    required core.int zoom,
  }) {
    final result = _Projection_worldToXY(
        ptr, mapkit_geometry_point.PointImpl.toNative(geoPoint), zoom);
    exception.checkCallResult();
    return mapkit_geometry_geo_xy_point.XYPointImpl.fromNative(result);
  }

  mapkit_geometry_point.Point xyToWorld(
    mapkit_geometry_geo_xy_point.XYPoint xyPoint, {
    required core.int zoom,
  }) {
    final result = _Projection_xyToWorld(
        ptr, mapkit_geometry_geo_xy_point.XYPointImpl.toNative(xyPoint), zoom);
    exception.checkCallResult();
    return mapkit_geometry_point.PointImpl.fromNative(result);
  }
}

final _Projection_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_geo_Projection_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Projection_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_geo_Projection_check')
    .asFunction(isLeaf: true);

final mapkit_geometry_geo_xy_point.XYPointNative Function(
        ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative, core.int)
    _Projection_worldToXY = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geo_xy_point.XYPointNative Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_point.PointNative,
                        ffi.Int)>>(
            'yandex_flutter_mapkit_geometry_geo_Projection_worldToXY')
        .asFunction();
final mapkit_geometry_point.PointNative Function(ffi.Pointer<ffi.Void>,
        mapkit_geometry_geo_xy_point.XYPointNative, core.int)
    _Projection_xyToWorld = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_point.PointNative Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geo_xy_point.XYPointNative,
                        ffi.Int)>>(
            'yandex_flutter_mapkit_geometry_geo_Projection_xyToWorld')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _Projection_set = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
        'yandex_flutter_mapkit_geometry_geo_Projection_set_')
    .asFunction(isLeaf: true);
