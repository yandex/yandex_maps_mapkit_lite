part of 'region_state.dart';

@bindings_annotations.ContainerData(
    toNative: 'OfflineCacheRegionStateImpl.toPointer',
    toPlatform:
        '(val) => OfflineCacheRegionStateImpl.fromPointer(val, needFree: false)',
    platformType: 'OfflineCacheRegionState')
extension OfflineCacheRegionStateImpl on OfflineCacheRegionState {
  static core.int toInt(OfflineCacheRegionState e) {
    return e.index;
  }

  static OfflineCacheRegionState fromInt(core.int val) {
    return OfflineCacheRegionState.values[val];
  }

  static OfflineCacheRegionState? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(OfflineCacheRegionState? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
