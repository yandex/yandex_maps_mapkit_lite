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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;

part 'camera_bounds.containers.dart';
part 'camera_bounds.impl.dart';

/// The object that is used to interact with the map bounds.
abstract class CameraBounds implements ffi.Finalizable {
  /// Latitudes should be in range \[-89.3, 89.3\]. Longitudes should be in
  /// range \[-180, 180).
  ///
  mapkit_geometry_geometry.BoundingBox? get latLngBounds;
  set latLngBounds(mapkit_geometry_geometry.BoundingBox? val);

  /// Minimum available zoom level considering zoom level hint provided via
  /// #setMinZoomPreference.
  core.double getMinZoom();

  /// Maximum available zoom level considering zoom level hint provided via
  /// #setMaxZoomPreference
  core.double getMaxZoom();

  /// Set minimum available zoom level hint.
  void setMinZoomPreference(core.double zoom);

  /// Set maximum available zoom level hint.
  void setMaxZoomPreference(core.double zoom);

  /// Reset minimum and maximum available zoom level hints.
  void resetMinMaxZoomPreference();

  core.bool isValid();
}
