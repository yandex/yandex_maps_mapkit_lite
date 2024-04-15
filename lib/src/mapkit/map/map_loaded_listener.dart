import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_load_statistics.dart'
    as mapkit_map_map_load_statistics;

/// @nodoc
class _MapLoadedListenerWrapper implements ffi.Finalizable {
  _MapLoadedListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_MapLoadedListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Listener interface for when the map has finished loading. This occurs
/// after all tiles required to render the map have been fetched, and are
/// ready to be rendered. This event will not fire if the map never loads
/// due to connectivity issues, or if the map is continuously changing
/// and never completes loading due to the user constantly interacting
/// with the map.
abstract class MapLoadedListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<MapLoadedListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<MapLoadedListener, _MapLoadedListenerWrapper?>();

  /// Called after the map has finished loading all visible tiles. This
  /// will only be called once. You must set another listener if you want
  /// to be notified again.
  void onMapLoaded(mapkit_map_map_load_statistics.MapLoadStatistics statistics);

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(MapLoadedListener obj) {
    final ptr = _MapLoadedListener_new(ffi.Pointer.fromFunction<
        ffi.Void Function(
            ffi.Pointer<ffi.Void>,
            mapkit_map_map_load_statistics
                .MapLoadStatisticsNative)>(_MapLoadedListener_onMapLoaded));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _MapLoadedListenerWrapper(ptr);
    _MapLoadedListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(MapLoadedListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _MapLoadedListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapLoadedListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi
            .NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>,
                    mapkit_map_map_load_statistics
                        .MapLoadStatisticsNative)>>)
    _MapLoadedListener_new =
    lib
        .library
        .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, mapkit_map_map_load_statistics.MapLoadStatisticsNative)>>)>>(
            'yandex_flutter_mapkit_map_MapLoadedListener_new')
        .asFunction(isLeaf: true);

final _MapLoadedListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapLoadedListener_free');
void _MapLoadedListener_onMapLoaded(ffi.Pointer<ffi.Void> _ptr,
    mapkit_map_map_load_statistics.MapLoadStatisticsNative statistics) {
  final listener = MapLoadedListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapLoaded(
        mapkit_map_map_load_statistics.MapLoadStatistics.fromNative(
            statistics));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
