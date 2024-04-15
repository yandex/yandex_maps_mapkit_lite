import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;

class LayerIds {
  LayerIds._();

  static core.String get mapLayerId {
    return to_platform.toPlatformString(_LayerIds_get_mapLayerId());
  }

  static core.String get jamsLayerId {
    return to_platform.toPlatformString(_LayerIds_get_jamsLayerId());
  }

  static core.String get personalizedPoiLayerId {
    return to_platform.toPlatformString(_LayerIds_get_personalizedPoiLayerId());
  }

  static core.String get carparksLayerId {
    return to_platform.toPlatformString(_LayerIds_get_carparksLayerId());
  }

  static core.String get carparksNearbyLayerId {
    return to_platform.toPlatformString(_LayerIds_get_carparksNearbyLayerId());
  }

  static core.String get transportLayerId {
    return to_platform.toPlatformString(_LayerIds_get_transportLayerId());
  }

  static core.String get searchPinsLayerId {
    return to_platform.toPlatformString(_LayerIds_get_searchPinsLayerId());
  }

  static core.String get advertPinsLayerId {
    return to_platform.toPlatformString(_LayerIds_get_advertPinsLayerId());
  }

  static core.String get buildingsLayerId {
    return to_platform.toPlatformString(_LayerIds_get_buildingsLayerId());
  }

  static core.String get mapObjectsLayerId {
    return to_platform.toPlatformString(_LayerIds_get_mapObjectsLayerId());
  }

  static core.String get routeMapObjectsLayerId {
    return to_platform.toPlatformString(_LayerIds_get_routeMapObjectsLayerId());
  }

  static core.String get userLocationLayerId {
    return to_platform.toPlatformString(_LayerIds_get_userLocationLayerId());
  }

  static core.String get panoramaLayerId {
    return to_platform.toPlatformString(_LayerIds_get_panoramaLayerId());
  }

  static core.String get toponymPhotoLayerId {
    return to_platform.toPlatformString(_LayerIds_get_toponymPhotoLayerId());
  }

  static core.String get drivingNavigationLayerId {
    return to_platform
        .toPlatformString(_LayerIds_get_drivingNavigationLayerId());
  }

  static core.String get routePinsLayerId {
    return to_platform.toPlatformString(_LayerIds_get_routePinsLayerId());
  }

  static core.String get mrcPhotoAutomotiveLayerId {
    return to_platform
        .toPlatformString(_LayerIds_get_mrcPhotoAutomotiveLayerId());
  }

  static core.String get mrcPhotoAutomotiveAgeLayerId {
    return to_platform
        .toPlatformString(_LayerIds_get_mrcPhotoAutomotiveAgeLayerId());
  }

  static core.String get mrcPhotoPedestrianLayerId {
    return to_platform
        .toPlatformString(_LayerIds_get_mrcPhotoPedestrianLayerId());
  }

  static core.String get mrcPhotoPedestrianAgeLayerId {
    return to_platform
        .toPlatformString(_LayerIds_get_mrcPhotoPedestrianAgeLayerId());
  }

  static core.String get roadEventsLayerId {
    return to_platform.toPlatformString(_LayerIds_get_roadEventsLayerId());
  }
}

final native_types.NativeString Function() _LayerIds_get_mapLayerId = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_LayerIds_get_mapLayerId')
    .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_jamsLayerId = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_LayerIds_get_jamsLayerId')
    .asFunction(isLeaf: true);
final native_types.NativeString Function()
    _LayerIds_get_personalizedPoiLayerId = lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_LayerIds_get_personalizedPoiLayerId')
        .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_carparksLayerId = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_LayerIds_get_carparksLayerId')
    .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_carparksNearbyLayerId =
    lib
        .library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_LayerIds_get_carparksNearbyLayerId')
        .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_transportLayerId = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_LayerIds_get_transportLayerId')
    .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_searchPinsLayerId = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_LayerIds_get_searchPinsLayerId')
    .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_advertPinsLayerId = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_LayerIds_get_advertPinsLayerId')
    .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_buildingsLayerId = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_LayerIds_get_buildingsLayerId')
    .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_mapObjectsLayerId = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_LayerIds_get_mapObjectsLayerId')
    .asFunction(isLeaf: true);
final native_types.NativeString Function()
    _LayerIds_get_routeMapObjectsLayerId = lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_LayerIds_get_routeMapObjectsLayerId')
        .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_userLocationLayerId =
    lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_LayerIds_get_userLocationLayerId')
        .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_panoramaLayerId = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_LayerIds_get_panoramaLayerId')
    .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_toponymPhotoLayerId =
    lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_LayerIds_get_toponymPhotoLayerId')
        .asFunction(isLeaf: true);
final native_types.NativeString Function()
    _LayerIds_get_drivingNavigationLayerId = lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_LayerIds_get_drivingNavigationLayerId')
        .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_routePinsLayerId = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_LayerIds_get_routePinsLayerId')
    .asFunction(isLeaf: true);
final native_types.NativeString Function()
    _LayerIds_get_mrcPhotoAutomotiveLayerId = lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_LayerIds_get_mrcPhotoAutomotiveLayerId')
        .asFunction(isLeaf: true);
final native_types.NativeString Function()
    _LayerIds_get_mrcPhotoAutomotiveAgeLayerId = lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_LayerIds_get_mrcPhotoAutomotiveAgeLayerId')
        .asFunction(isLeaf: true);
final native_types.NativeString Function()
    _LayerIds_get_mrcPhotoPedestrianLayerId = lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_LayerIds_get_mrcPhotoPedestrianLayerId')
        .asFunction(isLeaf: true);
final native_types.NativeString Function()
    _LayerIds_get_mrcPhotoPedestrianAgeLayerId = lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_LayerIds_get_mrcPhotoPedestrianAgeLayerId')
        .asFunction(isLeaf: true);
final native_types.NativeString Function() _LayerIds_get_roadEventsLayerId = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_LayerIds_get_roadEventsLayerId')
    .asFunction(isLeaf: true);
