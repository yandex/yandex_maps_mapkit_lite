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

part 'time.containers.dart';

/// @nodoc
final class TimeNative extends ffi.Struct {
  @ffi.Int64()
  external core.int value;
  @ffi.Int()
  external core.int tzOffset;
  external native_types.NativeString text;
}

final TimeNative Function(core.int, core.int, native_types.NativeString)
    _TimeNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    TimeNative Function(
                        ffi.Int64, ffi.Int, native_types.NativeString)>>(
            'yandex_flutter_mapkit_Time_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Time.toPointer',
    toPlatform: '(val) => Time.fromPointer(val, needFree: false)')
class Time {
  final core.int value;
  final core.int tzOffset;
  final core.String text;

  const Time({
    required this.value,
    required this.tzOffset,
    required this.text,
  });

  /// @nodoc
  @internal
  Time.fromNative(TimeNative native)
      : this(
            value: native.value,
            tzOffset: native.tzOffset,
            text: to_platform.toPlatformString(native.text));

  /// @nodoc
  @internal
  static TimeNative toNative(Time c) {
    return _TimeNativeInit(
        c.value, c.tzOffset, to_native.toNativeString(c.text));
  }

  /// @nodoc
  @internal
  static Time? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Time.fromNative(ptr.cast<TimeNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Time? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<TimeNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
