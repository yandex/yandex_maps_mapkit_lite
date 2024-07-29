import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/image/animated_image_provider.dart'
    as animated_image_provider;
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart'
    as image_provider;
import 'package:yandex_maps_mapkit_lite/src/bindings/ui_view/view_provider.dart'
    as view_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/base_map_object_collection.dart'
    as mapkit_map_base_map_object_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/icon_style.dart'
    as mapkit_map_icon_style;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;

part 'clusterized_placemark_collection.containers.dart';
part 'clusterized_placemark_collection.impl.dart';

/// A collection that displays large groups of placemarks efficiently.
/// Placemarks that are too close to each other with current zoom are
/// rendered as a single cluster. Placemarks and clusters are not shown
/// until clusterPlacemarks method is called explicitly.
abstract class ClusterizedPlacemarkCollection
    implements
        mapkit_map_base_map_object_collection.BaseMapObjectCollection,
        ffi.Finalizable {
  /// Creates a new empty placemark and adds it to the current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemark();

  /// Creates a new empty placemark and adds it to the current collection.
  /// Callback can be used to setup placemark style and position Callback
  /// will be called before MapObjectCollectionListener#onMapObjectAdded
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithCallback(
      mapkit_map_base_map_object_collection.PlacemarkCreatedCallback
          placemarkCreatedCallback);

  /// Creates a new empty placemark and adds it to the current collection.
  /// Hint: to add a large amount of empty placemarks use
  /// addEmptyPlacemarks method.
  mapkit_map_placemark.PlacemarkMapObject addEmptyPlacemark(
      mapkit_geometry_point.Point point);

  /// Creates new empty placemarks and adds them to the current collection.
  ///
  /// Relevant for Android: this method provides better performance for
  /// adding a large number of empty placemarks than multiple calls of
  /// addEmptyPlacemark.
  core.List<mapkit_map_placemark.PlacemarkMapObject> addEmptyPlacemarks(
      core.List<mapkit_geometry_point.Point> points);

  /// Creates a new placemark with the default icon and style, and adds it
  /// to the current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithPoint(
      mapkit_geometry_point.Point point);

  /// Creates a new placemark with the default style and adds it to the
  /// current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithImage(
      mapkit_geometry_point.Point point, image_provider.ImageProvider image);

  /// Creates a new placemark and adds it to the current collection. Hint:
  /// to add a large amount of placemarks use addPlacemarks method.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithStyle(
      mapkit_geometry_point.Point point,
      image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style);

  /// Creates a new view placemark with default style and adds it to the
  /// current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithView(
      mapkit_geometry_point.Point point, view_provider.ViewProvider view);

  /// Creates a new view placemark and adds it to the current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithViewStyle(
      mapkit_geometry_point.Point point,
      view_provider.ViewProvider view,
      mapkit_map_icon_style.IconStyle style);

  /// Creates a new placemark with animated icon and adds it to the current
  /// collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithAnimatedImageStyle(
      mapkit_geometry_point.Point point,
      animated_image_provider.AnimatedImageProvider animatedImage,
      mapkit_map_icon_style.IconStyle style);

  /// Creates new placemarks and adds them to the current collection.
  /// Relevant for Android: this method provides better performance for
  /// adding a large number of placemarks than multiple calls of
  /// addPlacemark.
  core.List<mapkit_map_placemark.PlacemarkMapObject> addPlacemarkWithImageStyle(
    image_provider.ImageProvider image,
    mapkit_map_icon_style.IconStyle style, {
    required core.List<mapkit_geometry_point.Point> points,
  });

  /// Updates clustered representations of placemark groups. This method
  /// must be called explicitly to render placemarks and clusters when
  /// collection is created and update them after collection change.
  ///
  /// [clusterRadius] Minimal distance in units between objects that remain
  /// separate. The size of the unit is equal to the size of a pixel when
  /// the camera position's tilt is equal to 0 and the scale factor is
  /// equal to 1.
  /// [minZoom] Minimal zoom level that displays clusters. All placemarks
  /// will be rendered separately at more detailed zoom levels. The value
  /// will be clipped between 0 and 19 (most detailed zoom).
  void clusterPlacemarks({
    required core.double clusterRadius,
    required core.int minZoom,
  });

  core.bool isValid();
}
