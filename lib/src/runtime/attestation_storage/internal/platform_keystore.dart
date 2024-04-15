import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/runtime/attestation/ec_public_key.dart'
    as runtime_attestation_ec_public_key;
import 'package:yandex_maps_mapkit_lite/src/runtime/attestation_storage/internal/attestation_listener.dart'
    as runtime_attestation_storage_internal_attestation_listener;

abstract class PlatformKeystore {
  static final _pointerToListener = <ffi.Pointer<ffi.Void>, PlatformKeystore>{};
  static final _listenerToPointer = <PlatformKeystore, ffi.Pointer<ffi.Void>>{};

  /// Returns true if there is a generated platform key.
  ///
  /// This method will be called on a background thread.
  core.Future<core.bool> hasKey();

  /// Generates platform key.
  ///
  /// This method will be called on a background thread.
  core.Future<void> generateKey(typed_data.ByteBuffer challenge);

  /// Removes platform key.
  ///
  /// This method will be called on a background thread.
  core.Future<void> removeKey();

  /// Get application id. For the purposes of attestation frameworks it can
  /// differ from general purpose one.
  ///
  /// This method will be called on a background thread.
  core.Future<core.String> getApplicationId();

  /// Returns platform keystore key proof. On Android it is a certificate
  /// chain, on iOS it is exported public  secondary key.
  ///
  /// This method will be called on a background thread.
  core.Future<typed_data.ByteBuffer> getKeystoreProof();

  /// Returns App Attest key id that is used for signing secondary key. Do
  /// not call on Android.
  ///
  /// This method will be called on a background thread.
  core.Future<core.String> getAppAttestKeyId();

  /// Returns AppAttest assertion for secondary key. Do not call on
  /// Android.
  ///
  /// This method will be called on a background thread.
  core.Future<typed_data.ByteBuffer> getAppAttestKeyAssertion();

  /// Returns public key information for stored key.
  ///
  /// This method will be called on a background thread.
  core.Future<runtime_attestation_ec_public_key.EcPublicKey> getEcPublicKey();

  /// Requests key attestation from service used in implementation of this
  /// interface.
  ///
  /// This method will be called on a background thread.
  core.Future<void> requestAttestKey(
    typed_data.ByteBuffer challenge,
    core.int cloudProjectNumber,
    runtime_attestation_storage_internal_attestation_listener
        .AttestationListener
        attestationListener,
  );

  /// Signs data with private key that is in the platform keystore.
  ///
  /// This method will be called on a background thread.
  core.Future<typed_data.ByteBuffer> ecSign(typed_data.ByteBuffer data);

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _PlatformKeystore_free(ptr);
    final listener = _pointerToListener[ptr];
    _listenerToPointer.remove(listener);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _renewNonExsistPointer(
      ffi.Pointer<ffi.Void> ptr) {
    if (!_PlatformKeystore_exists(ptr)) {
      final listener = _pointerToListener[ptr];
      _pointerToListener.remove(ptr);
      _listenerToPointer.remove(listener);
      return _newNativeObject(listener!);
    }
    return ptr;
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(PlatformKeystore obj) {
    final ptr = _PlatformKeystore_new(
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _PlatformKeystore_hasKey),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, native_types.NativeBytes)>(
            _PlatformKeystore_generateKey),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _PlatformKeystore_removeKey),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _PlatformKeystore_getApplicationId),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _PlatformKeystore_getKeystoreProof),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _PlatformKeystore_getAppAttestKeyId),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _PlatformKeystore_getAppAttestKeyAssertion),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(_PlatformKeystore_getEcPublicKey),
        ffi.Pointer.fromFunction<
            ffi.Void Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              native_types.NativeBytes,
              ffi.Int64,
              ffi.Pointer<ffi.Void>,
            )>(_PlatformKeystore_requestAttestKey),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, native_types.NativeBytes)>(_PlatformKeystore_ecSign));
    _pointerToListener[ptr] = obj;
    _listenerToPointer[obj] = ptr;
    _PlatformKeystoresetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createAsyncExecutePort());

    return ptr;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(PlatformKeystore? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return _renewNonExsistPointer(foundPointer);
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _PlatformKeystoresetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
                native_types.NativeBytes)>>,
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              native_types.NativeBytes,
              ffi.Int64,
              ffi.Pointer<ffi.Void>,
            )>>,
    ffi.Pointer<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
                native_types.NativeBytes)>>) _PlatformKeystore_new = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Pointer<ffi.Void> Function(
                ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, native_types.NativeBytes)>>,
                ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                ffi.Pointer<
                    ffi.NativeFunction<
                        ffi.Void Function(
                          ffi.Pointer<ffi.Void>,
                          ffi.Pointer<ffi.Void>,
                          native_types.NativeBytes,
                          ffi.Int64,
                          ffi.Pointer<ffi.Void>,
                        )>>,
                ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, native_types.NativeBytes)>>)>>('yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_new')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>) _PlatformKeystore_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_free')
    .asFunction(isLeaf: true);
final core.bool Function(ffi.Pointer<ffi.Void>) _PlatformKeystore_exists = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_exists')
    .asFunction(isLeaf: true);

void _PlatformKeystore_hasKey(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> _onResult) {
  final listener = PlatformKeystore._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }

  listener.hasKey().then(
      (result) => _PlatformKeystorehasKeyInvokeOnResult(_onResult, result),
      onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core
        .bool) _PlatformKeystorehasKeyInvokeOnResult = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_hasKey_invokeOnResult')
    .asFunction(isLeaf: true);

