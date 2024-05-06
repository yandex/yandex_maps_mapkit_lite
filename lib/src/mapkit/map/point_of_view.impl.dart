part of 'point_of_view.dart';

@bindings_annotations.ContainerData(
    toNative: 'PointOfViewImpl.toPointer',
    toPlatform: '(val) => PointOfViewImpl.fromPointer(val, needFree: false)',
    platformType: 'PointOfView')
extension PointOfViewImpl on PointOfView {
  static core.int toInt(PointOfView e) {
    return e.index;
  }

  static PointOfView fromInt(core.int val) {
    return PointOfView.values[val];
  }

  static PointOfView? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(PointOfView? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
