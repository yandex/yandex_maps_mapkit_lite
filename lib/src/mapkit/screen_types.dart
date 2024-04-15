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

part 'screen_types.containers.dart';

/// @nodoc
final class ScreenPointNative extends ffi.Struct {
  @ffi.Float()
  external core.double x;
  @ffi.Float()
  external core.double y;
}

final ScreenPointNative Function(core.double, core.double)
    _ScreenPointNativeInit = lib.library
        .lookup<
            ffi.NativeFunction<
                ScreenPointNative Function(ffi.Float,
                    ffi.Float)>>('yandex_flutter_mapkit_ScreenPoint_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ScreenPoint.toPointer',
    toPlatform: '(val) => ScreenPoint.fromPointer(val, needFree: false)')
class ScreenPoint {
  final core.double x;
  final core.double y;

  const ScreenPoint({
    required this.x,
    required this.y,
  });

  /// @nodoc
  @internal
  ScreenPoint.fromNative(ScreenPointNative native)
      : this(x: native.x, y: native.y);

  /// @nodoc
  @internal
  static ScreenPointNative toNative(ScreenPoint c) {
    return _ScreenPointNativeInit(c.x, c.y);
  }

  /// @nodoc
  @internal
  static ScreenPoint? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = ScreenPoint.fromNative(ptr.cast<ScreenPointNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(ScreenPoint? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ScreenPointNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

/// @nodoc
final class ScreenRectNative extends ffi.Struct {
  external ScreenPointNative topLeft;
  external ScreenPointNative bottomRight;
}

final ScreenRectNative Function(ScreenPointNative, ScreenPointNative)
    _ScreenRectNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    ScreenRectNative Function(
                        ScreenPointNative, ScreenPointNative)>>(
            'yandex_flutter_mapkit_ScreenRect_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ScreenRect.toPointer',
    toPlatform: '(val) => ScreenRect.fromPointer(val, needFree: false)')
class ScreenRect {
  final ScreenPoint topLeft;
  final ScreenPoint bottomRight;

  const ScreenRect(this.topLeft, this.bottomRight);

  /// @nodoc
  @internal
  ScreenRect.fromNative(ScreenRectNative native)
      : this(ScreenPoint.fromNative(native.topLeft),
            ScreenPoint.fromNative(native.bottomRight));

  /// @nodoc
  @internal
  static ScreenRectNative toNative(ScreenRect c) {
    return _ScreenRectNativeInit(
        ScreenPoint.toNative(c.topLeft), ScreenPoint.toNative(c.bottomRight));
  }

  /// @nodoc
  @internal
  static ScreenRect? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = ScreenRect.fromNative(ptr.cast<ScreenRectNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(ScreenRect? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ScreenRectNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
