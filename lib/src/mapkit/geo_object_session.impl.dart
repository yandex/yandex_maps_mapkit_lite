part of 'geo_object_session.dart';

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectSessionImpl.getNativePtr',
    toPlatform:
        '(val) => GeoObjectSessionImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'GeoObjectSession')
class GeoObjectSessionImpl implements GeoObjectSession, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_GeoObjectSession_free.cast());

  /// @nodoc
  GeoObjectSessionImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  GeoObjectSessionImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectSession? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as GeoObjectSessionImpl).ptr;
  }

  @internal

  /// @nodoc
  static GeoObjectSession? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return GeoObjectSessionImpl.fromNativePtr(ptr);
  }

  void cancel() {
    _GeoObjectSession_cancel(ptr);
  }

  void retry(GeoObjectSessionGeoObjectListener objListener) {
    _GeoObjectSession_retry(
        ptr, GeoObjectSessionGeoObjectListenerImpl.getNativePtr(objListener));
  }
}

final _GeoObjectSession_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_GeoObjectSession_free');

final void Function(ffi.Pointer<ffi.Void>) _GeoObjectSession_cancel = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_GeoObjectSession_cancel')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _GeoObjectSession_retry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObjectSession_retry')
        .asFunction();

final class GeoObjectSessionGeoObjectListenerImpl
    implements GeoObjectSessionGeoObjectListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, GeoObjectSessionGeoObjectListener>{};

  GeoObjectSessionGeoObjectListenerImpl(
      {required void Function(mapkit_geo_object.GeoObject obj)
          onGeoObjectResult,
      required void Function(runtime_error.Error error) onGeoObjectError})
      : _ptr = _GeoObjectSessionGeoObjectListener_new(
            ffi.Pointer.fromFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
                _GeoObjectSessionGeoObjectListener_onGeoObjectResult),
            ffi.Pointer.fromFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
                _GeoObjectSessionGeoObjectListener_onGeoObjectError)),
        _onGeoObjectResult = onGeoObjectResult,
        _onGeoObjectError = onGeoObjectError {
    _pointerToListener[_ptr] = this;
    _GeoObjectSessionGeoObjectListenersetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  @core.override
  void onGeoObjectResult(mapkit_geo_object.GeoObject obj) =>
      _onGeoObjectResult(obj);
  @core.override
  void onGeoObjectError(runtime_error.Error error) => _onGeoObjectError(error);

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function(mapkit_geo_object.GeoObject) _onGeoObjectResult;
  final void Function(runtime_error.Error) _onGeoObjectError;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(
      GeoObjectSessionGeoObjectListener? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as GeoObjectSessionGeoObjectListenerImpl)._ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _GeoObjectSessionGeoObjectListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_GeoObjectSession_GeoObjectSessionGeoObjectListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _GeoObjectSessionGeoObjectListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_GeoObjectSession_GeoObjectSessionGeoObjectListener_new')
        .asFunction(isLeaf: true);

void _GeoObjectSessionGeoObjectListener_onGeoObjectResult(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> obj) {
  final listener =
      GeoObjectSessionGeoObjectListenerImpl._pointerToListener[_ptr]!;

  try {
    listener
        .onGeoObjectResult(mapkit_geo_object.GeoObjectImpl.fromNativePtr(obj));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

void _GeoObjectSessionGeoObjectListener_onGeoObjectError(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> error) {
  final listener =
      GeoObjectSessionGeoObjectListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onGeoObjectError(runtime_error.ErrorImpl.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}
