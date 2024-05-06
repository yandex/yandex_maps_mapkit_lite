part of 'region_list_updates_listener.dart';

final class _OfflineMapRegionListUpdatesListenerWrapper
    implements ffi.Finalizable {
  _OfflineMapRegionListUpdatesListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_OfflineMapRegionListUpdatesListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension OfflineMapRegionListUpdatesListenerImpl
    on OfflineMapRegionListUpdatesListener {
  static final _pointerToListener = <ffi.Pointer<ffi.Void>,
      core.WeakReference<OfflineMapRegionListUpdatesListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<
      OfflineMapRegionListUpdatesListener,
      _OfflineMapRegionListUpdatesListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(
      OfflineMapRegionListUpdatesListener obj) {
    final ptr = _OfflineMapRegionListUpdatesListener_new(
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
            _OfflineMapRegionListUpdatesListener_onListUpdated));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _OfflineMapRegionListUpdatesListenerWrapper(ptr);
    _OfflineMapRegionListUpdatesListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(
      OfflineMapRegionListUpdatesListener? obj) {
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
        .int) _OfflineMapRegionListUpdatesListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineMapRegionListUpdatesListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)
    _OfflineMapRegionListUpdatesListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineMapRegionListUpdatesListener_new')
        .asFunction(isLeaf: true);

final _OfflineMapRegionListUpdatesListener_free = lib.library.lookup<
        ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
    'yandex_flutter_mapkit_offline_cache_OfflineMapRegionListUpdatesListener_free');
void _OfflineMapRegionListUpdatesListener_onListUpdated(
    ffi.Pointer<ffi.Void> _ptr) {
  final listener =
      OfflineMapRegionListUpdatesListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onListUpdated();
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
