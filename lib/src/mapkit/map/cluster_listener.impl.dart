part of 'cluster_listener.dart';

final class _ClusterListenerWrapper implements ffi.Finalizable {
  _ClusterListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_ClusterListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension ClusterListenerImpl on ClusterListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<ClusterListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<ClusterListener, _ClusterListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(ClusterListener obj) {
    final ptr = _ClusterListener_new(ffi.Pointer.fromFunction<
        ffi.Void Function(ffi.Pointer<ffi.Void>,
            ffi.Pointer<ffi.Void>)>(_ClusterListener_onClusterAdded));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _ClusterListenerWrapper(ptr);
    _ClusterListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(ClusterListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _ClusterListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_ClusterListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _ClusterListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_map_ClusterListener_new')
        .asFunction(isLeaf: true);

final _ClusterListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_ClusterListener_free');
void _ClusterListener_onClusterAdded(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> cluster) {
  final listener = ClusterListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener
        .onClusterAdded(mapkit_map_cluster.ClusterImpl.fromNativePtr(cluster));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
