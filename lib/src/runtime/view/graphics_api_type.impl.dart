part of 'graphics_api_type.dart';

@bindings_annotations.ContainerData(
    toNative: 'GraphicsAPITypeImpl.toPointer',
    toPlatform:
        '(val) => GraphicsAPITypeImpl.fromPointer(val, needFree: false)',
    platformType: 'GraphicsAPIType')
extension GraphicsAPITypeImpl on GraphicsAPIType {
  static core.int toInt(GraphicsAPIType e) {
    return e.index;
  }

  static GraphicsAPIType fromInt(core.int val) {
    return GraphicsAPIType.values[val];
  }

  static GraphicsAPIType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(GraphicsAPIType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
