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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geo_object.dart'
    as mapkit_geo_object;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;

part 'geo_object_session.containers.dart';

/// The interface for working with the session.
@bindings_annotations.ContainerData(
    toNative: 'GeoObjectSession.getNativePtr',
    toPlatform:
        '(val) => GeoObjectSession.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class GeoObjectSession implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_GeoObjectSession_free.cast());

  /// @nodoc
  GeoObjectSession.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  GeoObjectSession.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectSession? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  @internal

  /// @nodoc
  static GeoObjectSession? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return GeoObjectSession.fromNativePtr(ptr);
  }

  /// Cancels the current request.
  void cancel() {
    _GeoObjectSession_cancel(ptr);
  }

  /// Retries the last request. Cancels the current request if it is
  /// active.
  void retry(GeoObjectSessionGeoObjectListener objListener) {
    _GeoObjectSession_retry(
        ptr, GeoObjectSessionGeoObjectListener.getNativePtr(objListener));
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

class GeoObjectSessionGeoObjectListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, GeoObjectSessionGeoObjectListener>{};

  GeoObjectSessionGeoObjectListener(
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

  /// Called when a user is requesting detailed info for the specified
  /// object.
  void onGeoObjectResult(mapkit_geo_object.GeoObject obj) =>
      _onGeoObjectResult(obj);

  /// Called when an error occurs.
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
    return obj._ptr;
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
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>('yandex_flutter_mapkit_GeoObjectSession_GeoObjectSessionGeoObjectListener_new')
        .asFunction(isLeaf: true);

void _GeoObjectSessionGeoObjectListener_onGeoObjectResult(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> obj) {
  final listener = GeoObjectSessionGeoObjectListener._pointerToListener[_ptr]!;

  try {
    listener.onGeoObjectResult(mapkit_geo_object.GeoObject.fromNativePtr(obj));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

void _GeoObjectSessionGeoObjectListener_onGeoObjectError(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> error) {
  final listener = GeoObjectSessionGeoObjectListener._pointerToListener[_ptr]!;

  try {
    listener.onGeoObjectError(runtime_error.Error.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}
