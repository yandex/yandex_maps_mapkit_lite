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

part 'time.containers.dart';
part 'time.impl.dart';

/// Time in I18nTime format.

final class Time {
  /// Time value.
  final core.int value;

  /// Time offset to account for time zones.
  final core.int tzOffset;

  /// The description of the timer.
  final core.String text;

  const Time({
    required this.value,
    required this.tzOffset,
    required this.text,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([value, tzOffset, text]);

  @core.override
  core.bool operator ==(covariant Time other) {
    if (core.identical(this, other)) {
      return true;
    }
    return value == other.value &&
        tzOffset == other.tzOffset &&
        text == other.text;
  }

  @core.override
  core.String toString() {
    return "Time(value: $value, tzOffset: $tzOffset, text: $text)";
  }
}
