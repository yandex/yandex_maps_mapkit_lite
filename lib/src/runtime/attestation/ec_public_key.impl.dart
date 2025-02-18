part of 'ec_public_key.dart';

@bindings_annotations.ContainerData(
    toNative: 'EcPublicKeyImpl.getNativePtr',
    toPlatform: '(val) => EcPublicKeyImpl.fromPointer(val, needFree: false)',
    platformType: 'EcPublicKey')
final class EcPublicKeyImpl extends EcPublicKey {
  EcPublicKeyImpl(typed_data.ByteBuffer affineX, typed_data.ByteBuffer affineY)
      : this.fromNativePtr(_EcPublicKey_init(to_native.toNativeBytes(affineX),
            to_native.toNativeBytes(affineY)));

  @core.override
  late final affineX =
      to_platform.toPlatformBytes(_EcPublicKey_get_affineX(_ptr));
  @core.override
  late final affineY =
      to_platform.toPlatformBytes(_EcPublicKey_get_affineY(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_EcPublicKey_free.cast());

  EcPublicKeyImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(EcPublicKey? obj) {
    return (obj as EcPublicKeyImpl?)?._ptr ?? ffi.nullptr;
  }

  static EcPublicKey? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : EcPublicKeyImpl.fromNativePtr(ptr);
  }

  static EcPublicKey? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        EcPublicKeyImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

final _EcPublicKey_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_runtime_attestation_EcPublicKey_free');

final ffi.Pointer<ffi.Void> Function(
        native_types.NativeBytes, native_types.NativeBytes) _EcPublicKey_init =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        native_types.NativeBytes, native_types.NativeBytes)>>(
            'yandex_flutter_runtime_attestation_EcPublicKey_init')
        .asFunction(isLeaf: true);

final native_types.NativeBytes Function(ffi.Pointer<ffi.Void>)
    _EcPublicKey_get_affineX = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeBytes Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_attestation_EcPublicKey_get_affineX')
        .asFunction(isLeaf: true);
final native_types.NativeBytes Function(ffi.Pointer<ffi.Void>)
    _EcPublicKey_get_affineY = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeBytes Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_attestation_EcPublicKey_get_affineY')
        .asFunction(isLeaf: true);
