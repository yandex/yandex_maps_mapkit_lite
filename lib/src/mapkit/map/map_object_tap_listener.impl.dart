part of 'map_object_tap_listener.dart';

final class _MapObjectTapListenerWrapper implements ffi.Finalizable {
  _MapObjectTapListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_MapObjectTapListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension MapObjectTapListenerImpl on MapObjectTapListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<MapObjectTapListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<MapObjectTapListener, _MapObjectTapListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(MapObjectTapListener obj) {
    final ptr = _MapObjectTapListener_new(ffi.Pointer.fromFunction<
            ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
                mapkit_geometry_point.PointNative)>(
        _MapObjectTapListener_onMapObjectTap, false));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _MapObjectTapListenerWrapper(ptr);
    _MapObjectTapListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(MapObjectTapListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _MapObjectTapListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapObjectTapListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Bool Function(
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                mapkit_geometry_point
                    .PointNative)>>) _MapObjectTapListener_new = lib.library
    .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)>>)>>(
        'yandex_flutter_mapkit_map_MapObjectTapListener_new')
    .asFunction(isLeaf: true);

final _MapObjectTapListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObjectTapListener_free');
core.bool _MapObjectTapListener_onMapObjectTap(ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> mapObject, mapkit_geometry_point.PointNative point) {
  final listener = MapObjectTapListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return listener.onMapObjectTap(
        mapkit_map_map_object.MapObjectImpl.fromNativePtr(mapObject),
        mapkit_geometry_point.PointImpl.fromNative(point));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
