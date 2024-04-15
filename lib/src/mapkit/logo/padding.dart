import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'padding.containers.dart';

/// @nodoc
final class LogoPaddingNative extends ffi.Struct {
  @ffi.Uint32()
  external core.int horizontalPadding;
  @ffi.Uint32()
  external core.int verticalPadding;
}

final LogoPaddingNative Function(core.int, core.int) _LogoPaddingNativeInit =
    lib.library
        .lookup<
            ffi.NativeFunction<
                LogoPaddingNative Function(ffi.Uint32,
                    ffi.Uint32)>>('yandex_flutter_mapkit_logo_LogoPadding_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LogoPadding.toPointer',
    toPlatform: '(val) => LogoPadding.fromPointer(val, needFree: false)')
class LogoPadding {
  final core.int horizontalPadding;
  final core.int verticalPadding;

  const LogoPadding({
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  /// @nodoc
  @internal
  LogoPadding.fromNative(LogoPaddingNative native)
      : this(
            horizontalPadding: native.horizontalPadding,
            verticalPadding: native.verticalPadding);

  /// @nodoc
  @internal
  static LogoPaddingNative toNative(LogoPadding c) {
    return _LogoPaddingNativeInit(c.horizontalPadding, c.verticalPadding);
  }

  /// @nodoc
  @internal
  static LogoPadding? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = LogoPadding.fromNative(ptr.cast<LogoPaddingNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(LogoPadding? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LogoPaddingNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
