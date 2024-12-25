import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/async.dart'
    show runWithBlockUi;
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
import 'package:yandex_maps_mapkit_lite/src/mapkit/indoor/indoor_state_listener.dart'
    as mapkit_indoor_indoor_state_listener;
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
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_mode.dart'
    as mapkit_map_map_mode;
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
part 'map.impl.dart';

/// The object that is used to interact with the map.
abstract class Map implements ffi.Finalizable {
  /// Return Current camera position. Target position must be within
  /// latitude \[-90, 90\] and longitude \[-180, 180\].
  mapkit_map_camera_position.CameraPosition get cameraPosition;

  /// Return The map region that is currently visible. Region IS bounded by
  /// latitude limits \[-90, 90\] and IS NOT bounded by longitude limits
  /// \[-180, 180\]. If the longitude exceeds its limits, we see the
  /// world's edge and another instance of the world beyond this edge.
  mapkit_map_visible_region.VisibleRegion get visibleRegion;
  mapkit_map_camera_bounds.CameraBounds get cameraBounds;

  /// If enabled, night mode will reduce map brightness and improve
  /// contrast.
  core.bool get nightModeEnabled;
  set nightModeEnabled(core.bool val);

  /// Enable/disable zoom gestures, for example: - pinch - double tap (zoom
  /// in) - tap with two fingers (zoom out)
  core.bool get zoomGesturesEnabled;
  set zoomGesturesEnabled(core.bool val);

  /// Enable/disable scroll gestures, such as the pan gesture.
  core.bool get scrollGesturesEnabled;
  set scrollGesturesEnabled(core.bool val);

  /// Enable/disable tilt gestures, such as parallel pan with two fingers.
  core.bool get tiltGesturesEnabled;
  set tiltGesturesEnabled(core.bool val);

  /// Enable/disable rotation gestures, such as rotation with two fingers.
  core.bool get rotateGesturesEnabled;
  set rotateGesturesEnabled(core.bool val);

  /// Removes the 300 ms delay in emitting a tap gesture. However, a
  /// double-tap will emit a tap gesture along with a double-tap.
  core.bool get fastTapEnabled;
  set fastTapEnabled(core.bool val);

  /// Sets the base map type.
  mapkit_map_map_type.MapType get mapType;
  set mapType(mapkit_map_map_type.MapType val);

  /// Return List of map objects associated with the map. The layerId for
  /// this collection can be retrieved via LayerIds.mapObjectsLayerId
  mapkit_map_map_object_collection.MapObjectCollection get mapObjects;

  /// Yandex logo object.
  mapkit_logo_logo.Logo get logo;

  /// Limits the number of visible basemap POIs.
  ///
  core.int? get poiLimit;
  set poiLimit(core.int? val);

  /// Enables/disables indoor plans on the map. Disabled by default.
  core.bool get indoorEnabled;
  set indoorEnabled(core.bool val);

  /// Selects one of predefined map style modes optimized for particular
  /// use case(transit, driving, etc). Resets json styles set with
  /// setMapStyle. MapMode.Map by deafult.
  mapkit_map_map_mode.MapMode get mode;
  set mode(mapkit_map_map_mode.MapMode val);

  /// Enables hd mode of displayed content
  core.bool get hdModeEnabled;
  set hdModeEnabled(core.bool val);

  /// Enables rich textured 3d content on basemap.
  core.bool get awesomeModelsEnabled;
  set awesomeModelsEnabled(core.bool val);

  /// Calculates the camera position that projects the specified geometry
  /// into the current focusRect, or the full view if the focusRect is not
  /// set.
  mapkit_map_camera_position.CameraPosition cameraPositionForGeometry(
      mapkit_geometry_geometry.Geometry geometry);

  /// Calculates the camera position that projects the specified geometry
  /// into the custom focusRect.
  mapkit_map_camera_position.CameraPosition cameraPositionWithFocus(
      mapkit_geometry_geometry.Geometry geometry,
      mapkit_screen_types.ScreenRect focusRect);

  /// Return Camera position that projects the specified geometry into the
  /// custom focusRect, with custom azimuth and tilt camera parameters. If
  /// focus rect is not provided, current focus rect is used.
  mapkit_map_camera_position.CameraPosition cameraPositionWithAzimut(
    mapkit_geometry_geometry.Geometry geometry, {
    required core.double azimuth,
    required core.double tilt,
    mapkit_screen_types.ScreenRect? focusRect,
  });

  /// Return The map region that is visible from the given camera position.
  /// Region IS bounded by latitude limits \[-90, 90\] and IS NOT bounded
  /// by longitude limits \[-180, 180\]. If the longitude exceeds its
  /// limits, we see the world's edge and another instance of the world
  /// beyond this edge.
  mapkit_map_visible_region.VisibleRegion visibleRegionForPosition(
      mapkit_map_camera_position.CameraPosition cameraPosition);

