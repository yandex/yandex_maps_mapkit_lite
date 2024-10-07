part of 'map.dart';

@bindings_annotations.WeakInterface('mapkit.map.Map')
@bindings_annotations.ContainerData(
    toNative: 'MapImpl.getNativePtr',
    toPlatform:
        '(val) => MapImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Map')
class MapImpl implements Map, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Map_free.cast());

  /// @nodoc
  MapImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  MapImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory MapImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Map? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as MapImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _Map_check(ptr);
  }

  @internal

  /// @nodoc
  static Map? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return MapImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_map_camera_position.CameraPosition get cameraPosition {
    final result = _Map_get_cameraPosition(ptr);
    exception.checkCallResult();
    return mapkit_map_camera_position.CameraPositionImpl.fromNative(result);
  }

  @core.override
  mapkit_map_visible_region.VisibleRegion get visibleRegion {
    final result = _Map_get_visibleRegion(ptr);
    exception.checkCallResult();
    return mapkit_map_visible_region.VisibleRegionImpl.fromNative(result);
  }

  @core.override
  mapkit_map_camera_bounds.CameraBounds get cameraBounds {
    final result = _Map_get_cameraBounds(ptr);
    exception.checkCallResult();
    return mapkit_map_camera_bounds.CameraBoundsImpl.fromNativePtr(result);
  }

  @core.override
  core.bool get nightModeEnabled {
    final result = _Map_get_nightModeEnabled(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set nightModeEnabled(core.bool val) {
    _Map_set_nightModeEnabled(ptr, val);
    exception.checkCallResult();
  }

  @core.override
  core.bool get zoomGesturesEnabled {
    final result = _Map_get_zoomGesturesEnabled(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set zoomGesturesEnabled(core.bool val) {
    _Map_set_zoomGesturesEnabled(ptr, val);
    exception.checkCallResult();
  }

  @core.override
  core.bool get scrollGesturesEnabled {
    final result = _Map_get_scrollGesturesEnabled(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set scrollGesturesEnabled(core.bool val) {
    _Map_set_scrollGesturesEnabled(ptr, val);
    exception.checkCallResult();
  }

  @core.override
  core.bool get tiltGesturesEnabled {
    final result = _Map_get_tiltGesturesEnabled(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set tiltGesturesEnabled(core.bool val) {
    _Map_set_tiltGesturesEnabled(ptr, val);
    exception.checkCallResult();
  }

  @core.override
  core.bool get rotateGesturesEnabled {
    final result = _Map_get_rotateGesturesEnabled(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set rotateGesturesEnabled(core.bool val) {
    _Map_set_rotateGesturesEnabled(ptr, val);
    exception.checkCallResult();
  }

  @core.override
  core.bool get fastTapEnabled {
    final result = _Map_get_fastTapEnabled(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set fastTapEnabled(core.bool val) {
    _Map_set_fastTapEnabled(ptr, val);
    exception.checkCallResult();
  }

  @core.override
  mapkit_map_map_type.MapType get mapType {
    final result = _Map_get_mapType(ptr);
    exception.checkCallResult();
    return mapkit_map_map_type.MapTypeImpl.fromInt(result);
  }

  @core.override
  set mapType(mapkit_map_map_type.MapType val) {
    _Map_set_mapType(ptr, mapkit_map_map_type.MapTypeImpl.toInt(val));
    exception.checkCallResult();
  }

  @core.override
  mapkit_map_map_object_collection.MapObjectCollection get mapObjects {
    final result = _Map_get_mapObjects(ptr);
    exception.checkCallResult();
    return mapkit_map_map_object_collection.MapObjectCollectionImpl
        .fromNativePtr(result);
  }

  @core.override
  mapkit_logo_logo.Logo get logo {
    final result = _Map_get_logo(ptr);
    exception.checkCallResult();
    return mapkit_logo_logo.LogoImpl.fromNativePtr(result);
  }

  @core.override
  core.int? get poiLimit {
    final result = _Map_get_poiLimit(ptr);
    exception.checkCallResult();
    return to_platform.toPlatformFromPointerUint32(result);
  }

  @core.override
  set poiLimit(core.int? val) {
    _Map_set_poiLimit(ptr, to_native.toNativePtrUint32(val));
    exception.checkCallResult();
  }

  @core.override
  mapkit_map_map_mode.MapMode get mode {
    final result = _Map_get_mode(ptr);
    exception.checkCallResult();
    return mapkit_map_map_mode.MapModeImpl.fromInt(result);
  }

  @core.override
  set mode(mapkit_map_map_mode.MapMode val) {
    _Map_set_mode(ptr, mapkit_map_map_mode.MapModeImpl.toInt(val));
    exception.checkCallResult();
  }

  @core.override
  core.bool get hdModeEnabled {
    final result = _Map_get_hdModeEnabled(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set hdModeEnabled(core.bool val) {
    _Map_set_hdModeEnabled(ptr, val);
    exception.checkCallResult();
  }

  @core.override
  core.bool get awesomeModelsEnabled {
    final result = _Map_get_awesomeModelsEnabled(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set awesomeModelsEnabled(core.bool val) {
    _Map_set_awesomeModelsEnabled(ptr, val);
    exception.checkCallResult();
  }

  mapkit_map_camera_position.CameraPosition cameraPositionForGeometry(
      mapkit_geometry_geometry.Geometry geometry) {
    final result = _Map_cameraPositionForGeometry(
        ptr, mapkit_geometry_geometry.GeometryImpl.toNative(geometry));
    exception.checkCallResult();
    return mapkit_map_camera_position.CameraPositionImpl.fromNative(result);
  }

  mapkit_map_camera_position.CameraPosition cameraPositionWithFocus(
      mapkit_geometry_geometry.Geometry geometry,
      mapkit_screen_types.ScreenRect focusRect) {
    final result = _Map_cameraPositionWithFocus(
        ptr,
        mapkit_geometry_geometry.GeometryImpl.toNative(geometry),
        mapkit_screen_types.ScreenRectImpl.toNative(focusRect));
    exception.checkCallResult();
    return mapkit_map_camera_position.CameraPositionImpl.fromNative(result);
  }

  mapkit_map_camera_position.CameraPosition cameraPositionWithAzimut(
    mapkit_geometry_geometry.Geometry geometry, {
    required core.double azimuth,
    required core.double tilt,
    mapkit_screen_types.ScreenRect? focusRect,
  }) {
    final result = _Map_cameraPositionWithAzimut(
        ptr,
        mapkit_geometry_geometry.GeometryImpl.toNative(geometry),
        azimuth,
        tilt,
        mapkit_screen_types.ScreenRectImpl.toPointer(focusRect));
    exception.checkCallResult();
    return mapkit_map_camera_position.CameraPositionImpl.fromNative(result);
  }

  mapkit_map_visible_region.VisibleRegion visibleRegionForPosition(
      mapkit_map_camera_position.CameraPosition cameraPosition) {
    final result = _Map_visibleRegionForPosition(ptr,
        mapkit_map_camera_position.CameraPositionImpl.toNative(cameraPosition));
    exception.checkCallResult();
    return mapkit_map_visible_region.VisibleRegionImpl.fromNative(result);
  }

  void moveWithAnimation(
    mapkit_map_camera_position.CameraPosition cameraPosition,
    mapkit_animation.Animation animation, {
    MapCameraCallback? cameraCallback,
  }) {
    _Map_moveWithAnimation(
        ptr,
        mapkit_map_camera_position.CameraPositionImpl.toNative(cameraPosition),
        mapkit_animation.AnimationImpl.toNative(animation),
        MapCameraCallbackImpl.getNativePtr(cameraCallback));
    exception.checkCallResult();
  }

  void move(mapkit_map_camera_position.CameraPosition cameraPosition) {
    _Map_move(ptr,
        mapkit_map_camera_position.CameraPositionImpl.toNative(cameraPosition));
    exception.checkCallResult();
  }

  void addInputListener(
      mapkit_map_input_listener.MapInputListener inputListener) {
    _Map_addInputListener(
        ptr,
        mapkit_map_input_listener.MapInputListenerImpl.getNativePtr(
            inputListener));
    exception.checkCallResult();
  }

  void removeInputListener(
      mapkit_map_input_listener.MapInputListener inputListener) {
    _Map_removeInputListener(
        ptr,
        mapkit_map_input_listener.MapInputListenerImpl.getNativePtr(
            inputListener));
    exception.checkCallResult();
  }

  void addCameraListener(
      mapkit_map_camera_listener.MapCameraListener cameraListener) {
    _Map_addCameraListener(
        ptr,
        mapkit_map_camera_listener.MapCameraListenerImpl.getNativePtr(
            cameraListener));
    exception.checkCallResult();
  }

  void removeCameraListener(
      mapkit_map_camera_listener.MapCameraListener cameraListener) {
    _Map_removeCameraListener(
        ptr,
        mapkit_map_camera_listener.MapCameraListenerImpl.getNativePtr(
            cameraListener));
    exception.checkCallResult();
  }

  void setMapLoadedListener(
      mapkit_map_map_loaded_listener.MapLoadedListener? mapLoadedListener) {
    _Map_setMapLoadedListener(
        ptr,
        mapkit_map_map_loaded_listener.MapLoadedListenerImpl.getNativePtr(
            mapLoadedListener));
    exception.checkCallResult();
  }

  void addTapListener(
      mapkit_layers_geo_object_tap_listener.LayersGeoObjectTapListener
          tapListener) {
    _Map_addTapListener(
        ptr,
        mapkit_layers_geo_object_tap_listener.LayersGeoObjectTapListenerImpl
            .getNativePtr(tapListener));
    exception.checkCallResult();
  }

  void removeTapListener(
      mapkit_layers_geo_object_tap_listener.LayersGeoObjectTapListener
          tapListener) {
    _Map_removeTapListener(
        ptr,
        mapkit_layers_geo_object_tap_listener.LayersGeoObjectTapListenerImpl
            .getNativePtr(tapListener));
    exception.checkCallResult();
  }

  void deselectGeoObject() {
    _Map_deselectGeoObject(ptr);
    exception.checkCallResult();
  }

  void selectGeoObject(
      mapkit_map_geo_object_selection_metadata.GeoObjectSelectionMetadata
          selectionMetaData) {
    _Map_selectGeoObject(
        ptr,
        mapkit_map_geo_object_selection_metadata.GeoObjectSelectionMetadataImpl
            .getNativePtr(selectionMetaData));
    exception.checkCallResult();
  }

  core.bool setMapStyle(core.String style) {
    final result = _Map_setMapStyle(ptr, to_native.toNativeString(style));
    exception.checkCallResult();
    return result;
  }

  core.bool setMapStyleWithId({
    required core.int id,
    required core.String style,
  }) {
    final result =
        _Map_setMapStyleWithId(ptr, id, to_native.toNativeString(style));
    exception.checkCallResult();
    return result;
  }

  void resetMapStyles() {
    _Map_resetMapStyles(ptr);
    exception.checkCallResult();
  }

  void set2DMode(core.bool enable) {
    _Map_set2DMode(ptr, enable);
    exception.checkCallResult();
  }

  mapkit_geometry_geo_projection.Projection projection() {
    final result = _Map_projection(ptr);
    exception.checkCallResult();
    return mapkit_geometry_geo_projection.ProjectionImpl.fromNativePtr(result);
  }

  void wipe() {
    _Map_wipe(ptr);
    exception.checkCallResult();
  }

  mapkit_layers_layer.Layer addTileLayer(
    mapkit_layers_layer_options.LayerOptions layerOptions,
    mapkit_map_tile_data_source_builder.CreateTileDataSource createDataSource, {
    required core.String layerId,
  }) {
    final result = _Map_addTileLayer(
      ptr,
      to_native.toNativeString(layerId),
      mapkit_layers_layer_options.LayerOptionsImpl.toNative(layerOptions),
      mapkit_map_tile_data_source_builder.CreateTileDataSourceImpl.getNativePtr(
          createDataSource),
    );
    exception.checkCallResult();
    return mapkit_layers_layer.LayerImpl.fromNativePtr(result);
  }
}

final _Map_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Map_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Map_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Map_check')
    .asFunction(isLeaf: true);

final mapkit_map_camera_position.CameraPositionNative Function(
        ffi.Pointer<ffi.Void>) _Map_get_cameraPosition =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_camera_position.CameraPositionNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_get_cameraPosition')
        .asFunction();

final mapkit_map_visible_region.VisibleRegionNative Function(
        ffi.Pointer<ffi.Void>) _Map_get_visibleRegion =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_visible_region.VisibleRegionNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_get_visibleRegion')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _Map_get_cameraBounds = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_get_cameraBounds')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _Map_get_nightModeEnabled = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Map_get_nightModeEnabled')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _Map_set_nightModeEnabled = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_Map_set_nightModeEnabled')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _Map_get_zoomGesturesEnabled =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_get_zoomGesturesEnabled')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _Map_set_zoomGesturesEnabled = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_Map_set_zoomGesturesEnabled')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _Map_get_scrollGesturesEnabled =
    lib
        .library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_get_scrollGesturesEnabled')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _Map_set_scrollGesturesEnabled = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_Map_set_scrollGesturesEnabled')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _Map_get_tiltGesturesEnabled =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_get_tiltGesturesEnabled')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _Map_set_tiltGesturesEnabled = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_Map_set_tiltGesturesEnabled')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _Map_get_rotateGesturesEnabled =
    lib
        .library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_get_rotateGesturesEnabled')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _Map_set_rotateGesturesEnabled = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_Map_set_rotateGesturesEnabled')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _Map_get_fastTapEnabled = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Map_get_fastTapEnabled')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool) _Map_set_fastTapEnabled =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_Map_set_fastTapEnabled')
        .asFunction();

final core.int Function(ffi.Pointer<ffi.Void>) _Map_get_mapType = lib.library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Map_get_mapType')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _Map_set_mapType = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_Map_set_mapType')
    .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _Map_get_mapObjects = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_get_mapObjects')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _Map_get_logo = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Map_get_logo')
    .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _Map_get_poiLimit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_get_poiLimit')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Map_set_poiLimit = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_set_poiLimit')
        .asFunction();

final core.int Function(ffi.Pointer<ffi.Void>) _Map_get_mode = lib.library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Map_get_mode')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _Map_set_mode = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_Map_set_mode')
    .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _Map_get_hdModeEnabled = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Map_get_hdModeEnabled')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool) _Map_set_hdModeEnabled =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_Map_set_hdModeEnabled')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _Map_get_awesomeModelsEnabled =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_get_awesomeModelsEnabled')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _Map_set_awesomeModelsEnabled = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_Map_set_awesomeModelsEnabled')
        .asFunction();

final mapkit_map_camera_position.CameraPositionNative Function(
        ffi.Pointer<ffi.Void>, mapkit_geometry_geometry.GeometryNative)
    _Map_cameraPositionForGeometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_camera_position.CameraPositionNative Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.GeometryNative)>>(
            'yandex_flutter_mapkit_map_Map_cameraPositionForGeometry')
        .asFunction();
final mapkit_map_camera_position.CameraPositionNative Function(
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_geometry.GeometryNative,
        mapkit_screen_types.ScreenRectNative) _Map_cameraPositionWithFocus =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_camera_position.CameraPositionNative Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.GeometryNative,
                        mapkit_screen_types.ScreenRectNative)>>(
            'yandex_flutter_mapkit_map_Map_cameraPositionWithFocus')
        .asFunction();
