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

part 'alignment.containers.dart';

/// Horizontal logo alignment.
@bindings_annotations.ContainerData(
    toNative: 'LogoHorizontalAlignment.toPointer',
    toPlatform:
        '(val) => LogoHorizontalAlignment.fromPointer(val, needFree: false)')
enum LogoHorizontalAlignment {
  /// Left alignment.
  Left,

  /// Center alignment.
  Center,

  /// Right alignment.
  Right,
  ;

  /// @nodoc
  @internal
  static LogoHorizontalAlignment fromInt(core.int val) {
    return LogoHorizontalAlignment.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(LogoHorizontalAlignment e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static LogoHorizontalAlignment? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(LogoHorizontalAlignment? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

/// Vertical logo alignment.
@bindings_annotations.ContainerData(
    toNative: 'LogoVerticalAlignment.toPointer',
    toPlatform:
        '(val) => LogoVerticalAlignment.fromPointer(val, needFree: false)')
enum LogoVerticalAlignment {
  /// Top alignment.
  Top,

  /// Bottom alignment.
  Bottom,
  ;

  /// @nodoc
  @internal
  static LogoVerticalAlignment fromInt(core.int val) {
    return LogoVerticalAlignment.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(LogoVerticalAlignment e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static LogoVerticalAlignment? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(LogoVerticalAlignment? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

/// @nodoc
final class LogoAlignmentNative extends ffi.Struct {
  @ffi.Int64()
  external core.int horizontalAlignment;
  @ffi.Int64()
  external core.int verticalAlignment;
}

final LogoAlignmentNative Function(core.int, core.int)
    _LogoAlignmentNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    LogoAlignmentNative Function(ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_logo_LogoAlignment_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LogoAlignment.toPointer',
    toPlatform: '(val) => LogoAlignment.fromPointer(val, needFree: false)')
class LogoAlignment {
  final LogoHorizontalAlignment horizontalAlignment;
  final LogoVerticalAlignment verticalAlignment;

  const LogoAlignment(this.horizontalAlignment, this.verticalAlignment);

  /// @nodoc
  @internal
  LogoAlignment.fromNative(LogoAlignmentNative native)
      : this(LogoHorizontalAlignment.fromInt(native.horizontalAlignment),
            LogoVerticalAlignment.fromInt(native.verticalAlignment));

  /// @nodoc
  @internal
  static LogoAlignmentNative toNative(LogoAlignment c) {
    return _LogoAlignmentNativeInit(
        LogoHorizontalAlignment.toInt(c.horizontalAlignment),
        LogoVerticalAlignment.toInt(c.verticalAlignment));
  }

  /// @nodoc
  @internal
  static LogoAlignment? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        LogoAlignment.fromNative(ptr.cast<LogoAlignmentNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(LogoAlignment? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LogoAlignmentNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
