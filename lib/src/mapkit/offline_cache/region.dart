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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/localized_value.dart'
    as mapkit_localized_value;

part 'region.containers.dart';
part 'region.impl.dart';

/// @attention This feature is not available in the free MapKit version.

final class OfflineCacheRegion {
  /// Region ID.
  final core.int id;

  /// Name of the region.
  final core.String name;

  /// Country of the region.
  final core.String country;

  /// Center point.
  final mapkit_geometry_point.Point center;

  /// Region size
  final mapkit_localized_value.LocalizedValue size;

  /// Returns the region creation time.
  final core.DateTime releaseTime;

  /// Region id of the parent region.
  ///
  final core.int? parentId;

  const OfflineCacheRegion(
    this.center,
    this.size,
    this.releaseTime, {
    required this.id,
    required this.name,
    required this.country,
    this.parentId,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll(
      [id, name, country, center, size, releaseTime, parentId]);

  @core.override
  core.bool operator ==(covariant OfflineCacheRegion other) {
    if (core.identical(this, other)) {
      return true;
    }
    return id == other.id &&
        name == other.name &&
        country == other.country &&
        center == other.center &&
        size == other.size &&
        releaseTime == other.releaseTime &&
        parentId == other.parentId;
  }

  @core.override
  core.String toString() {
    return "OfflineCacheRegion(id: $id, name: $name, country: $country, center: $center, size: $size, releaseTime: $releaseTime, parentId: $parentId)";
  }
}
