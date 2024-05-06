part of 'layer_loaded_listener.dart';

final class _LayerLoadedListenerWrapper implements ffi.Finalizable {
  _LayerLoadedListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_LayerLoadedListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension LayerLoadedListenerImpl on LayerLoadedListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<LayerLoadedListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<LayerLoadedListener, _LayerLoadedListenerWrapper?>();

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
  final listener = LayerLoadedListenerImpl._pointerToListener[_ptr]?.target;
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
