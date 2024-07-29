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

part 'user_data.containers.dart';
part 'user_data.impl.dart';

/// Describes data attached to features in user layer.
abstract final class UserData extends mapkit_base_metadata.BaseMetadata
    implements ffi.Finalizable {
  factory UserData(core.Map<core.String, core.String> data) =>
      UserDataImpl(data);

  /// A dictionary of data.
  core.Map<core.String, core.String> get data;

  @core.override
  core.int get hashCode => core.Object.hashAll([data]);

  @core.override
  core.bool operator ==(covariant UserData other) {
    if (core.identical(this, other)) {
      return true;
    }
    return data == other.data;
  }

  @core.override
  core.String toString() {
    return "UserData(data: $data)";
  }

  static final struct_factory.StructFactory<UserData> factory =
      const _UserDataFactory();
}
