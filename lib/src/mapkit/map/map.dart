import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/animation.dart'
    as mapkit_animation;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geo/projection.dart'
    as mapkit_geometry_geo_projection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/geo_object_tap_listener.dart'
    as mapkit_layers_geo_object_tap_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/layer.dart'
    as mapkit_layers_layer;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/layer_options.dart'
    as mapkit_layers_layer_options;
import 'package:yandex_maps_mapkit_lite/src/mapkit/logo/logo.dart'
    as mapkit_logo_logo;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/camera_bounds.dart'
    as mapkit_map_camera_bounds;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/camera_listener.dart'
    as mapkit_map_camera_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/camera_position.dart'
    as mapkit_map_camera_position;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/geo_object_selection_metadata.dart'
    as mapkit_map_geo_object_selection_metadata;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/input_listener.dart'
    as mapkit_map_input_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_loaded_listener.dart'
    as mapkit_map_map_loaded_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object_collection.dart'
    as mapkit_map_map_object_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_type.dart'
    as mapkit_map_map_type;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/tile_data_source_builder.dart'
    as mapkit_map_tile_data_source_builder;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/visible_region.dart'
    as mapkit_map_visible_region;
import 'package:yandex_maps_mapkit_lite/src/mapkit/screen_types.dart'
    as mapkit_screen_types;

part 'map.containers.dart';

