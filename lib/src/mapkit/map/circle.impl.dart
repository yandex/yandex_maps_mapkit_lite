part of 'circle.dart';

@bindings_annotations.WeakInterface('mapkit.map.CircleMapObject')
@bindings_annotations.ContainerData(
    toNative: 'CircleMapObjectImpl.getNativePtr',
    toPlatform:
        '(val) => CircleMapObjectImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'CircleMapObject')
class CircleMapObjectImpl extends mapkit_map_map_object.MapObjectImpl
    implements CircleMapObject, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_CircleMapObject_free.cast());

  /// @nodoc
  CircleMapObjectImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  CircleMapObjectImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory CircleMapObjectImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(CircleMapObject? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as CircleMapObjectImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _CircleMapObject_check(ptr);
  }

  @internal

  /// @nodoc
  static CircleMapObject? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return CircleMapObjectImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_geometry_geometry.Circle get geometry {
    final result = mapkit_geometry_geometry.CircleImpl.fromNative(
        _CircleMapObject_get_geometry(ptr));
    exception.checkCallResult();
    return result;
  }

  @core.override
  set geometry(mapkit_geometry_geometry.Circle val) {
    _CircleMapObject_set_geometry(
        ptr, mapkit_geometry_geometry.CircleImpl.toNative(val));
    exception.checkCallResult();
  }

  @core.override
  ui.Color get strokeColor {
    final result =
        to_platform.toPlatformColor(_CircleMapObject_get_strokeColor(ptr));
    exception.checkCallResult();
    return result;
  }

  @core.override
  set strokeColor(ui.Color val) {
    _CircleMapObject_set_strokeColor(ptr, to_native.toNativeColor(val));
    exception.checkCallResult();
  }

  @core.override
  core.double get strokeWidth {
    final result = _CircleMapObject_get_strokeWidth(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set strokeWidth(core.double val) {
    _CircleMapObject_set_strokeWidth(ptr, val);
    exception.checkCallResult();
  }

  @core.override
  ui.Color get fillColor {
    final result =
        to_platform.toPlatformColor(_CircleMapObject_get_fillColor(ptr));
    exception.checkCallResult();
    return result;
  }

  @core.override
  set fillColor(ui.Color val) {
    _CircleMapObject_set_fillColor(ptr, to_native.toNativeColor(val));
    exception.checkCallResult();
  }

  @core.override
  core.bool get geodesic {
    final result = _CircleMapObject_get_geodesic(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set geodesic(core.bool val) {
    _CircleMapObject_set_geodesic(ptr, val);
    exception.checkCallResult();
  }
}

final _CircleMapObject_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CircleMapObject_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _CircleMapObject_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CircleMapObject_check')
    .asFunction(isLeaf: true);

final mapkit_geometry_geometry.CircleNative Function(ffi.Pointer<ffi.Void>)
    _CircleMapObject_get_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geometry.CircleNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_get_geometry')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_geometry_geometry.CircleNative)
    _CircleMapObject_set_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.CircleNative)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_set_geometry')
        .asFunction();

final native_types.NativeColor Function(ffi.Pointer<ffi.Void>)
    _CircleMapObject_get_strokeColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_get_strokeColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _CircleMapObject_set_strokeColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_set_strokeColor')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _CircleMapObject_get_strokeWidth = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_get_strokeWidth')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _CircleMapObject_set_strokeWidth = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_set_strokeWidth')
        .asFunction();

final native_types.NativeColor Function(ffi.Pointer<ffi.Void>)
    _CircleMapObject_get_fillColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_get_fillColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _CircleMapObject_set_fillColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_set_fillColor')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _CircleMapObject_get_geodesic =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_get_geodesic')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _CircleMapObject_set_geodesic = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_CircleMapObject_set_geodesic')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, core.int) _CircleMapObject_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_CircleMapObject_set_')
    .asFunction(isLeaf: true);
