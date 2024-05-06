import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/cluster_tap_listener.dart'
    as mapkit_map_cluster_tap_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;

part 'cluster.containers.dart';
part 'cluster.impl.dart';

abstract class Cluster implements ffi.Finalizable {
  /// A list of placemarks the cluster contains.
  core.List<mapkit_map_placemark.PlacemarkMapObject> get placemarks;

  /// Cluster size.
  core.int get size;

  /// Cluster representation displayed on the map.
  mapkit_map_placemark.PlacemarkMapObject get appearance;

  /// Adds a tap listener for cluster.
  ///
  /// The class does not retain the object in the 'clusterTapListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addClusterTapListener(
      mapkit_map_cluster_tap_listener.ClusterTapListener clusterTapListener);

  /// Removes tap listener.
  void removeClusterTapListener(
      mapkit_map_cluster_tap_listener.ClusterTapListener clusterTapListener);
}
