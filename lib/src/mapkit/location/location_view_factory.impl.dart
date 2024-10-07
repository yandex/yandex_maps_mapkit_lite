part of 'location_view_factory.dart';

mapkit_location_location_view_source.LocationViewSource
    _createLocationViewSource(
        mapkit_location_location_manager.LocationManager locationManager) {
  final result = _LocationViewSourceFactory_createLocationViewSource(
      mapkit_location_location_manager.LocationManagerImpl.getNativePtr(
          locationManager));
  return mapkit_location_location_view_source.LocationViewSourceImpl
      .fromNativePtr(result);
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
