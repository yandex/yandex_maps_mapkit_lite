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
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/cluster.dart'
    as mapkit_map_cluster;

part 'cluster_tap_listener.impl.dart';

abstract class ClusterTapListener {
  /// Called when cluster is tapped. Return true if the event was handled.
  /// Otherwise it will be passed to underlying objects.
  core.bool onClusterTap(mapkit_map_cluster.Cluster cluster);
}
