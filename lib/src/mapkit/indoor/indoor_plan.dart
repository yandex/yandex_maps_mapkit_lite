import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
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

part 'indoor_plan.containers.dart';
part 'indoor_plan.impl.dart';

/// Describes level of indoor plan.

final class IndoorLevel {
  /// Universal identifier of the level.
  final core.String id;

  /// Localized display name of the level.
  final core.String name;

  /// true if level is under ground
  final core.bool isUnderground;

  const IndoorLevel({
    required this.id,
    required this.name,
    required this.isUnderground,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([id, name, isUnderground]);

  @core.override
  core.bool operator ==(covariant IndoorLevel other) {
    if (core.identical(this, other)) {
      return true;
    }
    return id == other.id &&
        name == other.name &&
        isUnderground == other.isUnderground;
  }

  @core.override
  core.String toString() {
    return "IndoorLevel(id: $id, name: $name, isUnderground: $isUnderground)";
  }
}

/// Describes indoor plan of building. Use activeLevelId property to
/// select active level.
abstract class IndoorPlan implements ffi.Finalizable {
  /// List of all levels in indoor plan, from bottom to top.
  core.List<IndoorLevel> get levels;

  /// Gets/sets active id.
  core.String get activeLevelId;
  set activeLevelId(core.String val);
}
