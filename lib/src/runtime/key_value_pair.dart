import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
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

part 'key_value_pair.containers.dart';

/// @nodoc
final class KeyValuePairNative extends ffi.Struct {
  external native_types.NativeString key;
  external native_types.NativeString value;
}

final KeyValuePairNative Function(
        native_types.NativeString, native_types.NativeString)
    _KeyValuePairNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    KeyValuePairNative Function(
                        native_types.NativeString, native_types.NativeString)>>(
            'yandex_flutter_runtime_KeyValuePair_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'KeyValuePair.toPointer',
    toPlatform: '(val) => KeyValuePair.fromPointer(val, needFree: false)')
class KeyValuePair {
  final core.String key;
  final core.String value;

  const KeyValuePair({
    required this.key,
    required this.value,
  });

  /// @nodoc
  @internal
  KeyValuePair.fromNative(KeyValuePairNative native)
      : this(
            key: to_platform.toPlatformString(native.key),
            value: to_platform.toPlatformString(native.value));

  /// @nodoc
  @internal
  static KeyValuePairNative toNative(KeyValuePair c) {
    return _KeyValuePairNativeInit(
        to_native.toNativeString(c.key), to_native.toNativeString(c.value));
  }

  /// @nodoc
  @internal
  static KeyValuePair? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = KeyValuePair.fromNative(ptr.cast<KeyValuePairNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(KeyValuePair? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<KeyValuePairNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
