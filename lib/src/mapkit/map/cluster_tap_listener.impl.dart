part of 'cluster_tap_listener.dart';

final class _ClusterTapListenerWrapper implements ffi.Finalizable {
  _ClusterTapListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_ClusterTapListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension ClusterTapListenerImpl on ClusterTapListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<ClusterTapListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<ClusterTapListener, _ClusterTapListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(ClusterTapListener obj) {
    final ptr = _ClusterTapListener_new(ffi.Pointer.fromFunction<
            ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
        _ClusterTapListener_onClusterTap, false));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _ClusterTapListenerWrapper(ptr);
    _ClusterTapListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(ClusterTapListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _ClusterTapListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_ClusterTapListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _ClusterTapListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_map_ClusterTapListener_new')
        .asFunction(isLeaf: true);

final _ClusterTapListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_ClusterTapListener_free');
core.bool _ClusterTapListener_onClusterTap(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> cluster) {
  final listener = ClusterTapListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return listener
        .onClusterTap(mapkit_map_cluster.ClusterImpl.fromNativePtr(cluster));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
