import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
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

part 'ec_public_key.containers.dart';
part 'ec_public_key.impl.dart';

/// @nodoc
abstract final class EcPublicKey implements ffi.Finalizable {
  factory EcPublicKey(
          typed_data.ByteBuffer affineX, typed_data.ByteBuffer affineY) =>
      EcPublicKeyImpl(affineX, affineY);

  EcPublicKey._();

  typed_data.ByteBuffer get affineX;
  typed_data.ByteBuffer get affineY;

  @core.override
  core.int get hashCode => core.Object.hashAll([affineX, affineY]);

  @core.override
  core.bool operator ==(covariant EcPublicKey other) {
    if (core.identical(this, other)) {
      return true;
    }
    return affineX == other.affineX && affineY == other.affineY;
  }

  @core.override
  core.String toString() {
    return "EcPublicKey(affineX: $affineX, affineY: $affineY)";
  }
}
