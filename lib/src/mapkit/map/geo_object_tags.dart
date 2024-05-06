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

part 'geo_object_tags.containers.dart';
part 'geo_object_tags.impl.dart';

abstract final class GeoObjectTags extends mapkit_base_metadata.BaseMetadata
    implements ffi.Finalizable {
  factory GeoObjectTags(core.List<core.String> tags) => GeoObjectTagsImpl(tags);

  core.List<core.String> get tags;

  @core.override
  core.int get hashCode => core.Object.hashAll([tags]);

  @core.override
  core.bool operator ==(covariant GeoObjectTags other) {
    if (core.identical(this, other)) {
      return true;
    }
    return tags == other.tags;
  }

  @core.override
  core.String toString() {
    return "GeoObjectTags(tags: $tags)";
  }

  static final struct_factory.StructFactory<GeoObjectTags> factory =
      const _GeoObjectTagsFactory();
}
