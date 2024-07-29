part of 'map_mode.dart';

@bindings_annotations.ContainerData(
    toNative: 'MapModeImpl.toPointer',
    toPlatform: '(val) => MapModeImpl.fromPointer(val, needFree: false)',
    platformType: 'MapMode')
extension MapModeImpl on MapMode {
  static core.int toInt(MapMode e) {
    return e.index;
  }

  static MapMode fromInt(core.int val) {
    return MapMode.values[val];
  }

  static MapMode? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(MapMode? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
