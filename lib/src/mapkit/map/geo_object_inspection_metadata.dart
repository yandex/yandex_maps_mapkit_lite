import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/struct_factory.dart'
    as struct_factory;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/base_metadata.dart'
    as mapkit_base_metadata;

part 'geo_object_inspection_metadata.containers.dart';
part 'geo_object_inspection_metadata.impl.dart';

abstract final class GeoObjectInspectionMetadata
    extends mapkit_base_metadata.BaseMetadata implements ffi.Finalizable {
  factory GeoObjectInspectionMetadata(core.String layerId,
          GeoObjectInspectionMetadataObjectType objectType) =>
      GeoObjectInspectionMetadataImpl(layerId, objectType);

  core.String get layerId;
  GeoObjectInspectionMetadataObjectType get objectType;

  @core.override
  core.int get hashCode => core.Object.hashAll([layerId, objectType]);

  @core.override
  core.bool operator ==(covariant GeoObjectInspectionMetadata other) {
    if (core.identical(this, other)) {
      return true;
    }
    return layerId == other.layerId && objectType == other.objectType;
  }

  @core.override
  core.String toString() {
    return "GeoObjectInspectionMetadata(layerId: $layerId, objectType: $objectType)";
  }

  static final struct_factory.StructFactory<GeoObjectInspectionMetadata>
      factory = const _GeoObjectInspectionMetadataFactory();
}

enum GeoObjectInspectionMetadataObjectType {
  Point,
  Polyline,
  Polygon,
  Circle,
  ;
}
