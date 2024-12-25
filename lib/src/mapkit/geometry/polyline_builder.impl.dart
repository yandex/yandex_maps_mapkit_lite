part of 'polyline_builder.dart';

@bindings_annotations.ContainerData(
    toNative: 'PolylineBuilderImpl.getNativePtr',
    toPlatform:
        '(val) => PolylineBuilderImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'PolylineBuilder')
class PolylineBuilderImpl implements PolylineBuilder, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_PolylineBuilder_free.cast());

  /// @nodoc
  PolylineBuilderImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  PolylineBuilderImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PolylineBuilder? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as PolylineBuilderImpl).ptr;
  }

  @internal

  /// @nodoc
  static PolylineBuilder? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PolylineBuilderImpl.fromNativePtr(ptr);
  }

  void appendPolyline(mapkit_geometry_geometry.Polyline polyline) {
    _PolylineBuilder_appendPolyline(
        ptr, mapkit_geometry_geometry.PolylineImpl.getNativePtr(polyline));
  }

  void appendPoint(mapkit_geometry_point.Point point) {
    _PolylineBuilder_appendPoint(
        ptr, mapkit_geometry_point.PointImpl.toNative(point));
  }

  mapkit_geometry_geometry.Polyline build() {
    final result = _PolylineBuilder_build(ptr);
    return mapkit_geometry_geometry.PolylineImpl.fromNativePtr(result);
  }
}

final _PolylineBuilder_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_PolylineBuilder_free');

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PolylineBuilder_appendPolyline = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_PolylineBuilder_appendPolyline')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)
    _PolylineBuilder_appendPoint = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_geometry_PolylineBuilder_appendPoint')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _PolylineBuilder_build = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_PolylineBuilder_build')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _PolylineBuilder_set = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
        'yandex_flutter_mapkit_geometry_PolylineBuilder_set_')
    .asFunction(isLeaf: true);

PolylineBuilder _create() {
  final result = _PolylineBuilderFactory_create();
  return PolylineBuilderImpl.fromNativePtr(result);
}

final ffi.Pointer<ffi.Void> Function() _PolylineBuilderFactory_create = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function()>>(
        'yandex_flutter_mapkit_geometry_PolylineBuilderFactory_create')
    .asFunction();
