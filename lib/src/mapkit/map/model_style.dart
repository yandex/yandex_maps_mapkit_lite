import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
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

part 'model_style.containers.dart';
part 'model_style.impl.dart';

/// The style of the model.

final class ModelStyle {
  /// Scale the model by this value.
  final core.double scale;

  /// Unit type of the model.
  final ModelStyleUnitType unitType;

  /// Defines should it be rendered with buildings from ground layer.
  final ModelStyleRenderMode renderMode;

  /// Name of variant to render model with. See KHR_materials_variants gltf
  /// extension. This works only for glTF models.
  ///
  final core.String? variantName;

  const ModelStyle({
    this.scale = 1.0,
    this.unitType = ModelStyleUnitType.Unit,
    this.renderMode = ModelStyleRenderMode.UserModel,
    this.variantName,
  });

  @core.override
  core.int get hashCode =>
      core.Object.hashAll([scale, unitType, renderMode, variantName]);

  @core.override
  core.bool operator ==(covariant ModelStyle other) {
    if (core.identical(this, other)) {
      return true;
    }
    return scale == other.scale &&
        unitType == other.unitType &&
        renderMode == other.renderMode &&
        variantName == other.variantName;
  }

  @core.override
  core.String toString() {
    return "ModelStyle(scale: $scale, unitType: $unitType, renderMode: $renderMode, variantName: $variantName)";
  }
}

enum ModelStyleUnitType {
  /// The model is given in units. The size of a unit is equal to the size
  /// of a pixel at the current zoom level when the camera position's tilt
  /// is equal to 0 and the scale factor is equal to 1.
  Unit,

  /// Scale model proportionally to fit into 1x1x1 box.
  @core.Deprecated('Use UnitType.Unit instead.')
  Normalized,

  /// The model is given in meters.
  Meter,
  ;
}

enum ModelStyleRenderMode {
  /// Model should be rendered with buildings from ground layer.
  Building,

  /// Model should be rendered within separate sublayer.
  UserModel,
  ;
}
