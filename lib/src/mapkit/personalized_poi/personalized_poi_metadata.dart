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

part 'personalized_poi_metadata.containers.dart';
part 'personalized_poi_metadata.impl.dart';

abstract final class PersonalizedPoiExtraMetadataEntry
    extends mapkit_base_metadata.BaseMetadata implements ffi.Finalizable {
  factory PersonalizedPoiExtraMetadataEntry(
          core.String? key, core.String? value) =>
      PersonalizedPoiExtraMetadataEntryImpl(key, value);

  PersonalizedPoiExtraMetadataEntry._();

  core.String? get key;
  core.String? get value;

  @core.override
  core.int get hashCode => core.Object.hashAll([key, value]);

  @core.override
  core.bool operator ==(covariant PersonalizedPoiExtraMetadataEntry other) {
    if (core.identical(this, other)) {
      return true;
    }
    return key == other.key && value == other.value;
  }

  @core.override
  core.String toString() {
    return "PersonalizedPoiExtraMetadataEntry(key: $key, value: $value)";
  }

  static final struct_factory.StructFactory<PersonalizedPoiExtraMetadataEntry>
      factory = const _PersonalizedPoiExtraMetadataEntryFactory();
}

abstract final class PersonalizedPoiExtraMetadata
    extends mapkit_base_metadata.BaseMetadata implements ffi.Finalizable {
  factory PersonalizedPoiExtraMetadata(
          core.List<PersonalizedPoiExtraMetadataEntry> data) =>
      PersonalizedPoiExtraMetadataImpl(data);

  PersonalizedPoiExtraMetadata._();

  core.List<PersonalizedPoiExtraMetadataEntry> get data;

  @core.override
  core.int get hashCode => core.Object.hashAll([data]);

  @core.override
  core.bool operator ==(covariant PersonalizedPoiExtraMetadata other) {
    if (core.identical(this, other)) {
      return true;
    }
    return data == other.data;
  }

  @core.override
  core.String toString() {
    return "PersonalizedPoiExtraMetadata(data: $data)";
  }

  static final struct_factory.StructFactory<PersonalizedPoiExtraMetadata>
      factory = const _PersonalizedPoiExtraMetadataFactory();
}
