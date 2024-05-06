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
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_window.dart'
    as mapkit_map_map_window;

part 'size_changed_listener.impl.dart';

/// Listener for MapWindow size changes.
abstract class MapSizeChangedListener {
  /// Called when MapWindow handles the platform SizeChanged event. param@
  /// absolute Screen coordinates.
  void onMapWindowSizeChanged(mapkit_map_map_window.MapWindow mapWindow,
      core.int newWidth, core.int newHeight);
}
