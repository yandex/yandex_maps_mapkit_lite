part of 'camera_bounds.dart';

@bindings_annotations.WeakInterface('mapkit.map.CameraBounds')
@bindings_annotations.ContainerData(
    toNative: 'CameraBoundsImpl.getNativePtr',
    toPlatform:
        '(val) => CameraBoundsImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'CameraBounds')
class CameraBoundsImpl implements CameraBounds, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_CameraBounds_free.cast());

  /// @nodoc
  CameraBoundsImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  CameraBoundsImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory CameraBoundsImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(CameraBounds? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as CameraBoundsImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _CameraBounds_check(ptr);
  }

  @internal

  /// @nodoc
  static CameraBounds? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return CameraBoundsImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_geometry_geometry.BoundingBox? get latLngBounds {
    final result = mapkit_geometry_geometry.BoundingBoxImpl.fromPointer(
        _CameraBounds_get_latLngBounds(ptr));
    exception.checkCallResult();
    return result;
  }

  @core.override
  set latLngBounds(mapkit_geometry_geometry.BoundingBox? val) {
    _CameraBounds_set_latLngBounds(
        ptr, mapkit_geometry_geometry.BoundingBoxImpl.toPointer(val));
    exception.checkCallResult();
  }

  core.double getMinZoom() {
    final result = _CameraBounds_getMinZoom(ptr);
    exception.checkCallResult();
    return result;
  }

  core.double getMaxZoom() {
    final result = _CameraBounds_getMaxZoom(ptr);
    exception.checkCallResult();
    return result;
  }

  void setMinZoomPreference(core.double zoom) {
    _CameraBounds_setMinZoomPreference(ptr, zoom);
    exception.checkCallResult();
  }

  void setMaxZoomPreference(core.double zoom) {
    _CameraBounds_setMaxZoomPreference(ptr, zoom);
    exception.checkCallResult();
  }

  void resetMinMaxZoomPreference() {
    _CameraBounds_resetMinMaxZoomPreference(ptr);
    exception.checkCallResult();
  }
}

final _CameraBounds_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CameraBounds_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _CameraBounds_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CameraBounds_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _CameraBounds_get_latLngBounds = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CameraBounds_get_latLngBounds')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _CameraBounds_set_latLngBounds = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CameraBounds_set_latLngBounds')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _CameraBounds_getMinZoom = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CameraBounds_getMinZoom')
    .asFunction();
final core.double Function(ffi.Pointer<ffi.Void>) _CameraBounds_getMaxZoom = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CameraBounds_getMaxZoom')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _CameraBounds_setMinZoomPreference = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_CameraBounds_setMinZoomPreference')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _CameraBounds_setMaxZoomPreference = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_CameraBounds_setMaxZoomPreference')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>)
    _CameraBounds_resetMinMaxZoomPreference = lib.library
        .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CameraBounds_resetMinMaxZoomPreference')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _CameraBounds_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_CameraBounds_set_')
    .asFunction(isLeaf: true);
