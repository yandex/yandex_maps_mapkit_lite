import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;

part 'errors.containers.dart';

/// Server responded in unexpected way: unparsable content, wrong content
/// or unexpected HTTP code.
@bindings_annotations.WeakInterface('runtime.network.RemoteError')
@bindings_annotations.ContainerData(
    toNative: 'RemoteError.getNativePtr',
    toPlatform:
        '(val) => RemoteError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class RemoteError extends runtime_error.Error implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_RemoteError_free.cast());

  /// @nodoc
  RemoteError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  RemoteError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory RemoteError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(RemoteError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _RemoteError_check(ptr);
  }

  @internal

  /// @nodoc
  static RemoteError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return RemoteError.fromNativePtr(ptr);
  }
}

final _RemoteError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_RemoteError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _RemoteError_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_RemoteError_check')
    .asFunction(isLeaf: true);

/// Client request is invalid (server returned the 400 'Bad Request'
/// response).
@bindings_annotations.WeakInterface('runtime.network.BadRequestError')
@bindings_annotations.ContainerData(
    toNative: 'BadRequestError.getNativePtr',
    toPlatform:
        '(val) => BadRequestError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class BadRequestError extends RemoteError implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_BadRequestError_free.cast());

  /// @nodoc
  BadRequestError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  BadRequestError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory BadRequestError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(BadRequestError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _BadRequestError_check(ptr);
  }

  @internal

  /// @nodoc
  static BadRequestError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return BadRequestError.fromNativePtr(ptr);
  }
}

final _BadRequestError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_BadRequestError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _BadRequestError_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_BadRequestError_check')
    .asFunction(isLeaf: true);

/// Requested object has not been found. Most likely, your link is
/// outdated or the object has been deleted.
@bindings_annotations.WeakInterface('runtime.network.NotFoundError')
@bindings_annotations.ContainerData(
    toNative: 'NotFoundError.getNativePtr',
    toPlatform:
        '(val) => NotFoundError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class NotFoundError extends RemoteError implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_NotFoundError_free.cast());

  /// @nodoc
  NotFoundError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  NotFoundError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory NotFoundError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(NotFoundError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _NotFoundError_check(ptr);
  }

  @internal

  /// @nodoc
  static NotFoundError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return NotFoundError.fromNativePtr(ptr);
  }
}

final _NotFoundError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_NotFoundError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _NotFoundError_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_NotFoundError_check')
    .asFunction(isLeaf: true);

/// Request entity is too large.
@bindings_annotations
    .WeakInterface('runtime.network.RequestEntityTooLargeError')
@bindings_annotations.ContainerData(
    toNative: 'RequestEntityTooLargeError.getNativePtr',
    toPlatform:
        '(val) => RequestEntityTooLargeError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class RequestEntityTooLargeError extends RemoteError
    implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_RequestEntityTooLargeError_free.cast());

  /// @nodoc
  RequestEntityTooLargeError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  RequestEntityTooLargeError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory RequestEntityTooLargeError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(RequestEntityTooLargeError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _RequestEntityTooLargeError_check(ptr);
  }

  @internal

  /// @nodoc
  static RequestEntityTooLargeError? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return RequestEntityTooLargeError.fromNativePtr(ptr);
  }
}

final _RequestEntityTooLargeError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_RequestEntityTooLargeError_free');
final core.bool Function(ffi.Pointer<ffi.Void>)
    _RequestEntityTooLargeError_check = lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_network_RequestEntityTooLargeError_check')
        .asFunction(isLeaf: true);

/// You are not allowed to access the requested object.
@bindings_annotations.WeakInterface('runtime.network.ForbiddenError')
@bindings_annotations.ContainerData(
    toNative: 'ForbiddenError.getNativePtr',
    toPlatform:
        '(val) => ForbiddenError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class ForbiddenError extends RemoteError implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_ForbiddenError_free.cast());

  /// @nodoc
  ForbiddenError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  ForbiddenError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory ForbiddenError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(ForbiddenError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _ForbiddenError_check(ptr);
  }

  @internal

  /// @nodoc
  static ForbiddenError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return ForbiddenError.fromNativePtr(ptr);
  }
}

final _ForbiddenError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_ForbiddenError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _ForbiddenError_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_ForbiddenError_check')
    .asFunction(isLeaf: true);

/// You do not have a valid MapKit API key.
@bindings_annotations.WeakInterface('runtime.network.UnauthorizedError')
@bindings_annotations.ContainerData(
    toNative: 'UnauthorizedError.getNativePtr',
    toPlatform:
        '(val) => UnauthorizedError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class UnauthorizedError extends RemoteError implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_UnauthorizedError_free.cast());

  /// @nodoc
  UnauthorizedError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  UnauthorizedError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory UnauthorizedError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(UnauthorizedError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _UnauthorizedError_check(ptr);
  }

  @internal

  /// @nodoc
  static UnauthorizedError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UnauthorizedError.fromNativePtr(ptr);
  }
}

final _UnauthorizedError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_UnauthorizedError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _UnauthorizedError_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_UnauthorizedError_check')
    .asFunction(isLeaf: true);

/// Failed to retrieve data due to network instability.
@bindings_annotations.WeakInterface('runtime.network.NetworkError')
@bindings_annotations.ContainerData(
    toNative: 'NetworkError.getNativePtr',
    toPlatform:
        '(val) => NetworkError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class NetworkError extends runtime_error.Error implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_NetworkError_free.cast());

  /// @nodoc
  NetworkError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  NetworkError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory NetworkError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(NetworkError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _NetworkError_check(ptr);
  }

  @internal

  /// @nodoc
  static NetworkError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return NetworkError.fromNativePtr(ptr);
  }
}

final _NetworkError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_NetworkError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _NetworkError_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_NetworkError_check')
    .asFunction(isLeaf: true);
