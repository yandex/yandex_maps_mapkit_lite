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

part 'localized_value.containers.dart';

/// @nodoc
final class LocalizedValueNative extends ffi.Struct {
  @ffi.Double()
  external core.double value;
  external native_types.NativeString text;
}

final LocalizedValueNative Function(core.double, native_types.NativeString)
    _LocalizedValueNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    LocalizedValueNative Function(
                        ffi.Double, native_types.NativeString)>>(
            'yandex_flutter_mapkit_LocalizedValue_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LocalizedValue.toPointer',
    toPlatform: '(val) => LocalizedValue.fromPointer(val, needFree: false)')
class LocalizedValue {
  final core.double value;
  final core.String text;

  const LocalizedValue({
    required this.value,
    required this.text,
  });

  /// @nodoc
  @internal
  LocalizedValue.fromNative(LocalizedValueNative native)
      : this(
            value: native.value,
            text: to_platform.toPlatformString(native.text));

  /// @nodoc
  @internal
  static LocalizedValueNative toNative(LocalizedValue c) {
    return _LocalizedValueNativeInit(c.value, to_native.toNativeString(c.text));
  }

  /// @nodoc
  @internal
  static LocalizedValue? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        LocalizedValue.fromNative(ptr.cast<LocalizedValueNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(LocalizedValue? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LocalizedValueNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
