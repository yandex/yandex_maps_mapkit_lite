part of 'tile_format.dart';

@bindings_annotations.ContainerData(
    toNative: 'TileFormatImpl.toPointer',
    toPlatform: '(val) => TileFormatImpl.fromPointer(val, needFree: false)',
    platformType: 'TileFormat')
extension TileFormatImpl on TileFormat {
  static core.int toInt(TileFormat e) {
    return e.index;
  }

  static TileFormat fromInt(core.int val) {
    return TileFormat.values[val];
  }

  static TileFormat? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(TileFormat? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
