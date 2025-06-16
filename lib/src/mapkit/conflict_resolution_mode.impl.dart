part of 'conflict_resolution_mode.dart';

@bindings_annotations.ContainerData(
    toNative: 'ConflictResolutionModeImpl.toPointer',
    toPlatform:
        '(val) => ConflictResolutionModeImpl.fromPointer(val, needFree: false)',
    platformType: 'ConflictResolutionMode')
extension ConflictResolutionModeImpl on ConflictResolutionMode {
  static core.int toInt(ConflictResolutionMode e) {
    return e.index;
  }

  static ConflictResolutionMode fromInt(core.int val) {
    return ConflictResolutionMode.values[val];
  }

  static ConflictResolutionMode? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(ConflictResolutionMode? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
