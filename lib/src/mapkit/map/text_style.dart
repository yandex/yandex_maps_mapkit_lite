import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:ui' as ui;
import 'package:ffi/ffi.dart';
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
part 'text_style.impl.dart';

final class TextStyle {
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

  @core.override
  core.int get hashCode => core.Object.hashAll([
        size,
        color,
        outlineWidth,
        outlineColor,
        placement,
        offset,
        offsetFromIcon,
        textOptional
      ]);

  @core.override
  core.bool operator ==(covariant TextStyle other) {
    if (core.identical(this, other)) {
      return true;
    }
    return size == other.size &&
        color == other.color &&
        outlineWidth == other.outlineWidth &&
        outlineColor == other.outlineColor &&
        placement == other.placement &&
        offset == other.offset &&
        offsetFromIcon == other.offsetFromIcon &&
        textOptional == other.textOptional;
  }

  @core.override
  core.String toString() {
    return "TextStyle(size: $size, color: $color, outlineWidth: $outlineWidth, outlineColor: $outlineColor, placement: $placement, offset: $offset, offsetFromIcon: $offsetFromIcon, textOptional: $textOptional)";
  }
}

/// Text placement positions
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
}
