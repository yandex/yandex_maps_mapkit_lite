part of 'purpose.dart';

@bindings_annotations.ContainerData(
    toNative: 'PurposeImpl.toPointer',
    toPlatform: '(val) => PurposeImpl.fromPointer(val, needFree: false)',
    platformType: 'Purpose')
extension PurposeImpl on Purpose {
  static core.int toInt(Purpose e) {
    return e.index;
  }

  static Purpose fromInt(core.int val) {
    return Purpose.values[val];
  }

  static Purpose? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(Purpose? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
