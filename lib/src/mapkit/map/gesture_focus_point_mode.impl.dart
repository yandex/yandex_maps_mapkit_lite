part of 'gesture_focus_point_mode.dart';

@bindings_annotations.ContainerData(
    toNative: 'GestureFocusPointModeImpl.toPointer',
    toPlatform:
        '(val) => GestureFocusPointModeImpl.fromPointer(val, needFree: false)',
    platformType: 'GestureFocusPointMode')
extension GestureFocusPointModeImpl on GestureFocusPointMode {
  static core.int toInt(GestureFocusPointMode e) {
    return e.index;
  }

  static GestureFocusPointMode fromInt(core.int val) {
    return GestureFocusPointMode.values[val];
  }

  static GestureFocusPointMode? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(GestureFocusPointMode? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
