part of 'account.dart';

extension PasswordRequiredDataImpl on PasswordRequiredData {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, PasswordRequiredData>{};
  static final _listenerToPointer =
      <PasswordRequiredData, ffi.Pointer<ffi.Void>>{};

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _PasswordRequiredData_free(ptr);
    final listener = _pointerToListener[ptr];
    _listenerToPointer.remove(listener);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _renewNonExsistPointer(
      ffi.Pointer<ffi.Void> ptr) {
    if (!_PasswordRequiredData_exists(ptr)) {
      final listener = _pointerToListener[ptr];
      _pointerToListener.remove(ptr);
      _listenerToPointer.remove(listener);
      return _newNativeObject(listener!);
    }
    return ptr;
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(PasswordRequiredData obj) {
    final ptr = _PasswordRequiredData_new();
    _pointerToListener[ptr] = obj;
    _listenerToPointer[obj] = ptr;
    _PasswordRequiredDatasetSendPort(
        ptr, nativeBinding.createPortWithCallback(_destructor));

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(PasswordRequiredData? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return _renewNonExsistPointer(foundPointer);
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int)
    _PasswordRequiredDatasetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_runtime_auth_PasswordRequiredData_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function() _PasswordRequiredData_new = lib.library
    .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function()>>(
        'yandex_flutter_runtime_auth_PasswordRequiredData_new')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>) _PasswordRequiredData_free = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_auth_PasswordRequiredData_free')
    .asFunction(isLeaf: true);
final core.bool Function(ffi.Pointer<ffi.Void>) _PasswordRequiredData_exists =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_auth_PasswordRequiredData_exists')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'TokenListenerImpl.getNativePtr',
    toPlatform:
        '(val) => TokenListenerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'TokenListener')
class TokenListenerImpl implements TokenListener, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_TokenListener_free.cast());

  /// @nodoc
  TokenListenerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  TokenListenerImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(TokenListener? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as TokenListenerImpl).ptr;
  }

  @internal

  /// @nodoc
  static TokenListener? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return TokenListenerImpl.fromNativePtr(ptr);
  }

  void onTokenReceived(core.String token) {
    _TokenListener_onTokenReceived(ptr, to_native.toNativeString(token));
  }

  void onPasswordRequired(PasswordRequiredData data) {
    _TokenListener_onPasswordRequired(
        ptr, PasswordRequiredDataImpl.getNativePtr(data));
  }

  void onTokenRefreshFailed(core.String message) {
    _TokenListener_onTokenRefreshFailed(ptr, to_native.toNativeString(message));
  }
}

final _TokenListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_auth_TokenListener_free');

final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _TokenListener_onTokenReceived = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_runtime_auth_TokenListener_onTokenReceived')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _TokenListener_onPasswordRequired = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_auth_TokenListener_onPasswordRequired')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _TokenListener_onTokenRefreshFailed = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_runtime_auth_TokenListener_onTokenRefreshFailed')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _TokenListener_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_runtime_auth_TokenListener_set_')
    .asFunction(isLeaf: true);

extension AccountImpl on Account {
  static final _pointerToListener = <ffi.Pointer<ffi.Void>, Account>{};
  static final _listenerToPointer = <Account, ffi.Pointer<ffi.Void>>{};

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _Account_free(ptr);
    final listener = _pointerToListener[ptr];
    _listenerToPointer.remove(listener);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _renewNonExsistPointer(
      ffi.Pointer<ffi.Void> ptr) {
    if (!_Account_exists(ptr)) {
      final listener = _pointerToListener[ptr];
      _pointerToListener.remove(ptr);
      _listenerToPointer.remove(listener);
      return _newNativeObject(listener!);
    }
    return ptr;
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(Account obj) {
    final ptr = _Account_new(
        ffi.Pointer.fromFunction<
            native_types.NativeString Function(
                ffi.Pointer<ffi.Void>)>(_Account_uid),
        ffi.Pointer.fromFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>)>(_Account_requestToken),
        ffi.Pointer.fromFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                native_types.NativeString)>(_Account_invalidateToken),
        ffi.Pointer.fromFunction<
            ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                native_types.NativeString)>(_Account_httpAuth));
    _pointerToListener[ptr] = obj;
    _listenerToPointer[obj] = ptr;
    _AccountsetSendPort(ptr, nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(Account? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return _renewNonExsistPointer(foundPointer);
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _AccountsetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_runtime_auth_Account_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)>>, ffi.Pointer<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>, native_types.NativeString)>>)
    _Account_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<
                        ffi.NativeFunction<
                            native_types.NativeString Function(
                                ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<
                        ffi.NativeFunction<
                            ffi.Void Function(
                                ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>, native_types.NativeString)>>)>>('yandex_flutter_runtime_auth_Account_new')
        .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>) _Account_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_auth_Account_free')
    .asFunction(isLeaf: true);
final core.bool Function(ffi.Pointer<ffi.Void>) _Account_exists = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_auth_Account_exists')
    .asFunction(isLeaf: true);

native_types.NativeString _Account_uid(ffi.Pointer<ffi.Void> _ptr) {
  final listener = AccountImpl._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return to_native.toNativeString(listener.uid());
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _Account_requestToken(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> tokenListener) {
  final listener = AccountImpl._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.requestToken(TokenListenerImpl.fromNativePtr(tokenListener));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _Account_invalidateToken(
    ffi.Pointer<ffi.Void> _ptr, native_types.NativeString token) {
  final listener = AccountImpl._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.invalidateToken(to_platform.toPlatformString(token));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

ffi.Pointer<ffi.Void> _Account_httpAuth(
    ffi.Pointer<ffi.Void> _ptr, native_types.NativeString token) {
  final listener = AccountImpl._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return to_native.toNativePtrString(
        listener.httpAuth(to_platform.toPlatformString(token)));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
