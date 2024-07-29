part of 'errors.dart';

@bindings_annotations.WeakInterface('runtime.network.RemoteError')
@bindings_annotations.ContainerData(
    toNative: 'RemoteErrorImpl.getNativePtr',
    toPlatform:
        '(val) => RemoteErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'RemoteError')
class RemoteErrorImpl extends runtime_error.ErrorImpl
    implements RemoteError, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_RemoteError_free.cast());

  /// @nodoc
  RemoteErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  RemoteErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory RemoteErrorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(RemoteError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as RemoteErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _RemoteError_check(ptr);
  }

  @internal

  /// @nodoc
  static RemoteError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return RemoteErrorImpl.fromNativePtr(ptr);
  }
}

final _RemoteError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_RemoteError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _RemoteError_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_network_RemoteError_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, core.int) _RemoteError_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_runtime_network_RemoteError_set_')
    .asFunction(isLeaf: true);

@bindings_annotations.WeakInterface('runtime.network.BadRequestError')
@bindings_annotations.ContainerData(
    toNative: 'BadRequestErrorImpl.getNativePtr',
    toPlatform:
        '(val) => BadRequestErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'BadRequestError')
class BadRequestErrorImpl extends RemoteErrorImpl
    implements BadRequestError, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_BadRequestError_free.cast());

  /// @nodoc
  BadRequestErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  BadRequestErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory BadRequestErrorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(BadRequestError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as BadRequestErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _BadRequestError_check(ptr);
  }

  @internal

  /// @nodoc
  static BadRequestError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return BadRequestErrorImpl.fromNativePtr(ptr);
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

final void Function(ffi.Pointer<ffi.Void>, core.int) _BadRequestError_set = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
        'yandex_flutter_runtime_network_BadRequestError_set_')
    .asFunction(isLeaf: true);

@bindings_annotations.WeakInterface('runtime.network.NotFoundError')
@bindings_annotations.ContainerData(
    toNative: 'NotFoundErrorImpl.getNativePtr',
    toPlatform:
        '(val) => NotFoundErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'NotFoundError')
class NotFoundErrorImpl extends RemoteErrorImpl
    implements NotFoundError, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_NotFoundError_free.cast());

  /// @nodoc
  NotFoundErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  NotFoundErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory NotFoundErrorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(NotFoundError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as NotFoundErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _NotFoundError_check(ptr);
  }

  @internal

  /// @nodoc
  static NotFoundError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return NotFoundErrorImpl.fromNativePtr(ptr);
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

final void Function(ffi.Pointer<ffi.Void>, core.int) _NotFoundError_set = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
        'yandex_flutter_runtime_network_NotFoundError_set_')
    .asFunction(isLeaf: true);

@bindings_annotations
    .WeakInterface('runtime.network.RequestEntityTooLargeError')
@bindings_annotations.ContainerData(
    toNative: 'RequestEntityTooLargeErrorImpl.getNativePtr',
    toPlatform:
        '(val) => RequestEntityTooLargeErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'RequestEntityTooLargeError')
class RequestEntityTooLargeErrorImpl extends RemoteErrorImpl
    implements RequestEntityTooLargeError, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_RequestEntityTooLargeError_free.cast());

  /// @nodoc
  RequestEntityTooLargeErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  RequestEntityTooLargeErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory RequestEntityTooLargeErrorImpl.fromNativePtr(
          ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(RequestEntityTooLargeError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as RequestEntityTooLargeErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _RequestEntityTooLargeError_check(ptr);
  }

  @internal

  /// @nodoc
  static RequestEntityTooLargeError? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return RequestEntityTooLargeErrorImpl.fromNativePtr(ptr);
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

final void Function(ffi.Pointer<ffi.Void>, core.int)
    _RequestEntityTooLargeError_set = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_runtime_network_RequestEntityTooLargeError_set_')
        .asFunction(isLeaf: true);

@bindings_annotations.WeakInterface('runtime.network.ForbiddenError')
@bindings_annotations.ContainerData(
    toNative: 'ForbiddenErrorImpl.getNativePtr',
    toPlatform:
        '(val) => ForbiddenErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'ForbiddenError')
class ForbiddenErrorImpl extends RemoteErrorImpl
    implements ForbiddenError, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_ForbiddenError_free.cast());

  /// @nodoc
  ForbiddenErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  ForbiddenErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory ForbiddenErrorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(ForbiddenError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as ForbiddenErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _ForbiddenError_check(ptr);
  }

  @internal

  /// @nodoc
  static ForbiddenError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return ForbiddenErrorImpl.fromNativePtr(ptr);
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

final void Function(ffi.Pointer<ffi.Void>, core.int) _ForbiddenError_set = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
        'yandex_flutter_runtime_network_ForbiddenError_set_')
    .asFunction(isLeaf: true);

@bindings_annotations.WeakInterface('runtime.network.UnauthorizedError')
@bindings_annotations.ContainerData(
    toNative: 'UnauthorizedErrorImpl.getNativePtr',
    toPlatform:
        '(val) => UnauthorizedErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'UnauthorizedError')
class UnauthorizedErrorImpl extends RemoteErrorImpl
    implements UnauthorizedError, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_UnauthorizedError_free.cast());

  /// @nodoc
  UnauthorizedErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  UnauthorizedErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory UnauthorizedErrorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(UnauthorizedError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as UnauthorizedErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _UnauthorizedError_check(ptr);
  }

  @internal

  /// @nodoc
  static UnauthorizedError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UnauthorizedErrorImpl.fromNativePtr(ptr);
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

final void Function(ffi.Pointer<ffi.Void>, core.int) _UnauthorizedError_set =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_runtime_network_UnauthorizedError_set_')
        .asFunction(isLeaf: true);

@bindings_annotations.WeakInterface('runtime.network.NetworkError')
@bindings_annotations.ContainerData(
    toNative: 'NetworkErrorImpl.getNativePtr',
    toPlatform:
        '(val) => NetworkErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'NetworkError')
class NetworkErrorImpl extends runtime_error.ErrorImpl
    implements NetworkError, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_NetworkError_free.cast());

  /// @nodoc
  NetworkErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  NetworkErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory NetworkErrorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(NetworkError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as NetworkErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _NetworkError_check(ptr);
  }

  @internal

  /// @nodoc
  static NetworkError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return NetworkErrorImpl.fromNativePtr(ptr);
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

final void Function(ffi.Pointer<ffi.Void>, core.int) _NetworkError_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_runtime_network_NetworkError_set_')
    .asFunction(isLeaf: true);
