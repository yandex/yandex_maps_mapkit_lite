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

/// A polyline object with adjustable segment colors. Supports outlines,
/// dash, arrows, and hiding parts of the polyline efficiently.
@bindings_annotations.WeakInterface('mapkit.map.PolylineMapObject')
@bindings_annotations.ContainerData(
    toNative: 'PolylineMapObject.getNativePtr',
    toPlatform:
        '(val) => PolylineMapObject.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class PolylineMapObject extends mapkit_map_map_object.MapObject
    implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_PolylineMapObject_free.cast());

  /// @nodoc
  PolylineMapObject.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  PolylineMapObject.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PolylineMapObject.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PolylineMapObject? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _PolylineMapObject_check(ptr);
  }

  @internal

  /// @nodoc
  static PolylineMapObject? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PolylineMapObject.fromNativePtr(ptr);
  }

  /// The polyline's geometry. Should contain at least 2 points. Changing
  /// geometry resets polyline color indices to 0.
  mapkit_geometry_geometry.Polyline get geometry {
    return mapkit_geometry_geometry.Polyline.fromNativePtr(
        _PolylineMapObject_get_geometry(ptr));
  }

  set geometry(mapkit_geometry_geometry.Polyline val) {
    return _PolylineMapObject_set_geometry(
        ptr, mapkit_geometry_geometry.Polyline.getNativePtr(val));
  }

  /// The stroke width in units. Default: 5. The size of a unit is equal to
  /// the size of a pixel at the current zoom level when the camera
  /// position's tilt is equal to 0 and the scale factor is equal to 1.
  core.double get strokeWidth {
    return _PolylineMapObject_get_strokeWidth(ptr);
  }

  set strokeWidth(core.double val) {
    return _PolylineMapObject_set_strokeWidth(ptr, val);
  }

  /// Maximum length (in units) of the gradient from one color to another.
  /// Default: 0.
  core.double get gradientLength {
    return _PolylineMapObject_get_gradientLength(ptr);
  }

  set gradientLength(core.double val) {
    return _PolylineMapObject_set_gradientLength(ptr, val);
  }

  /// The outline color. Default: hexademical RGBA code 0x00000000.
  ui.Color get outlineColor {
    return to_platform
        .toPlatformColor(_PolylineMapObject_get_outlineColor(ptr));
  }

  set outlineColor(ui.Color val) {
    return _PolylineMapObject_set_outlineColor(
        ptr, to_native.toNativeColor(val));
  }

  /// Width of the outline in units. Default: 0.
  core.double get outlineWidth {
    return _PolylineMapObject_get_outlineWidth(ptr);
  }

  set outlineWidth(core.double val) {
    return _PolylineMapObject_set_outlineWidth(ptr, val);
  }

  /// Enables the inner outline if true (a dark border along the edge of
  /// the outline). Default: false.
  core.bool get innerOutlineEnabled {
    return _PolylineMapObject_get_innerOutlineEnabled(ptr);
  }

  set innerOutlineEnabled(core.bool val) {
    return _PolylineMapObject_set_innerOutlineEnabled(ptr, val);
  }

  /// Maximum radius of a turn. Measured in units. Default: 10.
  core.double get turnRadius {
    return _PolylineMapObject_get_turnRadius(ptr);
  }

  set turnRadius(core.double val) {
    return _PolylineMapObject_set_turnRadius(ptr, val);
  }

  /// Defines step of arc approximation. Smaller values make polyline
  /// smoother. Measured in degrees. Default: 12.
  core.double get arcApproximationStep {
    return _PolylineMapObject_get_arcApproximationStep(ptr);
  }

  set arcApproximationStep(core.double val) {
    return _PolylineMapObject_set_arcApproximationStep(ptr, val);
  }

  /// Length of a dash in units. Default: 0 (dashing is turned off). Arrows
  /// are ignored in dashed polylines.
  core.double get dashLength {
    return _PolylineMapObject_get_dashLength(ptr);
  }

  set dashLength(core.double val) {
    return _PolylineMapObject_set_dashLength(ptr, val);
  }

  /// Length of the gap between two dashes in units. Default: 0 (dashing is
  /// turned off). Arrows are ignored in dashed polylines.
  core.double get gapLength {
    return _PolylineMapObject_get_gapLength(ptr);
  }

  set gapLength(core.double val) {
    return _PolylineMapObject_set_gapLength(ptr, val);
  }

  /// Offset from the start of the polyline to the reference dash in units.
  /// Default: 0.
  core.double get dashOffset {
    return _PolylineMapObject_get_dashOffset(ptr);
  }

  set dashOffset(core.double val) {
    return _PolylineMapObject_set_dashOffset(ptr, val);
  }

  /// Highlights a subpolyline using the specified color.
  void select(ui.Color selectionColor,
      mapkit_geometry_geometry.Subpolyline subpolyline) {
    _PolylineMapObject_select(ptr, to_native.toNativeColor(selectionColor),
        mapkit_geometry_geometry.Subpolyline.toNative(subpolyline));
  }

  /// Hides the subpolyline, canceling any previous hides.
  void hide(mapkit_geometry_geometry.Subpolyline subpolyline) {
    _PolylineMapObject_hide(
        ptr, mapkit_geometry_geometry.Subpolyline.toNative(subpolyline));
  }

  /// Hides multiple subpolylines, canceling any previous hides.
  void hideMultiple(
      core.List<mapkit_geometry_geometry.Subpolyline> subpolylines) {
    _PolylineMapObject_hideMultiple(
        ptr,
        mapkit_geometry_geometry.SubpolylineContainerExtension.toNativeVector(
            subpolylines));
  }

  /// Sets indexes of colors in palette for line segments. Weights are used
  /// for generalization of colors. By default, all segments use palette
  /// index 0.
  void setStrokeColorsWithWeights({
    required core.List<core.int> colors,
    required core.List<core.double> weights,
  }) {
    _PolylineMapObject_setStrokeColorsWithWeights(
        ptr,
        to_native.toNativeVectorUint32(colors),
        to_native.toNativeVectorDouble(weights));
  }

  /// Sets indexes of colors in palette for line segments. All the weights
  /// are equal to 1.
  void setStrokeColors(core.List<core.int> colors) {
    _PolylineMapObject_setStrokeColors(
        ptr, to_native.toNativeVectorUint32(colors));
  }

  /// Sets color in RGBA mode for colorIndex. If the color is not provided
  /// for some index, the default value 0x0066FFFF is used.
  void setPaletteColor(
    ui.Color color, {
    required core.int colorIndex,
  }) {
    _PolylineMapObject_setPaletteColor(
      ptr,
      colorIndex,
      to_native.toNativeColor(color),
    );
  }

  /// Returns the palette color for the specified index.
  ui.Color getPaletteColor(core.int colorIndex) {
    return to_platform
        .toPlatformColor(_PolylineMapObject_getPaletteColor(ptr, colorIndex));
  }

  /// Sets the polyline color. Effectively sets a single-color palette and
  /// sets all segments' palette indices to 0.
  void setStrokeColor(ui.Color color) {
    _PolylineMapObject_setStrokeColor(ptr, to_native.toNativeColor(color));
  }

  /// Returns the palette index used by segment with the specified index.
  core.int getStrokeColor(core.int segmentIndex) {
    return _PolylineMapObject_getStrokeColor(ptr, segmentIndex);
  }

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
  }) {
    return mapkit_map_arrow.Arrow.fromNativePtr(_PolylineMapObject_addArrow(
      ptr,
      mapkit_geometry_geometry.PolylinePosition.toNative(position),
      length,
      to_native.toNativeColor(fillColor),
    ));
  }

  /// Provides arrows.
  core.List<mapkit_map_arrow.Arrow> arrows() {
    return mapkit_map_arrow.ArrowContainerExtension.toPlatformVector(
        _PolylineMapObject_arrows(ptr));
  }
}

