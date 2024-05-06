part of 'sensors.dart';

@bindings_annotations.ContainerData(
    toNative: 'LocationActivityTypeImpl.toPointer',
    toPlatform:
        '(val) => LocationActivityTypeImpl.fromPointer(val, needFree: false)',
    platformType: 'LocationActivityType')
extension LocationActivityTypeImpl on LocationActivityType {
  static core.int toInt(LocationActivityType e) {
    return e.index;
  }

  static LocationActivityType fromInt(core.int val) {
    return LocationActivityType.values[val];
  }

  static LocationActivityType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(LocationActivityType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
