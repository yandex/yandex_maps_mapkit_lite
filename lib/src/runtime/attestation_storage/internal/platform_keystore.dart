import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
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

part 'platform_keystore.impl.dart';

///
abstract class PlatformKeystore {
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
}