final _PolylineMapObject_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PolylineMapObject_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _PolylineMapObject_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PolylineMapObject_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _PolylineMapObject_get_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_get_geometry')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PolylineMapObject_set_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_set_geometry')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _PolylineMapObject_get_strokeWidth = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_get_strokeWidth')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _PolylineMapObject_set_strokeWidth = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_set_strokeWidth')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _PolylineMapObject_get_gradientLength = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_get_gradientLength')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _PolylineMapObject_set_gradientLength = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_set_gradientLength')
        .asFunction();

final native_types.NativeColor Function(ffi.Pointer<ffi.Void>)
    _PolylineMapObject_get_outlineColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_get_outlineColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _PolylineMapObject_set_outlineColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_set_outlineColor')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _PolylineMapObject_get_outlineWidth = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_get_outlineWidth')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _PolylineMapObject_set_outlineWidth = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_set_outlineWidth')
        .asFunction();

final core.bool Function(
    ffi
        .Pointer<ffi.Void>) _PolylineMapObject_get_innerOutlineEnabled = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PolylineMapObject_get_innerOutlineEnabled')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core
        .bool) _PolylineMapObject_set_innerOutlineEnabled = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
        'yandex_flutter_mapkit_map_PolylineMapObject_set_innerOutlineEnabled')
    .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _PolylineMapObject_get_turnRadius = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_get_turnRadius')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _PolylineMapObject_set_turnRadius = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_set_turnRadius')
        .asFunction();