final mapkit_map_camera_position.CameraPositionNative Function(
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_geometry.GeometryNative,
        core.double,
        core.double,
        ffi.Pointer<ffi.Void>) _Map_cameraPositionWithAzimut =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_camera_position.CameraPositionNative Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.GeometryNative,
                        ffi.Float,
                        ffi.Float,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_cameraPositionWithAzimut')
        .asFunction();
final mapkit_map_visible_region.VisibleRegionNative Function(
        ffi.Pointer<ffi.Void>, mapkit_map_camera_position.CameraPositionNative)
    _Map_visibleRegionForPosition = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_visible_region.VisibleRegionNative Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_camera_position.CameraPositionNative)>>(
            'yandex_flutter_mapkit_map_Map_visibleRegionForPosition')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>,
        mapkit_map_camera_position.CameraPositionNative,
        mapkit_animation.AnimationNative,
        ffi.Pointer<ffi.Void>) _Map_moveWithAnimation =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_camera_position.CameraPositionNative,
                        mapkit_animation.AnimationNative,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_moveWithAnimation')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_map_camera_position.CameraPositionNative)
    _Map_move = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_map_camera_position.CameraPositionNative)>>(
            'yandex_flutter_mapkit_map_Map_move')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Map_addInputListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_addInputListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Map_removeInputListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_removeInputListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Map_addCameraListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_addCameraListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Map_removeCameraListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_removeCameraListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Map_setMapLoadedListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_setMapLoadedListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Map_addTapListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_addTapListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Map_removeTapListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_removeTapListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _Map_deselectGeoObject = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Map_deselectGeoObject')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Map_selectGeoObject = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_selectGeoObject')
        .asFunction();
