part of 'map_object_collection_listener.dart';

final class _MapObjectCollectionListenerWrapper implements ffi.Finalizable {
  _MapObjectCollectionListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_MapObjectCollectionListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension MapObjectCollectionListenerImpl on MapObjectCollectionListener {
  static final _pointerToListener = <ffi.Pointer<ffi.Void>,
      core.WeakReference<MapObjectCollectionListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<
      MapObjectCollectionListener, _MapObjectCollectionListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(
      MapObjectCollectionListener obj) {
    final ptr = _MapObjectCollectionListener_new(
        ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectCollectionListener_onMapObjectAdded),
        ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectCollectionListener_onMapObjectRemoved));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _MapObjectCollectionListenerWrapper(ptr);
    _MapObjectCollectionListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(MapObjectCollectionListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _MapObjectCollectionListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapObjectCollectionListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _MapObjectCollectionListener_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>('yandex_flutter_mapkit_map_MapObjectCollectionListener_new')
        .asFunction(isLeaf: true);

final _MapObjectCollectionListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObjectCollectionListener_free');
void _MapObjectCollectionListener_onMapObjectAdded(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> mapObject) {
  final listener =
      MapObjectCollectionListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapObjectAdded(
        mapkit_map_map_object.MapObjectImpl.fromNativePtr(mapObject));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectCollectionListener_onMapObjectRemoved(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> mapObject) {
  final listener =
      MapObjectCollectionListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapObjectRemoved(
        mapkit_map_map_object.MapObjectImpl.fromNativePtr(mapObject));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
