part of 'road_events_manager.dart';

@bindings_annotations.ContainerData(
    toNative: 'RoadEventsEventInfoSessionImpl.getNativePtr',
    toPlatform:
        '(val) => RoadEventsEventInfoSessionImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'RoadEventsEventInfoSession')
class RoadEventsEventInfoSessionImpl
    implements RoadEventsEventInfoSession, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_RoadEventsEventInfoSession_free.cast());

  /// @nodoc
  RoadEventsEventInfoSessionImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  RoadEventsEventInfoSessionImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(RoadEventsEventInfoSession? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as RoadEventsEventInfoSessionImpl).ptr;
  }

  @internal

  /// @nodoc
  static RoadEventsEventInfoSession? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return RoadEventsEventInfoSessionImpl.fromNativePtr(ptr);
  }

  void retry(RoadEventsEventInfoSessionEventInfoListener eventInfoListener) {
    _EventInfoSession_retry(
        ptr,
        RoadEventsEventInfoSessionEventInfoListenerImpl.getNativePtr(
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
final void Function(ffi.Pointer<ffi.Void>, core.int)
    _RoadEventsEventInfoSession_set = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_road_events_RoadEventsEventInfoSession_set_')
        .asFunction(isLeaf: true);

final class RoadEventsEventInfoSessionEventInfoListenerImpl
    implements RoadEventsEventInfoSessionEventInfoListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, RoadEventsEventInfoSessionEventInfoListener>{};

  RoadEventsEventInfoSessionEventInfoListenerImpl(
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

  @core.override
  void onEventInfoReceived(mapkit_geo_object.GeoObject event) =>
      _onEventInfoReceived(event);
  @core.override
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
    return (obj as RoadEventsEventInfoSessionEventInfoListenerImpl)._ptr;
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
                        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_road_events_EventInfoSession_RoadEventsEventInfoSessionEventInfoListener_new')
        .asFunction(isLeaf: true);

void _RoadEventsEventInfoSessionEventInfoListener_onEventInfoReceived(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> event) {
  final listener =
      RoadEventsEventInfoSessionEventInfoListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onEventInfoReceived(
        mapkit_geo_object.GeoObjectImpl.fromNativePtr(event));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

void _RoadEventsEventInfoSessionEventInfoListener_onEventInfoError(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> error) {
  final listener =
      RoadEventsEventInfoSessionEventInfoListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onEventInfoError(runtime_error.ErrorImpl.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

@bindings_annotations.ContainerData(
    toNative: 'RoadEventsManagerImpl.getNativePtr',
    toPlatform:
        '(val) => RoadEventsManagerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'RoadEventsManager')
class RoadEventsManagerImpl implements RoadEventsManager, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_RoadEventsManager_free.cast());

  /// @nodoc
  RoadEventsManagerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  RoadEventsManagerImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(RoadEventsManager? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as RoadEventsManagerImpl).ptr;
  }

  @internal

  /// @nodoc
  static RoadEventsManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return RoadEventsManagerImpl.fromNativePtr(ptr);
  }

  RoadEventsEventInfoSession requestEventInfo(
    RoadEventsEventInfoSessionEventInfoListener eventInfoListener, {
    required core.String eventId,
  }) {
    final result = _RoadEventsManager_requestEventInfo(
      ptr,
      to_native.toNativeString(eventId),
      RoadEventsEventInfoSessionEventInfoListenerImpl.getNativePtr(
          eventInfoListener),
    );
    return RoadEventsEventInfoSessionImpl.fromNativePtr(result);
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
final void Function(ffi.Pointer<ffi.Void>, core.int) _RoadEventsManager_set =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_road_events_RoadEventsManager_set_')
        .asFunction(isLeaf: true);
