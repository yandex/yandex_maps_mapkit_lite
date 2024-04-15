import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/cluster.dart'
    as mapkit_map_cluster;

/// @nodoc
class _ClusterListenerWrapper implements ffi.Finalizable {
  _ClusterListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_ClusterListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

abstract class ClusterListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<ClusterListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<ClusterListener, _ClusterListenerWrapper?>();

  /// This method is called when a new cluster is added to the collection
  /// and should customize cluster appearance based on its content.
  void onClusterAdded(mapkit_map_cluster.Cluster cluster);

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

  /// @nodoc
  @internal
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
  final listener = ClusterListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onClusterAdded(mapkit_map_cluster.Cluster.fromNativePtr(cluster));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
