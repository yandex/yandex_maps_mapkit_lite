import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;

part 'layer_ids.impl.dart';

class LayerIds {
  LayerIds._();

  static core.String get mapLayerId => _mapLayerId;

  /// Deprecated. There is no separate jams layer anymore.
  static core.String get jamsLayerId => _jamsLayerId;

  /// Deprecated. There is no separate ppoi layer anymore.
  static core.String get personalizedPoiLayerId => _personalizedPoiLayerId;
  static core.String get transportLayerId => _transportLayerId;
  static core.String get searchPinsLayerId => _searchPinsLayerId;
  static core.String get advertPinsLayerId => _advertPinsLayerId;
  static core.String get buildingsLayerId => _buildingsLayerId;
  static core.String get mapObjectsLayerId => _mapObjectsLayerId;
  static core.String get routeMapObjectsLayerId => _routeMapObjectsLayerId;
  static core.String get userLocationLayerId => _userLocationLayerId;
  static core.String get drivingNavigationBaseLayerId =>
      _drivingNavigationBaseLayerId;
  static core.String get drivingNavigationRoutePinsLayerId =>
      _drivingNavigationRoutePinsLayerId;
  static core.String get drivingNavigationBalloonsLayerId =>
      _drivingNavigationBalloonsLayerId;
  static core.String get drivingNavigationUserPlacemarkLayerId =>
      _drivingNavigationUserPlacemarkLayerId;
  static core.String get roadEventsLayerId => _roadEventsLayerId;
}
