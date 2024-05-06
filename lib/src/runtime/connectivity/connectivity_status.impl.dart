part of 'connectivity_status.dart';

@bindings_annotations.ContainerData(
    toNative: 'ConnectivityStatusImpl.toPointer',
    toPlatform:
        '(val) => ConnectivityStatusImpl.fromPointer(val, needFree: false)',
    platformType: 'ConnectivityStatus')
extension ConnectivityStatusImpl on ConnectivityStatus {
  static core.int toInt(ConnectivityStatus e) {
    return e.index;
  }

  static ConnectivityStatus fromInt(core.int val) {
    return ConnectivityStatus.values[val];
  }

  static ConnectivityStatus? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(ConnectivityStatus? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
