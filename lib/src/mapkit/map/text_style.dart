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

/// The style of placemarks's text.

final class TextStyle {
  /// Text font size in units. default: 8
  final core.double size;

  /// Text color. default: black
  ///
  final ui.Color? color;

  /// Outline width in units. default: 1
  final core.double outlineWidth;

  /// Outline color. default: white
  ///
  final ui.Color? outlineColor;

  /// Text placement position. default: Center
  final TextStylePlacement placement;

  /// Text offset in units. Measured either from point or form icon edges,
  /// depending on [TextStyle.offsetFromIcon] value Direction of the offset
  /// specified with [TextStyle.placement] property Ignored when
  /// [placement] is 'Center' default: 0
  final core.double offset;

  /// When set, [TextStyle.offset] is a padding between the text and icon
  /// edges. default: true
  final core.bool offsetFromIcon;

  /// Allow dropping text but keeping icon during conflict resolution
  /// default: false
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
