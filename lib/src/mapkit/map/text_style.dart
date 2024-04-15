import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:ui' as ui;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'text_style.containers.dart';

/// @nodoc
final class TextStyleNative extends ffi.Struct {
  @ffi.Float()
  external core.double size;
  external ffi.Pointer<ffi.Void> color;
  @ffi.Float()
  external core.double outlineWidth;
  external ffi.Pointer<ffi.Void> outlineColor;
  @ffi.Int64()
  external core.int placement;
  @ffi.Float()
  external core.double offset;
  @ffi.Bool()
  external core.bool offsetFromIcon;
  @ffi.Bool()
  external core.bool textOptional;
}

final TextStyleNative Function(core.double, ffi.Pointer<ffi.Void>, core.double,
        ffi.Pointer<ffi.Void>, core.int, core.double, core.bool, core.bool)
    _TextStyleNativeInit = lib.library
        .lookup<
            ffi.NativeFunction<
                TextStyleNative Function(
                    ffi.Float,
                    ffi.Pointer<ffi.Void>,
                    ffi.Float,
                    ffi.Pointer<ffi.Void>,
                    ffi.Int64,
                    ffi.Float,
                    ffi.Bool,
                    ffi.Bool)>>('yandex_flutter_mapkit_map_TextStyle_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'TextStyle.toPointer',
    toPlatform: '(val) => TextStyle.fromPointer(val, needFree: false)')
class TextStyle {
  final core.double size;
  final ui.Color? color;
  final core.double outlineWidth;
  final ui.Color? outlineColor;
  final TextStylePlacement placement;
  final core.double offset;
  final core.bool offsetFromIcon;
  final core.bool textOptional;

  const TextStyle({
    this.size = 8.0,
    this.color,
    this.outlineWidth = 1.0,
    this.outlineColor,
    this.placement = TextStylePlacement.Center,
    this.offset = 0.0,
    this.offsetFromIcon = true,
    this.textOptional = false,
  });

  /// @nodoc
  @internal
  TextStyle.fromNative(TextStyleNative native)
      : this(
            size: native.size,
            color: to_platform.toPlatformFromPointerColor(native.color),
            outlineWidth: native.outlineWidth,
            outlineColor:
                to_platform.toPlatformFromPointerColor(native.outlineColor),
            placement: TextStylePlacement.fromInt(native.placement),
            offset: native.offset,
            offsetFromIcon: native.offsetFromIcon,
            textOptional: native.textOptional);

  /// @nodoc
  @internal
  static TextStyleNative toNative(TextStyle c) {
    return _TextStyleNativeInit(
        c.size,
        to_native.toNativePtrColor(c.color),
        c.outlineWidth,
        to_native.toNativePtrColor(c.outlineColor),
        TextStylePlacement.toInt(c.placement),
        c.offset,
        c.offsetFromIcon,
        c.textOptional);
  }

  /// @nodoc
  @internal
  static TextStyle? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = TextStyle.fromNative(ptr.cast<TextStyleNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(TextStyle? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<TextStyleNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

/// Text placement positions
@bindings_annotations.ContainerData(
    toNative: 'TextStylePlacement.toPointer',
    toPlatform: '(val) => TextStylePlacement.fromPointer(val, needFree: false)')
enum TextStylePlacement {
  Center,
  Left,
  Right,
  Top,
  Bottom,
  TopLeft,
  TopRight,
  BottomLeft,
  BottomRight,
  ;

  /// @nodoc
  @internal
  static TextStylePlacement fromInt(core.int val) {
    return TextStylePlacement.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(TextStylePlacement e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static TextStylePlacement? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(TextStylePlacement? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
