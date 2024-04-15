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

/// @nodoc
class _LayerLoadedListenerWrapper implements ffi.Finalizable {
  _LayerLoadedListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_LayerLoadedListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Allows user to be notified when the layer has finished loading. This
/// occurs after all tiles required to render the layer have been
/// fetched, and are ready to be rendered. This event will not fire if
/// the layer never loads due to connectivity issues, or if the layer is
/// continuously changing and never completes loading due to the user
/// constantly interacting with the map.
abstract class LayerLoadedListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<LayerLoadedListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<LayerLoadedListener, _LayerLoadedListenerWrapper?>();

  /// Called after the layer has finished loading all visible tiles. This
  /// will only be called once. You must set another listener if you want
  /// to be notified again.
  void onLayerLoaded();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(LayerLoadedListener obj) {
    final ptr = _LayerLoadedListener_new(
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
            _LayerLoadedListener_onLayerLoaded));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _LayerLoadedListenerWrapper(ptr);
    _LayerLoadedListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(LayerLoadedListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _LayerLoadedListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_layers_LayerLoadedListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)
    _LayerLoadedListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_layers_LayerLoadedListener_new')
        .asFunction(isLeaf: true);

final _LayerLoadedListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_LayerLoadedListener_free');
void _LayerLoadedListener_onLayerLoaded(ffi.Pointer<ffi.Void> _ptr) {
  final listener = LayerLoadedListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onLayerLoaded();
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
