import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/async.dart'
    show runWithBlockUi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/runtime/i18n/prefs.dart'
    as runtime_i18n_prefs;

part 'i18n_manager.containers.dart';
part 'i18n_manager.impl.dart';

/// Represents a unit with the value and measurement separated.

final class CanonicalUnit {
  /// The unit of measurement.
  final core.String unit;

  /// The numerical value.
  final core.double value;

  const CanonicalUnit({
    required this.unit,
    required this.value,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([unit, value]);

  @core.override
  core.bool operator ==(covariant CanonicalUnit other) {
    if (core.identical(this, other)) {
      return true;
    }
    return unit == other.unit && value == other.value;
  }

  @core.override
  core.String toString() {
    return "CanonicalUnit(unit: $unit, value: $value)";
  }
}

/// Localization manager.
abstract class I18nManager implements ffi.Finalizable {
  /// Localization preferences.
  runtime_i18n_prefs.I18nPrefs get prefs;
  set prefs(runtime_i18n_prefs.I18nPrefs val);

  /// System of measurement used.
  runtime_i18n_prefs.SystemOfMeasurement get som;
  set som(runtime_i18n_prefs.SystemOfMeasurement val);

  /// Preferred time format.
  runtime_i18n_prefs.TimeFormat get timeFormat;
  set timeFormat(runtime_i18n_prefs.TimeFormat val);

  /// Converts a distance value to the current locale.
  core.String localizeDistance(core.int distance);

  /// Converts a duration to the current locale.
  core.String localizeDuration(core.int duration);

  /// Converts speed to the current locale.
  core.String localizeSpeed(core.double speed);

  /// Converts data size to the current locale.
  core.String localizeDataSize(core.int dataSize);

  /// Represents the speed with the value and unit of measurement
  /// separated.
  CanonicalUnit canonicalSpeed(core.double speed);

  /// Localizes a value represented by canonical units.
  core.String localizeCanonicalUnit(CanonicalUnit canonicalUnit);

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

class I18nManagerFactory {
  I18nManagerFactory._();

  /// Returns the locale currently used by the runtime. Should be called
  /// only after locale has been set.
  static core.String getLocale() {
    return _getLocale();
  }

  /// Sets the application's locale. Useful only if MapKit is not used by
  /// the application. Otherwise, use {\@code
  /// mapkit.MapKitFactory.setLocale()}. Also useless if someone else has
  /// already set the locale (produses warning and does nothing). Can be
  /// set to none, in this case system locale will be used.
  static void setLocale(core.String? locale) {
    _setLocale(
      locale,
    );
  }

  /// Gets the internationalization manager interface.
  static I18nManager getI18nManagerInstance() {
    return _getI18nManagerInstance();
  }
}
