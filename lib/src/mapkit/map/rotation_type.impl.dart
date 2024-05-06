part of 'rotation_type.dart';

@bindings_annotations.ContainerData(
    toNative: 'RotationTypeImpl.toPointer',
    toPlatform: '(val) => RotationTypeImpl.fromPointer(val, needFree: false)',
    platformType: 'RotationType')
extension RotationTypeImpl on RotationType {
  static core.int toInt(RotationType e) {
    return e.index;
  }

  static RotationType fromInt(core.int val) {
    return RotationType.values[val];
  }

  static RotationType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(RotationType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
