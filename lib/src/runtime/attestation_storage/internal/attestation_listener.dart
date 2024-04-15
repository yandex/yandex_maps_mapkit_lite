import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'attestation_listener.containers.dart';

///
@bindings_annotations.ContainerData(
    toNative: 'AttestationListener.getNativePtr',
    toPlatform:
        '(val) => AttestationListener.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class AttestationListener implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_AttestationListener_free.cast());

  /// @nodoc
  AttestationListener.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  AttestationListener.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(AttestationListener? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  @internal

  /// @nodoc
  static AttestationListener? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return AttestationListener.fromNativePtr(ptr);
  }

  /// Attestation was received.
  ///
  /// This method will be called on a background thread.
  void onAttestationReceived(typed_data.ByteBuffer response) {
    _AttestationListener_onAttestationReceived(
        ptr, to_native.toNativeBytes(response));
  }

  /// An error occurred during Attestation request.
  ///
  /// This method will be called on a background thread.
  void onAttestationFailed(core.String message) {
    _AttestationListener_onAttestationFailed(
        ptr, to_native.toNativeString(message));
  }
}

final _AttestationListener_free = lib.library.lookup<
        ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
    'yandex_flutter_runtime_attestation_storage_internal_AttestationListener_free');

final void Function(
    ffi.Pointer<ffi.Void>,
    native_types
        .NativeBytes) _AttestationListener_onAttestationReceived = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, native_types.NativeBytes)>>(
        'yandex_flutter_runtime_attestation_storage_internal_AttestationListener_onAttestationReceived')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    native_types
        .NativeString) _AttestationListener_onAttestationFailed = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
        'yandex_flutter_runtime_attestation_storage_internal_AttestationListener_onAttestationFailed')
    .asFunction();
