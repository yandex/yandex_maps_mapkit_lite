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
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/camera_position.dart'
    as mapkit_map_camera_position;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/camera_update_reason.dart'
    as mapkit_map_camera_update_reason;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map.dart'
    as mapkit_map_map;

/// @nodoc
class _MapCameraListenerWrapper implements ffi.Finalizable {
  _MapCameraListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_MapCameraListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Listens for updates to the camera position.
abstract class MapCameraListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<MapCameraListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<MapCameraListener, _MapCameraListenerWrapper?>();

  /// Triggered when the camera position changed.
  ///
  /// [map] Event source.
  /// [cameraPosition] Current camera position.
  /// [cameraUpdateReason] The reason of camera update.
  /// [finished] True if the camera finished moving, false otherwise. If a
  /// movement is cancelled then cameraUpdateReason represents initiator of
  /// cancellation.
  void onCameraPositionChanged(
      mapkit_map_map.Map map,
      mapkit_map_camera_position.CameraPosition cameraPosition,
      mapkit_map_camera_update_reason.CameraUpdateReason cameraUpdateReason,
      core.bool finished);

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(MapCameraListener obj) {
    final ptr = _MapCameraListener_new(ffi.Pointer.fromFunction<
        ffi.Void Function(
            ffi.Pointer<ffi.Void>,
            ffi.Pointer<ffi.Void>,
            mapkit_map_camera_position.CameraPositionNative,
            ffi.Int64,
            ffi.Bool)>(_MapCameraListener_onCameraPositionChanged));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _MapCameraListenerWrapper(ptr);
    _MapCameraListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(MapCameraListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _MapCameraListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapCameraListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                mapkit_map_camera_position.CameraPositionNative,
                ffi.Int64,
                ffi.Bool)>>) _MapCameraListener_new = lib.library
    .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, mapkit_map_camera_position.CameraPositionNative, ffi.Int64, ffi.Bool)>>)>>(
        'yandex_flutter_mapkit_map_MapCameraListener_new')
    .asFunction(isLeaf: true);

final _MapCameraListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapCameraListener_free');
void _MapCameraListener_onCameraPositionChanged(
    ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> map,
    mapkit_map_camera_position.CameraPositionNative cameraPosition,
    core.int cameraUpdateReason,
    core.bool finished) {
  final listener = MapCameraListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onCameraPositionChanged(
        mapkit_map_map.Map.fromNativePtr(map),
        mapkit_map_camera_position.CameraPosition.fromNative(cameraPosition),
        mapkit_map_camera_update_reason.CameraUpdateReason.fromInt(
            cameraUpdateReason),
        finished);
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
