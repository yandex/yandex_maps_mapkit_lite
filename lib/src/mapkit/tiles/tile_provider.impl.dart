part of 'tile_provider.dart';

final class _TileProviderWrapper implements ffi.Finalizable {
  _TileProviderWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_TileProvider_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension TileProviderImpl on TileProvider {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<TileProvider>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<TileProvider, _TileProviderWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(TileProvider obj) {
    final ptr = _TileProvider_new(ffi.Pointer.fromFunction<
        ffi.Void Function(
            ffi.Pointer<ffi.Void>,
            ffi.Pointer<ffi.Void>,
            mapkit_tile_id.TileIdNative,
            mapkit_version.VersionNative,
            ffi.Pointer<ffi.Void>,
            native_types.NativeString)>(_TileProvider_load));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _TileProviderWrapper(ptr);
    _TileProvidersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createAsyncExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(TileProvider? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _TileProvidersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_tiles_TileProvider_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                mapkit_tile_id.TileIdNative,
                mapkit_version.VersionNative,
                ffi.Pointer<ffi.Void>,
                native_types.NativeString)>>) _TileProvider_new = lib.library
    .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, mapkit_tile_id.TileIdNative, mapkit_version.VersionNative, ffi.Pointer<ffi.Void>, native_types.NativeString)>>)>>(
        'yandex_flutter_mapkit_tiles_TileProvider_new')
    .asFunction(isLeaf: true);

final _TileProvider_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_tiles_TileProvider_free');
void _TileProvider_load(
    ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> _onResult,
    mapkit_tile_id.TileIdNative tileId,
    mapkit_version.VersionNative version,
    ffi.Pointer<ffi.Void> features,
    native_types.NativeString etag) {
  final listener = TileProviderImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }

  listener
      .load(
          mapkit_tile_id.TileIdImpl.fromNative(tileId),
          mapkit_version.VersionImpl.fromNative(version),
          to_platform.toMapString(features),
          to_platform.toPlatformString(etag))
      .then(
          (result) => _TileProviderloadInvokeOnResult(
              _onResult, mapkit_raw_tile.RawTileImpl.getNativePtr(result)),
          onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _TileProviderloadInvokeOnResult = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_tiles_TileProvider_load_invokeOnResult')
        .asFunction(isLeaf: true);
