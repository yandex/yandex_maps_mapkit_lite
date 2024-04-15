import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geo_object.dart'
    as mapkit_geo_object;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;
import 'package:yandex_maps_mapkit_lite/src/runtime/network/errors.dart'
    as runtime_network_errors;

part 'road_events_manager.containers.dart';

/// Session for requesting road event info.
@bindings_annotations.ContainerData(
    toNative: 'RoadEventsEventInfoSession.getNativePtr',
    toPlatform:
        '(val) => RoadEventsEventInfoSession.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class RoadEventsEventInfoSession implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_RoadEventsEventInfoSession_free.cast());

  /// @nodoc
  RoadEventsEventInfoSession.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  RoadEventsEventInfoSession.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(RoadEventsEventInfoSession? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  @internal

  /// @nodoc
  static RoadEventsEventInfoSession? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return RoadEventsEventInfoSession.fromNativePtr(ptr);
  }

  /// One of the following errors can happen:
  /// [runtime_network_errors.NotFoundError],
  /// [runtime_network_errors.NetworkError],
  /// [runtime_network_errors.RemoteError].
  void retry(RoadEventsEventInfoSessionEventInfoListener eventInfoListener) {
    _EventInfoSession_retry(
        ptr,
        RoadEventsEventInfoSessionEventInfoListener.getNativePtr(
            eventInfoListener));
  }

  void cancel() {
    _EventInfoSession_cancel(ptr);
  }
}

final _RoadEventsEventInfoSession_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_road_events_RoadEventsEventInfoSession_free');

final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _EventInfoSession_retry = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_road_events_RoadEventsEventInfoSession_retry')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _EventInfoSession_cancel = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_road_events_RoadEventsEventInfoSession_cancel')
    .asFunction();

class RoadEventsEventInfoSessionEventInfoListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, RoadEventsEventInfoSessionEventInfoListener>{};

  RoadEventsEventInfoSessionEventInfoListener(
      {required void Function(mapkit_geo_object.GeoObject event)
          onEventInfoReceived,
      required void Function(runtime_error.Error error) onEventInfoError})
      : _ptr = _RoadEventsEventInfoSessionEventInfoListener_new(
            ffi.Pointer.fromFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
                _RoadEventsEventInfoSessionEventInfoListener_onEventInfoReceived),
            ffi.Pointer.fromFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
                _RoadEventsEventInfoSessionEventInfoListener_onEventInfoError)),
        _onEventInfoReceived = onEventInfoReceived,
        _onEventInfoError = onEventInfoError {
    _pointerToListener[_ptr] = this;
    _RoadEventsEventInfoSessionEventInfoListenersetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  void onEventInfoReceived(mapkit_geo_object.GeoObject event) =>
      _onEventInfoReceived(event);
  void onEventInfoError(runtime_error.Error error) => _onEventInfoError(error);

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function(mapkit_geo_object.GeoObject) _onEventInfoReceived;
  final void Function(runtime_error.Error) _onEventInfoError;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(
      RoadEventsEventInfoSessionEventInfoListener? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _RoadEventsEventInfoSessionEventInfoListenersetSendPort = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_road_events_EventInfoSession_RoadEventsEventInfoSessionEventInfoListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _RoadEventsEventInfoSessionEventInfoListener_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>('yandex_flutter_mapkit_road_events_EventInfoSession_RoadEventsEventInfoSessionEventInfoListener_new')
        .asFunction(isLeaf: true);

void _RoadEventsEventInfoSessionEventInfoListener_onEventInfoReceived(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> event) {
  final listener =
      RoadEventsEventInfoSessionEventInfoListener._pointerToListener[_ptr]!;

  try {
    listener
        .onEventInfoReceived(mapkit_geo_object.GeoObject.fromNativePtr(event));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

void _RoadEventsEventInfoSessionEventInfoListener_onEventInfoError(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> error) {
  final listener =
      RoadEventsEventInfoSessionEventInfoListener._pointerToListener[_ptr]!;

  try {
    listener.onEventInfoError(runtime_error.Error.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

@bindings_annotations.ContainerData(
    toNative: 'RoadEventsManager.getNativePtr',
    toPlatform:
        '(val) => RoadEventsManager.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class RoadEventsManager implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_RoadEventsManager_free.cast());

  /// @nodoc
  RoadEventsManager.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  RoadEventsManager.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(RoadEventsManager? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  @internal

  /// @nodoc
  static RoadEventsManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return RoadEventsManager.fromNativePtr(ptr);
  }

  /// Begins asynchronous request for road event info.
  ///
  /// [eventId] ID of the event to request information for.
  /// [eventInfoListener] Listener for result or error.
  RoadEventsEventInfoSession requestEventInfo(
    RoadEventsEventInfoSessionEventInfoListener eventInfoListener, {
    required core.String eventId,
  }) {
    return RoadEventsEventInfoSession.fromNativePtr(
        _RoadEventsManager_requestEventInfo(
      ptr,
      to_native.toNativeString(eventId),
      RoadEventsEventInfoSessionEventInfoListener.getNativePtr(
          eventInfoListener),
    ));
  }
}

final _RoadEventsManager_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_road_events_RoadEventsManager_free');

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    native_types.NativeString,
    ffi
        .Pointer<ffi.Void>) _RoadEventsManager_requestEventInfo = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                    native_types.NativeString, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_road_events_RoadEventsManager_requestEventInfo')
    .asFunction();
