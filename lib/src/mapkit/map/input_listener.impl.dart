part of 'input_listener.dart';

final class _MapInputListenerWrapper implements ffi.Finalizable {
  _MapInputListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_MapInputListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension MapInputListenerImpl on MapInputListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<MapInputListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<MapInputListener, _MapInputListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(MapInputListener obj) {
    final ptr = _MapInputListener_new(
        ffi.Pointer.fromFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
                mapkit_geometry_point.PointNative)>(_MapInputListener_onMapTap),
        ffi.Pointer.fromFunction<
            ffi.Void Function(
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                mapkit_geometry_point
                    .PointNative)>(_MapInputListener_onMapLongTap));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _MapInputListenerWrapper(ptr);
    _MapInputListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(MapInputListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _MapInputListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapInputListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)>>)
    _MapInputListener_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)>>)>>('yandex_flutter_mapkit_map_MapInputListener_new')
        .asFunction(isLeaf: true);

final _MapInputListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapInputListener_free');
void _MapInputListener_onMapTap(ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> map, mapkit_geometry_point.PointNative point) {
  final listener = MapInputListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapTap(mapkit_map_map.MapImpl.fromNativePtr(map),
        mapkit_geometry_point.PointImpl.fromNative(point));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapInputListener_onMapLongTap(ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> map, mapkit_geometry_point.PointNative point) {
  final listener = MapInputListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapLongTap(mapkit_map_map.MapImpl.fromNativePtr(map),
        mapkit_geometry_point.PointImpl.fromNative(point));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