  /// Changes camera position. Can cancel a previous unfinished movement.
  ///
  /// [animation] Required. Defines animation parameters. \@see
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
  });

  /// Immediately changes the camera position. Can cancel a previous
  /// unfinished movement.
  void move(mapkit_map_camera_position.CameraPosition cameraPosition);

  /// Adds input listeners.
  ///
  /// The class does not retain the object in the 'inputListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addInputListener(
      mapkit_map_input_listener.MapInputListener inputListener);

  /// Removes input listeners.
  void removeInputListener(
      mapkit_map_input_listener.MapInputListener inputListener);

  /// Adds camera listeners.
  ///
  /// The class does not retain the object in the 'cameraListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addCameraListener(
      mapkit_map_camera_listener.MapCameraListener cameraListener);

  /// Removes camera listeners.
  void removeCameraListener(
      mapkit_map_camera_listener.MapCameraListener cameraListener);

  /// Sets a map loaded listener.
  ///
  /// The class does not retain the object in the 'mapLoadedListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setMapLoadedListener(
      mapkit_map_map_loaded_listener.MapLoadedListener? mapLoadedListener);

  /// Adds a tap listener that is used to obtain brief geo object info.
  ///
  /// The class does not retain the object in the 'tapListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addTapListener(
      mapkit_layers_geo_object_tap_listener.LayersGeoObjectTapListener
          tapListener);

  /// Removes a tap listener that is used to obtain brief geo object info.
  void removeTapListener(
      mapkit_layers_geo_object_tap_listener.LayersGeoObjectTapListener
          tapListener);

  /// Resets the currently selected geo object.
  void deselectGeoObject();

  /// Selects a geo object with the specified objectId in the specified
  /// layerId. If the object is not currently on the screen, it is selected
  /// anyway, but the user will not actually see that. You need to move the
  /// camera in addition to this call to be sure that the selected object
  /// is visible for the user. GeoObjectSelectionMetadata can be extracted
  /// from the geo object's metadata container when the user taps on a geo
  /// object.
  void selectGeoObject(
      mapkit_map_geo_object_selection_metadata.GeoObjectSelectionMetadata
          selectionMetaData);

  /// Subscribe to indoor state change events.
  ///
  /// The class does not retain the object in the 'indoorStateListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addIndoorStateListener(
      mapkit_indoor_indoor_state_listener.IndoorStateListener
          indoorStateListener);

  /// Unsubscribe from indoor state change events.
  void removeIndoorStateListener(
      mapkit_indoor_indoor_state_listener.IndoorStateListener
          indoorStateListener);

  /// Applies JSON style transformations to the map. Same as setMapStyle(0,
  /// style). Affects VectorMap and Hybrid map types. Set to empty string
  /// to clear previous styling. Returns true if the style was successfully
  /// parsed, and false otherwise. If the returned value is false, the
  /// current map style remains unchanged.
  core.bool setMapStyle(core.String style);

  /// Applies JSON style transformations to the map. Replaces previous
  /// styling with the specified ID (if such exists). Stylings are applied
  /// in an ascending order. Affects VectorMap and Hybrid map types. Set to
  /// empty string to clear previous styling with the specified ID. Returns
  /// true if the style was successfully parsed, and false otherwise. If
  /// the returned value is false, the current map style remains unchanged.
  core.bool setMapStyleWithId({
    required core.int id,
    required core.String style,
  });

  /// Resets all JSON style transformations applied to the map.
  void resetMapStyles();

  /// Forces the map to be flat. true - All loaded tiles start showing the
  /// "flatten out" animation; all new tiles do not start 3D animation.
  /// false - All tiles start showing the "rise up" animation.
  void set2DMode(core.bool enable);

  /// Provides map projection
  mapkit_geometry_geo_projection.Projection projection();

  /// Erases tiles, caches, etc. Does not trigger the next frame
  /// generation.
  void wipe();

  /// Adds tile layer.
  mapkit_layers_layer.Layer addTileLayer(
    mapkit_layers_layer_options.LayerOptions layerOptions,
    mapkit_map_tile_data_source_builder.CreateTileDataSource createDataSource, {
    required core.String layerId,
  });

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

abstract final class MapCameraCallback {
  factory MapCameraCallback(
      {required void Function(core.bool completed) onMoveFinished}) {
    return MapCameraCallbackImpl(
      onMoveFinished: onMoveFinished,
    );
  }

  /// Called when the move is finished.
  void onMoveFinished(core.bool completed);
}
