part of 'location_listener.dart';

final class _LocationListenerWrapper implements ffi.Finalizable {
  _LocationListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_LocationListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension LocationListenerImpl on LocationListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<LocationListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<LocationListener, _LocationListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(LocationListener obj) {
    final ptr = _LocationListener_new(
        ffi.Pointer.fromFunction<
            ffi.Void Function(
                ffi.Pointer<ffi.Void>,
                mapkit_location_location
                    .LocationNative)>(_LocationListener_onLocationUpdated),
        ffi.Pointer.fromFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>(_LocationListener_onLocationStatusUpdated));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _LocationListenerWrapper(ptr);
    _LocationListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(LocationListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _LocationListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_location_LocationListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>,
                    mapkit_location_location.LocationNative)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>)
    _LocationListener_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, mapkit_location_location.LocationNative)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>)>>('yandex_flutter_mapkit_location_LocationListener_new')
        .asFunction(isLeaf: true);

final _LocationListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationListener_free');
void _LocationListener_onLocationUpdated(ffi.Pointer<ffi.Void> _ptr,
    mapkit_location_location.LocationNative location) {
  final listener = LocationListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onLocationUpdated(
        mapkit_location_location.LocationImpl.fromNative(location));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _LocationListener_onLocationStatusUpdated(
    ffi.Pointer<ffi.Void> _ptr, core.int status) {
  final listener = LocationListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onLocationStatusUpdated(
        mapkit_location_location_status.LocationStatusImpl.fromInt(status));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
