part of 'overzoom_mode.dart';

@bindings_annotations.ContainerData(
    toNative: 'OverzoomModeImpl.toPointer',
    toPlatform: '(val) => OverzoomModeImpl.fromPointer(val, needFree: false)',
    platformType: 'OverzoomMode')
extension OverzoomModeImpl on OverzoomMode {
  static core.int toInt(OverzoomMode e) {
    return e.index;
  }

  static OverzoomMode fromInt(core.int val) {
    return OverzoomMode.values[val];
  }

  static OverzoomMode? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(OverzoomMode? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