/// The object that is used to interact with the map.
@bindings_annotations.WeakInterface('mapkit.map.Map')
@bindings_annotations.ContainerData(
    toNative: 'Map.getNativePtr',
    toPlatform:
        '(val) => Map.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class Map implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Map_free.cast());

  /// @nodoc
  Map.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  Map.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory Map.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Map? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _Map_check(ptr);
  }

  @internal

  /// @nodoc
  static Map? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return Map.fromNativePtr(ptr);
  }

  /// Return Current camera position. Target position must be within
  /// latitude \[-90, 90\] and longitude \[-180, 180\].
  mapkit_map_camera_position.CameraPosition get cameraPosition {
    return mapkit_map_camera_position.CameraPosition.fromNative(
        _Map_get_cameraPosition(ptr));
  }

  /// Return The map region that is currently visible. Region IS bounded by
  /// latitude limits \[-90, 90\] and IS NOT bounded by longitude limits
  /// \[-180, 180\]. If the longitude exceeds its limits, we see the
  /// world's edge and another instance of the world beyond this edge.
  mapkit_map_visible_region.VisibleRegion get visibleRegion {
    return mapkit_map_visible_region.VisibleRegion.fromNative(
        _Map_get_visibleRegion(ptr));
  }

  mapkit_map_camera_bounds.CameraBounds get cameraBounds {
    return mapkit_map_camera_bounds.CameraBounds.fromNativePtr(
        _Map_get_cameraBounds(ptr));
  }

  /// If enabled, night mode will reduce map brightness and improve
  /// contrast.
  core.bool get nightModeEnabled {
    return _Map_get_nightModeEnabled(ptr);
  }

  set nightModeEnabled(core.bool val) {
    return _Map_set_nightModeEnabled(ptr, val);
  }

  /// Enable/disable zoom gestures, for example: - pinch - double tap (zoom
  /// in) - tap with two fingers (zoom out)
  core.bool get zoomGesturesEnabled {
    return _Map_get_zoomGesturesEnabled(ptr);
  }

  set zoomGesturesEnabled(core.bool val) {
    return _Map_set_zoomGesturesEnabled(ptr, val);
  }

  /// Enable/disable scroll gestures, such as the pan gesture.
  core.bool get scrollGesturesEnabled {
    return _Map_get_scrollGesturesEnabled(ptr);
  }

  set scrollGesturesEnabled(core.bool val) {
    return _Map_set_scrollGesturesEnabled(ptr, val);
  }

  /// Enable/disable tilt gestures, such as parallel pan with two fingers.
  core.bool get tiltGesturesEnabled {
    return _Map_get_tiltGesturesEnabled(ptr);
  }

  set tiltGesturesEnabled(core.bool val) {
    return _Map_set_tiltGesturesEnabled(ptr, val);
  }

  /// Enable/disable rotation gestures, such as rotation with two fingers.
  core.bool get rotateGesturesEnabled {
    return _Map_get_rotateGesturesEnabled(ptr);
  }

  set rotateGesturesEnabled(core.bool val) {
    return _Map_set_rotateGesturesEnabled(ptr, val);
  }

  /// Removes the 300 ms delay in emitting a tap gesture. However, a
  /// double-tap will emit a tap gesture along with a double-tap.
  core.bool get fastTapEnabled {
    return _Map_get_fastTapEnabled(ptr);
  }

  set fastTapEnabled(core.bool val) {
    return _Map_set_fastTapEnabled(ptr, val);
  }

  /// Sets the base map type.
  mapkit_map_map_type.MapType get mapType {
    return mapkit_map_map_type.MapType.fromInt(_Map_get_mapType(ptr));
  }

  set mapType(mapkit_map_map_type.MapType val) {
    return _Map_set_mapType(ptr, mapkit_map_map_type.MapType.toInt(val));
  }

  /// Return List of map objects associated with the map. The layerId for
  /// this collection can be retrieved via LayerIds.mapObjectsLayerId
  mapkit_map_map_object_collection.MapObjectCollection get mapObjects {
    return mapkit_map_map_object_collection.MapObjectCollection.fromNativePtr(
        _Map_get_mapObjects(ptr));
  }

  /// Yandex logo object.
  mapkit_logo_logo.Logo get logo {
    return mapkit_logo_logo.Logo.fromNativePtr(_Map_get_logo(ptr));
  }

  /// Limits the number of visible basemap POIs.
  ///
  core.int? get poiLimit {
    return to_platform.toPlatformFromPointerUint32(_Map_get_poiLimit(ptr));
  }

  set poiLimit(core.int? val) {
    return _Map_set_poiLimit(ptr, to_native.toNativePtrUint32(val));
  }

  /// Calculates the camera position that projects the specified geometry
  /// into the current focusRect, or the full view if the focusRect is not
  /// set.
  mapkit_map_camera_position.CameraPosition cameraPositionForGeometry(
      mapkit_geometry_geometry.Geometry geometry) {
    return mapkit_map_camera_position.CameraPosition.fromNative(
        _Map_cameraPositionForGeometry(
            ptr, mapkit_geometry_geometry.Geometry.toNative(geometry)));
  }

  /// Calculates the camera position that projects the specified geometry
  /// into the custom focusRect.
  mapkit_map_camera_position.CameraPosition cameraPositionWithFocus(
      mapkit_geometry_geometry.Geometry geometry,
      mapkit_screen_types.ScreenRect focusRect) {
    return mapkit_map_camera_position.CameraPosition.fromNative(
        _Map_cameraPositionWithFocus(
            ptr,
            mapkit_geometry_geometry.Geometry.toNative(geometry),
            mapkit_screen_types.ScreenRect.toNative(focusRect)));
  }

  /// Return Camera position that projects the specified geometry into the
  /// custom focusRect, with custom azimuth and tilt camera parameters. If
  /// focus rect is not provided, current focus rect is used.
  mapkit_map_camera_position.CameraPosition cameraPositionWithAzimut(
    mapkit_geometry_geometry.Geometry geometry, {
    required core.double azimuth,
    required core.double tilt,
    mapkit_screen_types.ScreenRect? focusRect,
  }) {
    return mapkit_map_camera_position.CameraPosition.fromNative(
        _Map_cameraPositionWithAzimut(
            ptr,
            mapkit_geometry_geometry.Geometry.toNative(geometry),
            azimuth,
            tilt,
            mapkit_screen_types.ScreenRect.toPointer(focusRect)));
  }

  /// Return The map region that is visible from the given camera position.
  /// Region IS bounded by latitude limits \[-90, 90\] and IS NOT bounded
  /// by longitude limits \[-180, 180\]. If the longitude exceeds its
  /// limits, we see the world's edge and another instance of the world
  /// beyond this edge.
  mapkit_map_visible_region.VisibleRegion visibleRegionForPosition(
      mapkit_map_camera_position.CameraPosition cameraPosition) {
    return mapkit_map_visible_region.VisibleRegion.fromNative(
        _Map_visibleRegionForPosition(
            ptr,
            mapkit_map_camera_position.CameraPosition.toNative(
                cameraPosition)));
  }

  /// Changes camera position. Can cancel a previous unfinished movement.
  ///
  /// [animation] Required. Defines animation parameters. @see
  /// mapkit.Animation for more details.
  /// [cameraCallback] A function that takes the bool argument marking the
  /// camera action complete. Invoked when: <ul><li>A camera action is
  /// cancelled (for example, as a result of a subsequent request for
  /// camera movement), passing false as an argument.</li> <li>A camera
  /// action finished successfully, passing true as an argument.</li></ul>
  void moveWithAnimation(
    mapkit_map_camera_position.CameraPosition cameraPosition,
    mapkit_animation.Animation animation, {
    MapCameraCallback? cameraCallback,
  }) {
    _Map_moveWithAnimation(
        ptr,
        mapkit_map_camera_position.CameraPosition.toNative(cameraPosition),
        mapkit_animation.Animation.toNative(animation),
        MapCameraCallback.getNativePtr(cameraCallback));
  }

  /// Immediately changes the camera position. Can cancel a previous
  /// unfinished movement.
  void move(mapkit_map_camera_position.CameraPosition cameraPosition) {
    _Map_move(ptr,
        mapkit_map_camera_position.CameraPosition.toNative(cameraPosition));
  }

  /// Adds input listeners.
  ///
  /// The class does not retain the object in the 'inputListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addInputListener(
      mapkit_map_input_listener.MapInputListener inputListener) {
    _Map_addInputListener(ptr,
        mapkit_map_input_listener.MapInputListener.getNativePtr(inputListener));
  }

  /// Removes input listeners.
  void removeInputListener(
      mapkit_map_input_listener.MapInputListener inputListener) {
    _Map_removeInputListener(ptr,
        mapkit_map_input_listener.MapInputListener.getNativePtr(inputListener));
  }

  /// Adds camera listeners.
  ///
  /// The class does not retain the object in the 'cameraListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addCameraListener(
      mapkit_map_camera_listener.MapCameraListener cameraListener) {
    _Map_addCameraListener(
        ptr,
        mapkit_map_camera_listener.MapCameraListener.getNativePtr(
            cameraListener));
  }

  /// Removes camera listeners.
  void removeCameraListener(
      mapkit_map_camera_listener.MapCameraListener cameraListener) {
    _Map_removeCameraListener(
        ptr,
        mapkit_map_camera_listener.MapCameraListener.getNativePtr(
            cameraListener));
  }

  /// Sets a map loaded listener.
  ///
  /// The class does not retain the object in the 'mapLoadedListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setMapLoadedListener(
      mapkit_map_map_loaded_listener.MapLoadedListener? mapLoadedListener) {
    _Map_setMapLoadedListener(
        ptr,
        mapkit_map_map_loaded_listener.MapLoadedListener.getNativePtr(
            mapLoadedListener));
  }

  /// Adds a tap listener that is used to obtain brief geo object info.
  ///
  /// The class does not retain the object in the 'tapListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addTapListener(
      mapkit_layers_geo_object_tap_listener.LayersGeoObjectTapListener
          tapListener) {
    _Map_addTapListener(
        ptr,
        mapkit_layers_geo_object_tap_listener.LayersGeoObjectTapListener
            .getNativePtr(tapListener));
  }

  /// Removes a tap listener that is used to obtain brief geo object info.
  void removeTapListener(
      mapkit_layers_geo_object_tap_listener.LayersGeoObjectTapListener
          tapListener) {
    _Map_removeTapListener(
        ptr,
        mapkit_layers_geo_object_tap_listener.LayersGeoObjectTapListener
            .getNativePtr(tapListener));
  }

  /// Resets the currently selected geo object.
  void deselectGeoObject() {
    _Map_deselectGeoObject(ptr);
  }

  /// Selects a geo object with the specified objectId in the specified
  /// layerId. If the object is not currently on the screen, it is selected
  /// anyway, but the user will not actually see that. You need to move the
  /// camera in addition to this call to be sure that the selected object
  /// is visible for the user. GeoObjectSelectionMetadata can be extracted
  /// from the geo object's metadata container when the user taps on a geo
  /// object.
  void selectGeoObject(
      mapkit_map_geo_object_selection_metadata.GeoObjectSelectionMetadata
          selectionMetaData) {
    _Map_selectGeoObject(
        ptr,
        mapkit_map_geo_object_selection_metadata.GeoObjectSelectionMetadata
            .getNativePtr(selectionMetaData));
  }

  /// Applies JSON style transformations to the map. Same as setMapStyle(0,
  /// style). Affects VectorMap and Hybrid map types. Set to empty string
  /// to clear previous styling. Returns true if the style was successfully
  /// parsed, and false otherwise. If the returned value is false, the
  /// current map style remains unchanged.
  core.bool setMapStyle(core.String style) {
    return _Map_setMapStyle(ptr, to_native.toNativeString(style));
  }

  /// Applies JSON style transformations to the map. Replaces previous
  /// styling with the specified ID (if such exists). Stylings are applied
  /// in an ascending order. Affects VectorMap and Hybrid map types. Set to
  /// empty string to clear previous styling with the specified ID. Returns
  /// true if the style was successfully parsed, and false otherwise. If
  /// the returned value is false, the current map style remains unchanged.
  core.bool setMapStyleWithId({
    required core.int id,
    required core.String style,
  }) {
    return _Map_setMapStyleWithId(ptr, id, to_native.toNativeString(style));
  }

  /// Resets all JSON style transformations applied to the map.
  void resetMapStyles() {
    _Map_resetMapStyles(ptr);
  }

  /// Forces the map to be flat. true - All loaded tiles start showing the
  /// "flatten out" animation; all new tiles do not start 3D animation.
  /// false - All tiles start showing the "rise up" animation.
  void set2DMode(core.bool enable) {
    _Map_set2DMode(ptr, enable);
  }

  /// Provides map projection
  mapkit_geometry_geo_projection.Projection projection() {
    return mapkit_geometry_geo_projection.Projection.fromNativePtr(
        _Map_projection(ptr));
  }

  /// Erases tiles, caches, etc. Does not trigger the next frame
  /// generation.
  void wipe() {
    _Map_wipe(ptr);
  }

  /// Adds tile layer.
  mapkit_layers_layer.Layer addTileLayer(
    mapkit_layers_layer_options.LayerOptions layerOptions,
    mapkit_map_tile_data_source_builder.CreateTileDataSource createDataSource, {
    required core.String layerId,
  }) {
    return mapkit_layers_layer.Layer.fromNativePtr(_Map_addTileLayer(
      ptr,
      to_native.toNativeString(layerId),
      mapkit_layers_layer_options.LayerOptions.toNative(layerOptions),
      mapkit_map_tile_data_source_builder.CreateTileDataSource.getNativePtr(
          createDataSource),
    ));
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

class MapCameraCallback {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, MapCameraCallback>{};

  MapCameraCallback(
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

  /// Called when the move is finished.
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
    return obj._ptr;
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
  final listener = MapCameraCallback._pointerToListener[_ptr]!;

  try {
    listener.onMoveFinished(completed);
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}
