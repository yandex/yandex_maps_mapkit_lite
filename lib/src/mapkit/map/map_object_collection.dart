import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/async.dart'
    show runWithBlockUi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/base_map_object_collection.dart'
    as mapkit_map_base_map_object_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/circle.dart'
    as mapkit_map_circle;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/cluster_listener.dart'
    as mapkit_map_cluster_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/clusterized_placemark_collection.dart'
    as mapkit_map_clusterized_placemark_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/icon_style.dart'
    as mapkit_map_icon_style;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemarks_styler.dart'
    as mapkit_map_placemarks_styler;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polygon.dart'
    as mapkit_map_polygon;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polyline.dart'
    as mapkit_map_polyline;

part 'map_object_collection.containers.dart';
part 'map_object_collection.impl.dart';

/// A collection of map objects that can hold any set of MapObject items,
/// including nested collections.
abstract class MapObjectCollection
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
  mapkit_map_placemark.PlacemarkMapObject addEmptyPlacemark(
      mapkit_geometry_point.Point point);

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
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithImageStyle(
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
  core.List<mapkit_map_placemark.PlacemarkMapObject> addPlacemarks(
    image_provider.ImageProvider image,
    mapkit_map_icon_style.IconStyle style, {
    required core.List<mapkit_geometry_point.Point> points,
  });

  /// Creates new empty placemarks and adds them to the current collection.
  ///
  /// Relevant for Android: this method provides better performance for
  /// adding a large number of empty placemarks than multiple calls of
  /// addEmptyPlacemark.
  core.List<mapkit_map_placemark.PlacemarkMapObject> addEmptyPlacemarks(
      core.List<mapkit_geometry_point.Point> points);

  /// Creates a new polyline and adds it to the current collection.
  mapkit_map_polyline.PolylineMapObject addPolylineWithGeometry(
      mapkit_geometry_geometry.Polyline polyline);

  /// Creates a new polyline with an empty geometry and adds it to the
  /// current collection.
  mapkit_map_polyline.PolylineMapObject addPolyline();

  /// Creates a new polygon and adds it to the current collection.
  mapkit_map_polygon.PolygonMapObject addPolygon(
      mapkit_geometry_geometry.Polygon polygon);

  /// Creates a new circle and adds it to the current collection.
  mapkit_map_circle.CircleMapObject addCircle(
      mapkit_geometry_geometry.Circle circle);

  /// Creates a new nested collection of map objects.
  MapObjectCollection addCollection();

  /// Creates a new nested collection of clusterized placemarks.
  ///
  /// The class does not retain the object in the 'clusterListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  ///
  /// [clusterListener] Listener that controls cluster appearance once they
  /// are added to the map.
  mapkit_map_clusterized_placemark_collection.ClusterizedPlacemarkCollection
      addClusterizedPlacemarkCollection(
          mapkit_map_cluster_listener.ClusterListener clusterListener);

  /// A styler for all placemarks in this collection, including placemarks
  /// in child collections.
  mapkit_map_placemarks_styler.PlacemarksStyler placemarksStyler();

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}
