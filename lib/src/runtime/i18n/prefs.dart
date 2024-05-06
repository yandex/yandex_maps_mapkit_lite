import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'prefs.containers.dart';
part 'prefs.impl.dart';

/// The .h generated from this idl should define the same entities as
/// libs/i18n/include/yandex/maps/i18n/prefs.h from the mapscore repo.
/// Please edit these two files simultaneously. The system of measurement
/// to use.
enum SystemOfMeasurement {
  Default,

  /// Metric system. (kilometers etc)
  Metric,

  /// Imperial system. (miles etc)
  Imperial,
  ;
}

/// Time format to use.
enum TimeFormat {
  Default,

  /// 24-hour time format.
  H24,

  /// 12-hour time format with AM/PM marker.
  H12,
  ;
}

final class I18nPrefs {
  final SystemOfMeasurement som;
  final TimeFormat timeFormat;

  const I18nPrefs(this.som, this.timeFormat);

  @core.override
  core.int get hashCode => core.Object.hashAll([som, timeFormat]);

  @core.override
  core.bool operator ==(covariant I18nPrefs other) {
    if (core.identical(this, other)) {
      return true;
    }
    return som == other.som && timeFormat == other.timeFormat;
  }

  @core.override
  core.String toString() {
    return "I18nPrefs(som: $som, timeFormat: $timeFormat)";
  }
}
