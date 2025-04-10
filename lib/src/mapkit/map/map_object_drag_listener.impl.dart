part of 'map_object_drag_listener.dart';

final class _MapObjectDragListenerWrapper implements ffi.Finalizable {
  _MapObjectDragListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_MapObjectDragListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension MapObjectDragListenerImpl on MapObjectDragListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<MapObjectDragListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<MapObjectDragListener, _MapObjectDragListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(MapObjectDragListener obj) {
    final ptr = _MapObjectDragListener_new(
        ffi.Pointer.fromFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectDragListener_onMapObjectDragStart),
        ffi.Pointer.fromFunction<
            ffi.Void Function(
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                mapkit_geometry_point
                    .PointNative)>(_MapObjectDragListener_onMapObjectDrag),
        ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectDragListener_onMapObjectDragEnd));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _MapObjectDragListenerWrapper(ptr);
    _MapObjectDragListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(MapObjectDragListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _MapObjectDragListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapObjectDragListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi
            .Pointer<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _MapObjectDragListener_new = lib.library
        .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_map_MapObjectDragListener_new')
        .asFunction(isLeaf: true);

final _MapObjectDragListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObjectDragListener_free');
void _MapObjectDragListener_onMapObjectDragStart(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> mapObject) {
  final listener = MapObjectDragListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapObjectDragStart(
        mapkit_map_map_object.MapObjectImpl.fromNativePtr(mapObject));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectDragListener_onMapObjectDrag(ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> mapObject, mapkit_geometry_point.PointNative point) {
  final listener = MapObjectDragListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapObjectDrag(
        mapkit_map_map_object.MapObjectImpl.fromNativePtr(mapObject),
        mapkit_geometry_point.PointImpl.fromNative(point));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectDragListener_onMapObjectDragEnd(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> mapObject) {
  final listener = MapObjectDragListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapObjectDragEnd(
        mapkit_map_map_object.MapObjectImpl.fromNativePtr(mapObject));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
