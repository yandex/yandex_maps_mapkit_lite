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

part 'localized_value.containers.dart';
part 'localized_value.impl.dart';

/// A value respecting the device locale.

final class LocalizedValue {
  /// Value in SI units for distance, speed and duration.
  final core.double value;

  /// Localized text. For example: "15 ft" or "42 km".
  final core.String text;

  const LocalizedValue({
    required this.value,
    required this.text,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([value, text]);

  @core.override
  core.bool operator ==(covariant LocalizedValue other) {
    if (core.identical(this, other)) {
      return true;
    }
    return value == other.value && text == other.text;
  }

  @core.override
  core.String toString() {
    return "LocalizedValue(value: $value, text: $text)";
  }
}
