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

part 'uri_object_metadata.containers.dart';
part 'uri_object_metadata.impl.dart';

/// URI that can be used for requests.

final class Uri {
  /// Gets URI.
  final core.String value;

  const Uri({
    required this.value,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([value]);

  @core.override
  core.bool operator ==(covariant Uri other) {
    if (core.identical(this, other)) {
      return true;
    }
    return value == other.value;
  }

  @core.override
  core.String toString() {
    return "Uri(value: $value)";
  }
}

/// URI metadata.
abstract final class UriObjectMetadata extends mapkit_base_metadata.BaseMetadata
    implements ffi.Finalizable {
  factory UriObjectMetadata(core.List<Uri> uris) => UriObjectMetadataImpl(uris);

  UriObjectMetadata._();

  /// Gets a list of URIs.
  core.List<Uri> get uris;

  @core.override
  core.int get hashCode => core.Object.hashAll([uris]);

  @core.override
  core.bool operator ==(covariant UriObjectMetadata other) {
    if (core.identical(this, other)) {
      return true;
    }
    return uris == other.uris;
  }

  @core.override
  core.String toString() {
    return "UriObjectMetadata(uris: $uris)";
  }

  static final struct_factory.StructFactory<UriObjectMetadata> factory =
      const _UriObjectMetadataFactory();
}