final core.double Function(
    ffi
        .Pointer<ffi.Void>) _PolylineMapObject_get_arcApproximationStep = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PolylineMapObject_get_arcApproximationStep')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core
        .double) _PolylineMapObject_set_arcApproximationStep = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
        'yandex_flutter_mapkit_map_PolylineMapObject_set_arcApproximationStep')
    .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _PolylineMapObject_get_dashLength = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_get_dashLength')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _PolylineMapObject_set_dashLength = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_set_dashLength')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _PolylineMapObject_get_gapLength = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_get_gapLength')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _PolylineMapObject_set_gapLength = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_set_gapLength')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _PolylineMapObject_get_dashOffset = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_get_dashOffset')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _PolylineMapObject_set_dashOffset = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_set_dashOffset')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor,
        mapkit_geometry_geometry.SubpolylineNative) _PolylineMapObject_select =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        native_types.NativeColor,
                        mapkit_geometry_geometry.SubpolylineNative)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_select')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_geometry_geometry.SubpolylineNative)
    _PolylineMapObject_hide = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.SubpolylineNative)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_hide')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PolylineMapObject_hideMultiple = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_hideMultiple')
        .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _PolylineMapObject_setStrokeColorsWithWeights = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
                    ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PolylineMapObject_setStrokeColorsWithWeights')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PolylineMapObject_setStrokeColors = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_setStrokeColors')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int, native_types.NativeColor)
    _PolylineMapObject_setPaletteColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Uint32,
                        native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_setPaletteColor')
        .asFunction();
final native_types.NativeColor Function(ffi.Pointer<ffi.Void>, core.int)
    _PolylineMapObject_getPaletteColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(
                        ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_getPaletteColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _PolylineMapObject_setStrokeColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_setStrokeColor')
        .asFunction();
final core.int Function(ffi.Pointer<ffi.Void>, core.int)
    _PolylineMapObject_getStrokeColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Uint32 Function(ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_getStrokeColor')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_geometry.PolylinePositionNative,
        core.double,
        native_types.NativeColor) _PolylineMapObject_addArrow =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.PolylinePositionNative,
                        ffi.Float,
                        native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_addArrow')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _PolylineMapObject_arrows = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PolylineMapObject_arrows')
        .asFunction();
