part of 'map_type.dart';

@bindings_annotations.ContainerData(
    toNative: 'MapTypeImpl.toPointer',
    toPlatform: '(val) => MapTypeImpl.fromPointer(val, needFree: false)',
    platformType: 'MapType')
extension MapTypeImpl on MapType {
  static core.int toInt(MapType e) {
    return e.index;
  }

  static MapType fromInt(core.int val) {
    return MapType.values[val];
  }

  static MapType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(MapType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
