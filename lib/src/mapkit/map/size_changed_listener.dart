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
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_window.dart'
    as mapkit_map_map_window;

/// @nodoc
class _MapSizeChangedListenerWrapper implements ffi.Finalizable {
  _MapSizeChangedListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_MapSizeChangedListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Listener for MapWindow size changes.
abstract class MapSizeChangedListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<MapSizeChangedListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<MapSizeChangedListener,
      _MapSizeChangedListenerWrapper?>();

  /// Called when MapWindow handles the platform SizeChanged event. param@
  /// absolute Screen coordinates.
  void onMapWindowSizeChanged(mapkit_map_map_window.MapWindow mapWindow,
      core.int newWidth, core.int newHeight);

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(MapSizeChangedListener obj) {
    final ptr = _MapSizeChangedListener_new(ffi.Pointer.fromFunction<
        ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Int,
            ffi.Int)>(_MapSizeChangedListener_onMapWindowSizeChanged));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _MapSizeChangedListenerWrapper(ptr);
    _MapSizeChangedListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(MapSizeChangedListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _MapSizeChangedListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapSizeChangedListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Int, ffi.Int)>>)
    _MapSizeChangedListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Int, ffi.Int)>>)>>(
            'yandex_flutter_mapkit_map_MapSizeChangedListener_new')
        .asFunction(isLeaf: true);

final _MapSizeChangedListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapSizeChangedListener_free');
void _MapSizeChangedListener_onMapWindowSizeChanged(ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> mapWindow, core.int newWidth, core.int newHeight) {
  final listener = MapSizeChangedListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapWindowSizeChanged(
        mapkit_map_map_window.MapWindow.fromNativePtr(mapWindow),
        newWidth,
        newHeight);
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
