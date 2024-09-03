part of 'url_provider.dart';

final class _TilesUrlProviderWrapper implements ffi.Finalizable {
  _TilesUrlProviderWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_TilesUrlProvider_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension TilesUrlProviderImpl on TilesUrlProvider {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<TilesUrlProvider>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<TilesUrlProvider, _TilesUrlProviderWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(TilesUrlProvider obj) {
    final ptr = _TilesUrlProvider_new(ffi.Pointer.fromFunction<
        native_types.NativeString Function(
            ffi.Pointer<ffi.Void>,
            mapkit_tile_id.TileIdNative,
            mapkit_version.VersionNative,
            ffi.Pointer<ffi.Void>)>(_TilesUrlProvider_formatUrl));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _TilesUrlProviderWrapper(ptr);
    _TilesUrlProvidersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(TilesUrlProvider? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _TilesUrlProvidersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_tiles_TilesUrlProvider_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<
        ffi.NativeFunction<
            native_types.NativeString Function(
                ffi.Pointer<ffi.Void>,
                mapkit_tile_id.TileIdNative,
                mapkit_version.VersionNative,
                ffi.Pointer<ffi.Void>)>>) _TilesUrlProvider_new = lib.library
    .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.NativeFunction<native_types.NativeString Function(ffi.Pointer<ffi.Void>, mapkit_tile_id.TileIdNative, mapkit_version.VersionNative, ffi.Pointer<ffi.Void>)>>)>>(
        'yandex_flutter_mapkit_tiles_TilesUrlProvider_new')
    .asFunction(isLeaf: true);

final _TilesUrlProvider_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_tiles_TilesUrlProvider_free');
native_types.NativeString _TilesUrlProvider_formatUrl(
    ffi.Pointer<ffi.Void> _ptr,
    mapkit_tile_id.TileIdNative tileId,
    mapkit_version.VersionNative version,
    ffi.Pointer<ffi.Void> features) {
  final listener = TilesUrlProviderImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return to_native.toNativeString(listener.formatUrl(
        mapkit_tile_id.TileIdImpl.fromNative(tileId),
        mapkit_version.VersionImpl.fromNative(version),
        to_platform.toMapString(features)));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
