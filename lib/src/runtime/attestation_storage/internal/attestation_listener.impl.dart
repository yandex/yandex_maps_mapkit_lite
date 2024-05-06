part of 'attestation_listener.dart';

@bindings_annotations.ContainerData(
    toNative: 'AttestationListenerImpl.getNativePtr',
    toPlatform:
        '(val) => AttestationListenerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'AttestationListener')
class AttestationListenerImpl implements AttestationListener, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_AttestationListener_free.cast());

  /// @nodoc
  AttestationListenerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  AttestationListenerImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(AttestationListener? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as AttestationListenerImpl).ptr;
  }

  @internal

  /// @nodoc
  static AttestationListener? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return AttestationListenerImpl.fromNativePtr(ptr);
  }

  void onAttestationReceived(typed_data.ByteBuffer response) {
    _AttestationListener_onAttestationReceived(
        ptr, to_native.toNativeBytes(response));
  }

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
