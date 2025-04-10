part of 'map_loaded_listener.dart';

final class _MapLoadedListenerWrapper implements ffi.Finalizable {
  _MapLoadedListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_MapLoadedListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension MapLoadedListenerImpl on MapLoadedListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<MapLoadedListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<MapLoadedListener, _MapLoadedListenerWrapper?>();

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
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>,
                    mapkit_map_map_load_statistics.MapLoadStatisticsNative)>>)
    _MapLoadedListener_new = lib.library
        .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, mapkit_map_map_load_statistics.MapLoadStatisticsNative)>>)>>(
            'yandex_flutter_mapkit_map_MapLoadedListener_new')
        .asFunction(isLeaf: true);

final _MapLoadedListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapLoadedListener_free');
void _MapLoadedListener_onMapLoaded(ffi.Pointer<ffi.Void> _ptr,
    mapkit_map_map_load_statistics.MapLoadStatisticsNative statistics) {
  final listener = MapLoadedListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapLoaded(
        mapkit_map_map_load_statistics.MapLoadStatisticsImpl.fromNative(
            statistics));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
