part of 'camera_update_reason.dart';

@bindings_annotations.ContainerData(
    toNative: 'CameraUpdateReasonImpl.toPointer',
    toPlatform:
        '(val) => CameraUpdateReasonImpl.fromPointer(val, needFree: false)',
    platformType: 'CameraUpdateReason')
extension CameraUpdateReasonImpl on CameraUpdateReason {
  static core.int toInt(CameraUpdateReason e) {
    return e.index;
  }

  static CameraUpdateReason fromInt(core.int val) {
    return CameraUpdateReason.values[val];
  }

  static CameraUpdateReason? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(CameraUpdateReason? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
