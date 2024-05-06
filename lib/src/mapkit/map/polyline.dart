import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:ui' as ui;
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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/arrow.dart'
    as mapkit_map_arrow;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as mapkit_map_map_object;

part 'polyline.containers.dart';
part 'polyline.impl.dart';

/// A polyline object with adjustable segment colors. Supports outlines,
/// dash, arrows, and hiding parts of the polyline efficiently.
abstract class PolylineMapObject
    implements mapkit_map_map_object.MapObject, ffi.Finalizable {
  /// The polyline's geometry. Should contain at least 2 points. Changing
  /// geometry resets polyline color indices to 0.
  mapkit_geometry_geometry.Polyline get geometry;
  set geometry(mapkit_geometry_geometry.Polyline val);

  /// The stroke width in units. Default: 5. The size of a unit is equal to
  /// the size of a pixel at the current zoom level when the camera
  /// position's tilt is equal to 0 and the scale factor is equal to 1.
  core.double get strokeWidth;
  set strokeWidth(core.double val);

  /// Maximum length (in units) of the gradient from one color to another.
  /// Default: 0.
  core.double get gradientLength;
  set gradientLength(core.double val);

  /// The outline color. Default: hexademical RGBA code 0x00000000.
  ui.Color get outlineColor;
  set outlineColor(ui.Color val);

  /// Width of the outline in units. Default: 0.
  core.double get outlineWidth;
  set outlineWidth(core.double val);

  /// Enables the inner outline if true (a dark border along the edge of
  /// the outline). Default: false.
  core.bool get innerOutlineEnabled;
  set innerOutlineEnabled(core.bool val);

  /// Maximum radius of a turn. Measured in units. Default: 10.
  core.double get turnRadius;
  set turnRadius(core.double val);

  /// Defines step of arc approximation. Smaller values make polyline
  /// smoother. Measured in degrees. Default: 12.
  core.double get arcApproximationStep;
  set arcApproximationStep(core.double val);

  /// Length of a dash in units. Default: 0 (dashing is turned off). Arrows
  /// are ignored in dashed polylines.
  core.double get dashLength;
  set dashLength(core.double val);

  /// Length of the gap between two dashes in units. Default: 0 (dashing is
  /// turned off). Arrows are ignored in dashed polylines.
  core.double get gapLength;
  set gapLength(core.double val);

  /// Offset from the start of the polyline to the reference dash in units.
  /// Default: 0.
  core.double get dashOffset;
  set dashOffset(core.double val);

  /// Highlights a subpolyline using the specified color.
  void select(ui.Color selectionColor,
      mapkit_geometry_geometry.Subpolyline subpolyline);

  /// Hides the subpolyline, canceling any previous hides.
  void hide(mapkit_geometry_geometry.Subpolyline subpolyline);

  /// Hides multiple subpolylines, canceling any previous hides.
  void hideMultiple(
      core.List<mapkit_geometry_geometry.Subpolyline> subpolylines);

  /// Sets indexes of colors in palette for line segments. Weights are used
  /// for generalization of colors. By default, all segments use palette
  /// index 0.
  void setStrokeColorsWithWeights({
    required core.List<core.int> colors,
    required core.List<core.double> weights,
  });

  /// Sets indexes of colors in palette for line segments. All the weights
  /// are equal to 1.
  void setStrokeColors(core.List<core.int> colors);

  /// Sets color in RGBA mode for colorIndex. If the color is not provided
  /// for some index, the default value 0x0066FFFF is used.
  void setPaletteColor(
    ui.Color color, {
    required core.int colorIndex,
  });

  /// Returns the palette color for the specified index.
  ui.Color getPaletteColor(core.int colorIndex);

  /// Sets the polyline color. Effectively sets a single-color palette and
  /// sets all segments' palette indices to 0.
  void setStrokeColor(ui.Color color);

  /// Returns the palette index used by segment with the specified index.
  core.int getStrokeColor(core.int segmentIndex);

  /// Adds an arrow.
  ///
  /// [position] Coordinates of the center of the arrow.
  /// [length] Overall length of the arrow (including the tip) in units.
  /// [fillColor] Color of the arrow. Adding arrows disables dash for this
  /// polyline.
  mapkit_map_arrow.Arrow addArrow(
    mapkit_geometry_geometry.PolylinePosition position,
    ui.Color fillColor, {
    required core.double length,
  });

  /// Provides arrows.
  core.List<mapkit_map_arrow.Arrow> arrows();
}
