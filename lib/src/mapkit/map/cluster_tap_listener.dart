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
class _ClusterTapListenerWrapper implements ffi.Finalizable {
  _ClusterTapListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_ClusterTapListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

abstract class ClusterTapListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<ClusterTapListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<ClusterTapListener, _ClusterTapListenerWrapper?>();

  /// Called when cluster is tapped. Return true if the event was handled.
  /// Otherwise it will be passed to underlying objects.
  core.bool onClusterTap(mapkit_map_cluster.Cluster cluster);

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

  /// @nodoc
  @internal
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
  final listener = ClusterTapListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return listener
        .onClusterTap(mapkit_map_cluster.Cluster.fromNativePtr(cluster));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
