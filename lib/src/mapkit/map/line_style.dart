import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:ui' as ui;
import 'package:ffi/ffi.dart';
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

part 'line_style.containers.dart';
part 'line_style.impl.dart';

/// The style of the polyline.

final class LineStyle {
  /// The stroke width in units. Default: 5. The size of a unit is equal to
  /// the size of a pixel at the current zoom level when the camera
  /// position's tilt is equal to 0 and the scale factor is equal to 1.
  final core.double strokeWidth;

  /// Maximum length (in units) of the gradient from one color to another.
  /// Default: 0.
  final core.double gradientLength;

  /// The outline color. Default: hexademical RGBA code 0x00000000.
  final ui.Color outlineColor;

  /// Width of the outline in units. Default: 0.
  final core.double outlineWidth;

  /// Enables the inner outline if true (a dark border along the edge of
  /// the outline). Default: false.
  final core.bool innerOutlineEnabled;

  /// Maximum radius of a turn. Measured in units. Default: 10.
  final core.double turnRadius;

  /// Defines step of arc approximation. Smaller values make polyline
  /// smoother. Measured in degrees. Default: 12.
  final core.double arcApproximationStep;

  /// Length of a dash in units. Default: 0 (dashing is turned off). Arrows
  /// are ignored in dashed polylines.
  final core.double dashLength;

  /// Length of the gap between two dashes in units. Default: 0 (dashing is
  /// turned off). Arrows are ignored in dashed polylines.
  final core.double gapLength;

  /// Offset from the start of the polyline to the reference dash in units.
  /// Default: 0.
  final core.double dashOffset;

  const LineStyle({
    this.strokeWidth = 5.0,
    this.gradientLength = 0.0,
    this.outlineColor = const ui.Color(0x00000000),
    this.outlineWidth = 0.0,
    this.innerOutlineEnabled = false,
    this.turnRadius = 10.0,
    this.arcApproximationStep = 12.0,
    this.dashLength = 0.0,
    this.gapLength = 0.0,
    this.dashOffset = 0.0,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([
        strokeWidth,
        gradientLength,
        outlineColor,
        outlineWidth,
        innerOutlineEnabled,
        turnRadius,
        arcApproximationStep,
        dashLength,
        gapLength,
        dashOffset
      ]);

  @core.override
  core.bool operator ==(covariant LineStyle other) {
    if (core.identical(this, other)) {
      return true;
    }
    return strokeWidth == other.strokeWidth &&
        gradientLength == other.gradientLength &&
        outlineColor == other.outlineColor &&
        outlineWidth == other.outlineWidth &&
        innerOutlineEnabled == other.innerOutlineEnabled &&
        turnRadius == other.turnRadius &&
        arcApproximationStep == other.arcApproximationStep &&
        dashLength == other.dashLength &&
        gapLength == other.gapLength &&
        dashOffset == other.dashOffset;
  }

  @core.override
  core.String toString() {
    return "LineStyle(strokeWidth: $strokeWidth, gradientLength: $gradientLength, outlineColor: $outlineColor, outlineWidth: $outlineWidth, innerOutlineEnabled: $innerOutlineEnabled, turnRadius: $turnRadius, arcApproximationStep: $arcApproximationStep, dashLength: $dashLength, gapLength: $gapLength, dashOffset: $dashOffset)";
  }
}
