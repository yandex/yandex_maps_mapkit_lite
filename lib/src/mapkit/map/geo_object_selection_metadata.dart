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

part 'geo_object_selection_metadata.containers.dart';
part 'geo_object_selection_metadata.impl.dart';

/// Geo object metadata which is needed to select object.
abstract final class GeoObjectSelectionMetadata
    extends mapkit_base_metadata.BaseMetadata implements ffi.Finalizable {
  factory GeoObjectSelectionMetadata(core.String objectId,
          core.String dataSourceName, core.String layerId, core.int? groupId) =>
      GeoObjectSelectionMetadataImpl(
          objectId, dataSourceName, layerId, groupId);

  /// Object ID.
  core.String get objectId;

  /// Data source name.
  core.String get dataSourceName;

  /// Layer ID.
  core.String get layerId;

  /// Group ID.
  ///
  core.int? get groupId;

  @core.override
  core.int get hashCode =>
      core.Object.hashAll([objectId, dataSourceName, layerId, groupId]);

  @core.override
  core.bool operator ==(covariant GeoObjectSelectionMetadata other) {
    if (core.identical(this, other)) {
      return true;
    }
    return objectId == other.objectId &&
        dataSourceName == other.dataSourceName &&
        layerId == other.layerId &&
        groupId == other.groupId;
  }

  @core.override
  core.String toString() {
    return "GeoObjectSelectionMetadata(objectId: $objectId, dataSourceName: $dataSourceName, layerId: $layerId, groupId: $groupId)";
  }

  static final struct_factory.StructFactory<GeoObjectSelectionMetadata>
      factory = const _GeoObjectSelectionMetadataFactory();
}
