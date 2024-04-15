import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/raw_tile.dart'
    as mapkit_raw_tile;
import 'package:yandex_maps_mapkit_lite/src/mapkit/tile_id.dart'
    as mapkit_tile_id;
import 'package:yandex_maps_mapkit_lite/src/mapkit/version.dart'
    as mapkit_version;

/// @nodoc
class _TileProviderWrapper implements ffi.Finalizable {
  _TileProviderWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_TileProvider_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Generates tiles.
abstract class TileProvider {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<TileProvider>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<TileProvider, _TileProviderWrapper?>();

  /// Generates tile.
  ///
  /// This method will be called on a background thread.
  core.Future<mapkit_raw_tile.RawTile> load(
      mapkit_tile_id.TileId tileId,
      mapkit_version.Version version,
      core.Map<core.String, core.String> features,
      core.String etag);

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

  /// @nodoc
  @internal
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
  final listener = TileProvider._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }

  listener
      .load(
          mapkit_tile_id.TileId.fromNative(tileId),
          mapkit_version.Version.fromNative(version),
          to_platform.toMapString(features),
          to_platform.toPlatformString(etag))
      .then(
          (result) => _TileProviderloadInvokeOnResult(
              _onResult, mapkit_raw_tile.RawTile.getNativePtr(result)),
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
