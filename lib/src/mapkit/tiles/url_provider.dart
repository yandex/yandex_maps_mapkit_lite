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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/tile_id.dart'
    as mapkit_tile_id;
import 'package:yandex_maps_mapkit_lite/src/mapkit/version.dart'
    as mapkit_version;

/// @nodoc
class _TilesUrlProviderWrapper implements ffi.Finalizable {
  _TilesUrlProviderWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_TilesUrlProvider_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Provides a formatted URL.
abstract class TilesUrlProvider {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<TilesUrlProvider>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<TilesUrlProvider, _TilesUrlProviderWrapper?>();

  /// Create s a URL based on the tile ID, version, and features. Features
  /// are some layer customisations. Tiles with appropriate features are
  /// prioretized over tiles without them when loading.
  ///
  /// This method may be called on any thread. Its implementation must be thread-safe.
  core.String formatUrl(
      mapkit_tile_id.TileId tileId,
      mapkit_version.Version version,
      core.Map<core.String, core.String> features);

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

  /// @nodoc
  @internal
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
  final listener = TilesUrlProvider._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return to_native.toNativeString(listener.formatUrl(
        mapkit_tile_id.TileId.fromNative(tileId),
        mapkit_version.Version.fromNative(version),
        to_platform.toMapString(features)));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
