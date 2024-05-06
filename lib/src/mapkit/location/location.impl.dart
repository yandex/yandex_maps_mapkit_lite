part of 'location.dart';

final class LocationNative extends ffi.Struct {
  external mapkit_geometry_point.PointNative position;
  external ffi.Pointer<ffi.Void> accuracy;
  external ffi.Pointer<ffi.Void> altitude;
  external ffi.Pointer<ffi.Void> altitudeAccuracy;
  external ffi.Pointer<ffi.Void> heading;
  external ffi.Pointer<ffi.Void> speed;
  external native_types.NativeAbsTimestamp absoluteTimestamp;
  external native_types.NativeRelTimestamp relativeTimestamp;
}

final LocationNative Function(
  mapkit_geometry_point.PointNative,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
  native_types.NativeAbsTimestamp,
  native_types.NativeRelTimestamp,
) _LocationNativeInit = lib.library
    .lookup<
        ffi.NativeFunction<
            LocationNative Function(
              mapkit_geometry_point.PointNative,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              native_types.NativeAbsTimestamp,
              native_types.NativeRelTimestamp,
            )>>('yandex_flutter_mapkit_location_Location_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LocationImpl.toPointer',
    toPlatform: '(val) => LocationImpl.fromPointer(val, needFree: false)',
    platformType: 'Location')
extension LocationImpl on Location {
  static Location fromNative(LocationNative native) {
    return Location(
      mapkit_geometry_point.PointImpl.fromNative(native.position),
      accuracy: to_platform.toPlatformFromPointerDouble(native.accuracy),
      altitude: to_platform.toPlatformFromPointerDouble(native.altitude),
      altitudeAccuracy:
          to_platform.toPlatformFromPointerDouble(native.altitudeAccuracy),
      heading: to_platform.toPlatformFromPointerDouble(native.heading),
      speed: to_platform.toPlatformFromPointerDouble(native.speed),
      to_platform.toPlatformAbsTimestamp(native.absoluteTimestamp),
      to_platform.toPlatformRelTimestamp(native.relativeTimestamp),
    );
  }

  static LocationNative toNative(Location obj) {
    return _LocationNativeInit(
      mapkit_geometry_point.PointImpl.toNative(obj.position),
      to_native.toNativePtrDouble(obj.accuracy),
      to_native.toNativePtrDouble(obj.altitude),
      to_native.toNativePtrDouble(obj.altitudeAccuracy),
      to_native.toNativePtrDouble(obj.heading),
      to_native.toNativePtrDouble(obj.speed),
      to_native.toNativeAbsTimestamp(obj.absoluteTimestamp),
      to_native.toNativeRelTimestamp(obj.relativeTimestamp),
    );
  }

  static Location? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = LocationImpl.fromNative(ptr.cast<LocationNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Location? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LocationNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
