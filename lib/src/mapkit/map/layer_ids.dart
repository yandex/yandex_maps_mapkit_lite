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
  static core.String get jamsLayerId => _jamsLayerId;
  static core.String get personalizedPoiLayerId => _personalizedPoiLayerId;
  static core.String get carparksLayerId => _carparksLayerId;
  static core.String get carparksNearbyLayerId => _carparksNearbyLayerId;
  static core.String get transportLayerId => _transportLayerId;
  static core.String get searchPinsLayerId => _searchPinsLayerId;
  static core.String get advertPinsLayerId => _advertPinsLayerId;
  static core.String get buildingsLayerId => _buildingsLayerId;
  static core.String get mapObjectsLayerId => _mapObjectsLayerId;
  static core.String get routeMapObjectsLayerId => _routeMapObjectsLayerId;
  static core.String get userLocationLayerId => _userLocationLayerId;
  static core.String get panoramaLayerId => _panoramaLayerId;
  static core.String get toponymPhotoLayerId => _toponymPhotoLayerId;
  static core.String get drivingNavigationLayerId => _drivingNavigationLayerId;
  static core.String get routePinsLayerId => _routePinsLayerId;
  static core.String get roadEventsLayerId => _roadEventsLayerId;
}
