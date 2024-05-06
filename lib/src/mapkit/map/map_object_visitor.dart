import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/circle.dart'
    as mapkit_map_circle;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/clusterized_placemark_collection.dart'
    as mapkit_map_clusterized_placemark_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object_collection.dart'
    as mapkit_map_map_object_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polygon.dart'
    as mapkit_map_polygon;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polyline.dart'
    as mapkit_map_polyline;

part 'map_object_visitor.impl.dart';

/// Used to traverse over the children of the MapObjectCollection.
abstract class MapObjectVisitor {
  /// Called when a placemark is visited.
  void onPlacemarkVisited(mapkit_map_placemark.PlacemarkMapObject placemark);

  /// Called when a polyline is visited.
  void onPolylineVisited(mapkit_map_polyline.PolylineMapObject polyline);

  /// Called when a polygon is visited.
  void onPolygonVisited(mapkit_map_polygon.PolygonMapObject polygon);

  /// Called when a circle is visited.
  void onCircleVisited(mapkit_map_circle.CircleMapObject circle);

  /// Called for every child collection. The collection is ignored if this
  /// method returns false.
  core.bool onCollectionVisitStart(
      mapkit_map_map_object_collection.MapObjectCollection collection);

  /// Called for visited collections only. If an exception occurred during
  /// the visit, the method might be skipped.
  void onCollectionVisitEnd(
      mapkit_map_map_object_collection.MapObjectCollection collection);

  /// Called for clusterized placemark collection. The collection is
  /// ignored if this method returns false.
  core.bool onClusterizedCollectionVisitStart(
      mapkit_map_clusterized_placemark_collection.ClusterizedPlacemarkCollection
          collection);

  /// Called for visited clusterized placemark collections only. If an
  /// exception occurred during the visit, the method might be skipped.
  void onClusterizedCollectionVisitEnd(
      mapkit_map_clusterized_placemark_collection.ClusterizedPlacemarkCollection
          collection);
}