final core.bool Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _Map_setMapStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Bool Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_map_Map_setMapStyle')
        .asFunction();
final core.bool Function(
        ffi.Pointer<ffi.Void>, core.int, native_types.NativeString)
    _Map_setMapStyleWithId = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Int,
                        native_types.NativeString)>>(
            'yandex_flutter_mapkit_map_Map_setMapStyleWithId')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _Map_resetMapStyles = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Map_resetMapStyles')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool) _Map_set2DMode = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Bool)>>('yandex_flutter_mapkit_map_Map_set2DMode')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _Map_projection =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_projection')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _Map_wipe = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Map_wipe')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>,
        native_types.NativeString,
        mapkit_layers_layer_options.LayerOptionsNative,
        ffi.Pointer<ffi.Void>) _Map_addTileLayer =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>,
                        native_types.NativeString,
                        mapkit_layers_layer_options.LayerOptionsNative,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Map_addTileLayer')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _Map_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_Map_set_')
    .asFunction(isLeaf: true);

final class MapCameraCallbackImpl implements MapCameraCallback {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, MapCameraCallback>{};

  MapCameraCallbackImpl(
      {required void Function(core.bool completed) onMoveFinished})
      : _ptr = _MapCameraCallback_new(ffi.Pointer.fromFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Bool)>(_MapCameraCallback_onMoveFinished)),
        _onMoveFinished = onMoveFinished {
    _pointerToListener[_ptr] = this;
    _MapCameraCallbacksetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  @core.override
  void onMoveFinished(core.bool completed) => _onMoveFinished(completed);

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function(core.bool) _onMoveFinished;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(MapCameraCallback? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as MapCameraCallbackImpl)._ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _MapCameraCallbacksetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_Map_MapCameraCallback_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>)
    _MapCameraCallback_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>)>>(
            'yandex_flutter_mapkit_map_Map_MapCameraCallback_new')
        .asFunction(isLeaf: true);

void _MapCameraCallback_onMoveFinished(
    ffi.Pointer<ffi.Void> _ptr, core.bool completed) {
  final listener = MapCameraCallbackImpl._pointerToListener[_ptr]!;

  try {
    listener.onMoveFinished(completed);
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}
