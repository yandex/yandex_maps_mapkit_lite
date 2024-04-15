import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location_manager.dart'
    as mapkit_location_location_manager;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location_view_source.dart'
    as mapkit_location_location_view_source;

class LocationViewSourceFactory {
  LocationViewSourceFactory._();

  /// Location view source.
  static mapkit_location_location_view_source.LocationViewSource
      createLocationViewSource(
          mapkit_location_location_manager.LocationManager locationManager) {
    return mapkit_location_location_view_source.LocationViewSource
        .fromNativePtr(_LocationViewSourceFactory_createLocationViewSource(
            mapkit_location_location_manager.LocationManager.getNativePtr(
                locationManager)));
  }
}

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<
        ffi.Void>) _LocationViewSourceFactory_createLocationViewSource = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationViewSourceFactory_createLocationViewSource')
    .asFunction();
