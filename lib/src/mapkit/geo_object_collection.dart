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
import 'package:yandex_maps_mapkit_lite/src/mapkit/base_metadata.dart'
    as mapkit_base_metadata;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geo_object.dart'
    as mapkit_geo_object;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;

part 'geo_object_collection.containers.dart';
part 'geo_object_collection.impl.dart';

/// A collection of geo objects. Allows you to group geo objects for
/// adding them to the map, setting options, etc. Collections are geo
/// objects too.
abstract final class GeoObjectCollection implements ffi.Finalizable {
  factory GeoObjectCollection(
          mapkit_geometry_geometry.BoundingBox? boundingBox,
          type_dictionary.TypeDictionaryBase<mapkit_base_metadata.BaseMetadata>
              metadataContainer,
          core.List<GeoObjectCollectionItem> children) =>
      GeoObjectCollectionImpl(boundingBox, metadataContainer, children);

  GeoObjectCollection._();

  /// The bounds around the collection of objects.
  ///
  mapkit_geometry_geometry.BoundingBox? get boundingBox;

  /// The metadata for the objects.
  type_dictionary.TypeDictionaryBase<mapkit_base_metadata.BaseMetadata>
      get metadataContainer;
  core.List<GeoObjectCollectionItem> get children;

  @core.override
  core.int get hashCode =>
      core.Object.hashAll([boundingBox, metadataContainer, children]);

  @core.override
  core.bool operator ==(covariant GeoObjectCollection other) {
    if (core.identical(this, other)) {
      return true;
    }
    return boundingBox == other.boundingBox &&
        metadataContainer == other.metadataContainer &&
        children == other.children;
  }

  @core.override
  core.String toString() {
    return "GeoObjectCollection(boundingBox: $boundingBox, metadataContainer: $metadataContainer, children: $children)";
  }
}

/// The geo objects in the collection.
final class GeoObjectCollectionItem {
  const GeoObjectCollectionItem.fromGeoObject(mapkit_geo_object.GeoObject obj)
      : _value = obj;

  const GeoObjectCollectionItem.fromGeoObjectCollection(
      GeoObjectCollection collection)
      : _value = collection;

  mapkit_geo_object.GeoObject? asGeoObject() {
    if (_value is mapkit_geo_object.GeoObject) {
      return _value;
    }
    return null;
  }

  GeoObjectCollection? asGeoObjectCollection() {
    if (_value is GeoObjectCollection) {
      return _value;
    }
    return null;
  }

  /// Applies the passed function to the variant value.
  void when({
    required void Function(mapkit_geo_object.GeoObject value) onGeoObject,
    required void Function(GeoObjectCollection value) onGeoObjectCollection,
  }) {
    if (_value is mapkit_geo_object.GeoObject) {
      return onGeoObject(_value as mapkit_geo_object.GeoObject);
    }
    if (_value is GeoObjectCollection) {
      return onGeoObjectCollection(_value as GeoObjectCollection);
    }
    assert(false);
  }

  final core.dynamic _value;
}
