part of 'location_status.dart';

@bindings_annotations.ContainerData(
    toNative: 'LocationStatusImpl.toPointer',
    toPlatform: '(val) => LocationStatusImpl.fromPointer(val, needFree: false)',
    platformType: 'LocationStatus')
extension LocationStatusImpl on LocationStatus {
  static core.int toInt(LocationStatus e) {
    return e.index;
  }

  static LocationStatus fromInt(core.int val) {
    return LocationStatus.values[val];
  }

  static LocationStatus? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(LocationStatus? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
