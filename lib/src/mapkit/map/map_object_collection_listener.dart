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
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as mapkit_map_map_object;

/// @nodoc
class _MapObjectCollectionListenerWrapper implements ffi.Finalizable {
  _MapObjectCollectionListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_MapObjectCollectionListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// The map object collection can't be modified in callbacks. A
/// runtime::RuntimeError exception is thrown if this happens.
abstract class MapObjectCollectionListener {
  static final _pointerToListener = <ffi.Pointer<ffi.Void>,
      core.WeakReference<MapObjectCollectionListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<
      MapObjectCollectionListener, _MapObjectCollectionListenerWrapper?>();

  /// Called every time a new map object is added to the collection.
  void onMapObjectAdded(mapkit_map_map_object.MapObject mapObject);

  /// Called every time a map object is removed from the collection.
  void onMapObjectRemoved(mapkit_map_map_object.MapObject mapObject);

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

  /// @nodoc
  @internal
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
  final listener = MapObjectCollectionListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapObjectAdded(
        mapkit_map_map_object.MapObject.fromNativePtr(mapObject));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectCollectionListener_onMapObjectRemoved(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> mapObject) {
  final listener = MapObjectCollectionListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMapObjectRemoved(
        mapkit_map_map_object.MapObject.fromNativePtr(mapObject));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
