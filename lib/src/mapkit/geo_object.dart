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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/type_dictionary.dart'
    as type_dictionary;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/attribution.dart'
    as mapkit_attribution;
import 'package:yandex_maps_mapkit_lite/src/mapkit/base_metadata.dart'
    as mapkit_base_metadata;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;

part 'geo_object.containers.dart';
part 'geo_object.impl.dart';

/// Geo object. Can be displayed as a placemark, polyline, polygon, and
/// other, depending on the geometry type.
abstract final class GeoObject implements ffi.Finalizable {
  factory GeoObject(
          core.String? name,
          core.String? descriptionText,
          core.List<mapkit_geometry_geometry.Geometry> geometry,
          mapkit_geometry_geometry.BoundingBox? boundingBox,
          core.Map<core.String, mapkit_attribution.Attribution> attributionMap,
          type_dictionary.TypeDictionaryBase<mapkit_base_metadata.BaseMetadata>
              metadataContainer,
          core.List<core.String> aref) =>
      GeoObjectImpl(name, descriptionText, geometry, boundingBox,
          attributionMap, metadataContainer, aref);

  GeoObject._();

  /// Object name.
  ///
  core.String? get name;

  /// The description of the object.
  ///
  core.String? get descriptionText;

  /// The object's geometry.
  core.List<mapkit_geometry_geometry.Geometry> get geometry;

  /// A rectangular box around the object.
  ///
  mapkit_geometry_geometry.BoundingBox? get boundingBox;

  /// The attribution of information to a specific author.
  core.Map<core.String, mapkit_attribution.Attribution> get attributionMap;

  /// The object's metadata.
  type_dictionary.TypeDictionaryBase<mapkit_base_metadata.BaseMetadata>
      get metadataContainer;

  /// The name of the internet resource.
  core.List<core.String> get aref;

  @core.override
  core.int get hashCode => core.Object.hashAll([
        name,
        descriptionText,
        geometry,
        boundingBox,
        attributionMap,
        metadataContainer,
        aref
      ]);

  @core.override
  core.bool operator ==(covariant GeoObject other) {
    if (core.identical(this, other)) {
      return true;
    }
    return name == other.name &&
        descriptionText == other.descriptionText &&
        geometry == other.geometry &&
        boundingBox == other.boundingBox &&
        attributionMap == other.attributionMap &&
        metadataContainer == other.metadataContainer &&
        aref == other.aref;
  }

  @core.override
  core.String toString() {
    return "GeoObject(name: $name, descriptionText: $descriptionText, geometry: $geometry, boundingBox: $boundingBox, attributionMap: $attributionMap, metadataContainer: $metadataContainer, aref: $aref)";
  }
}
