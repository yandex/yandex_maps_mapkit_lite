import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'ec_public_key.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'EcPublicKey.toPointer',
    toPlatform: '(val) => EcPublicKey.fromPointer(val, needFree: false)')
class EcPublicKey implements ffi.Finalizable {
  late final affineX =
      to_platform.toPlatformBytes(_EcPublicKey_get_affineX(_ptr));
  late final affineY =
      to_platform.toPlatformBytes(_EcPublicKey_get_affineY(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_EcPublicKey_free.cast());

  EcPublicKey(typed_data.ByteBuffer affineX, typed_data.ByteBuffer affineY)
      : this.fromNativePtr(_EcPublicKey_init(to_native.toNativeBytes(affineX),
            to_native.toNativeBytes(affineY)));

  /// @nodoc
  @internal
  EcPublicKey.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(EcPublicKey? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static EcPublicKey? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return EcPublicKey.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static EcPublicKey? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        EcPublicKey.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(EcPublicKey? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _EcPublicKey_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _EcPublicKey_clone =
    lib
        .library
        .lookup<
                ffi
                .NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_attestation_EcPublicKey_clone')
        .asFunction(isLeaf: true);

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
