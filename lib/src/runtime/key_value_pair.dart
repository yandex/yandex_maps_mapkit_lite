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

part 'key_value_pair.containers.dart';
part 'key_value_pair.impl.dart';

/// Universal key-value data.

final class KeyValuePair {
  /// Data key. For example, "currency".
  final core.String key;

  /// Data value. For example, "USD".
  final core.String value;

  const KeyValuePair({
    required this.key,
    required this.value,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([key, value]);

  @core.override
  core.bool operator ==(covariant KeyValuePair other) {
    if (core.identical(this, other)) {
      return true;
    }
    return key == other.key && value == other.value;
  }

  @core.override
  core.String toString() {
    return "KeyValuePair(key: $key, value: $value)";
  }
}
