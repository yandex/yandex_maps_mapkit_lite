part of 'tile_id.dart';

final class TileIdNative extends ffi.Struct {
  @ffi.Uint32()
  external core.int x;
  @ffi.Uint32()
  external core.int y;
  @ffi.Uint32()
  external core.int z;
}

final TileIdNative Function(core.int, core.int, core.int) _TileIdNativeInit =
    lib.library
        .lookup<
            ffi.NativeFunction<
                TileIdNative Function(ffi.Uint32, ffi.Uint32,
                    ffi.Uint32)>>('yandex_flutter_mapkit_TileId_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'TileIdImpl.toPointer',
    toPlatform: '(val) => TileIdImpl.fromPointer(val, needFree: false)',
    platformType: 'TileId')
extension TileIdImpl on TileId {
  static TileId fromNative(TileIdNative native) {
    return TileId(x: native.x, y: native.y, z: native.z);
  }

  static TileIdNative toNative(TileId obj) {
    return _TileIdNativeInit(obj.x, obj.y, obj.z);
  }

  static TileId? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = TileIdImpl.fromNative(ptr.cast<TileIdNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(TileId? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<TileIdNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
