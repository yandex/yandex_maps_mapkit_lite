part of 'geo_object_tap_listener.dart';

final class _LayersGeoObjectTapListenerWrapper implements ffi.Finalizable {
  _LayersGeoObjectTapListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_LayersGeoObjectTapListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension LayersGeoObjectTapListenerImpl on LayersGeoObjectTapListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<LayersGeoObjectTapListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<LayersGeoObjectTapListener,
      _LayersGeoObjectTapListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(
      LayersGeoObjectTapListener obj) {
    final ptr = _LayersGeoObjectTapListener_new(ffi.Pointer.fromFunction<
            ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
        _LayersGeoObjectTapListener_onObjectTap, false));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _LayersGeoObjectTapListenerWrapper(ptr);
    _LayersGeoObjectTapListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(LayersGeoObjectTapListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _LayersGeoObjectTapListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_layers_LayersGeoObjectTapListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _LayersGeoObjectTapListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_layers_LayersGeoObjectTapListener_new')
        .asFunction(isLeaf: true);

final _LayersGeoObjectTapListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_LayersGeoObjectTapListener_free');
core.bool _LayersGeoObjectTapListener_onObjectTap(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> event) {
  final listener =
      LayersGeoObjectTapListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return listener.onObjectTap(
        mapkit_layers_geo_object_tap_event.GeoObjectTapEventImpl.fromNativePtr(
            event));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