void _PlatformKeystore_generateKey(ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> _onResult, native_types.NativeBytes challenge) {
  final listener = PlatformKeystore._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }

  listener
      .generateKey(to_platform.toPlatformBytes(challenge))
      .then((result) => _PlatformKeystoregenerateKeyInvokeOnResult(_onResult),
          onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(
    ffi
        .Pointer<ffi.Void>) _PlatformKeystoregenerateKeyInvokeOnResult = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_generateKey_invokeOnResult')
    .asFunction(isLeaf: true);

void _PlatformKeystore_removeKey(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> _onResult) {
  final listener = PlatformKeystore._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }

  listener
      .removeKey()
      .then((result) => _PlatformKeystoreremoveKeyInvokeOnResult(_onResult),
          onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(
    ffi
        .Pointer<ffi.Void>) _PlatformKeystoreremoveKeyInvokeOnResult = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_removeKey_invokeOnResult')
    .asFunction(isLeaf: true);

void _PlatformKeystore_getApplicationId(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> _onResult) {
  final listener = PlatformKeystore._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }

  listener.getApplicationId().then(
      (result) => _PlatformKeystoregetApplicationIdInvokeOnResult(
          _onResult, to_native.toNativeString(result)), onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(
    ffi.Pointer<ffi.Void>,
    native_types
        .NativeString) _PlatformKeystoregetApplicationIdInvokeOnResult = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_getApplicationId_invokeOnResult')
    .asFunction(isLeaf: true);

void _PlatformKeystore_getKeystoreProof(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> _onResult) {
  final listener = PlatformKeystore._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }

  listener.getKeystoreProof().then(
      (result) => _PlatformKeystoregetKeystoreProofInvokeOnResult(
          _onResult, to_native.toNativeBytes(result)), onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(
    ffi.Pointer<ffi.Void>,
    native_types
        .NativeBytes) _PlatformKeystoregetKeystoreProofInvokeOnResult = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, native_types.NativeBytes)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_getKeystoreProof_invokeOnResult')
    .asFunction(isLeaf: true);

void _PlatformKeystore_getAppAttestKeyId(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> _onResult) {
  final listener = PlatformKeystore._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }

  listener.getAppAttestKeyId().then(
      (result) => _PlatformKeystoregetAppAttestKeyIdInvokeOnResult(
          _onResult, to_native.toNativeString(result)), onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(
    ffi.Pointer<ffi.Void>,
    native_types
        .NativeString) _PlatformKeystoregetAppAttestKeyIdInvokeOnResult = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_getAppAttestKeyId_invokeOnResult')
    .asFunction(isLeaf: true);

void _PlatformKeystore_getAppAttestKeyAssertion(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> _onResult) {
  final listener = PlatformKeystore._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }

  listener.getAppAttestKeyAssertion().then(
      (result) => _PlatformKeystoregetAppAttestKeyAssertionInvokeOnResult(
          _onResult, to_native.toNativeBytes(result)), onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(
    ffi.Pointer<ffi.Void>,
    native_types
        .NativeBytes) _PlatformKeystoregetAppAttestKeyAssertionInvokeOnResult = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, native_types.NativeBytes)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_getAppAttestKeyAssertion_invokeOnResult')
    .asFunction(isLeaf: true);

void _PlatformKeystore_getEcPublicKey(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> _onResult) {
  final listener = PlatformKeystore._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }

  listener.getEcPublicKey().then(
      (result) => _PlatformKeystoregetEcPublicKeyInvokeOnResult(_onResult,
          runtime_attestation_ec_public_key.EcPublicKey.getNativePtr(result)),
      onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _PlatformKeystoregetEcPublicKeyInvokeOnResult = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_getEcPublicKey_invokeOnResult')
    .asFunction(isLeaf: true);

void _PlatformKeystore_requestAttestKey(
  ffi.Pointer<ffi.Void> _ptr,
  ffi.Pointer<ffi.Void> _onResult,
  native_types.NativeBytes challenge,
  core.int cloudProjectNumber,
  ffi.Pointer<ffi.Void> attestationListener,
) {
  final listener = PlatformKeystore._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }

  listener
      .requestAttestKey(
    to_platform.toPlatformBytes(challenge),
    cloudProjectNumber,
    runtime_attestation_storage_internal_attestation_listener
        .AttestationListener.fromNativePtr(attestationListener),
  )
      .then(
          (result) =>
              _PlatformKeystorerequestAttestKeyInvokeOnResult(_onResult),
          onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(
    ffi.Pointer<
        ffi.Void>) _PlatformKeystorerequestAttestKeyInvokeOnResult = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_requestAttestKey_invokeOnResult')
    .asFunction(isLeaf: true);

void _PlatformKeystore_ecSign(ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> _onResult, native_types.NativeBytes data) {
  final listener = PlatformKeystore._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }

  listener.ecSign(to_platform.toPlatformBytes(data)).then(
      (result) => _PlatformKeystoreecSignInvokeOnResult(
          _onResult, to_native.toNativeBytes(result)), onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(
    ffi.Pointer<ffi.Void>,
    native_types
        .NativeBytes) _PlatformKeystoreecSignInvokeOnResult = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, native_types.NativeBytes)>>(
        'yandex_flutter_runtime_attestation_storage_internal_PlatformKeystore_ecSign_invokeOnResult')
    .asFunction(isLeaf: true);
