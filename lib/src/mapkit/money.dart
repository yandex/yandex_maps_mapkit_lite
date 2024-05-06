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

part 'money.containers.dart';
part 'money.impl.dart';

final class TaxiMoney {
  final core.double value;
  final core.String text;
  final core.String currency;

  const TaxiMoney({
    required this.value,
    required this.text,
    required this.currency,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([value, text, currency]);

  @core.override
  core.bool operator ==(covariant TaxiMoney other) {
    if (core.identical(this, other)) {
      return true;
    }
    return value == other.value &&
        text == other.text &&
        currency == other.currency;
  }

  @core.override
  core.String toString() {
    return "TaxiMoney(value: $value, text: $text, currency: $currency)";
  }
}
