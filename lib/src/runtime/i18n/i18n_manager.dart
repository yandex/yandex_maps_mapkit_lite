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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/runtime/i18n/prefs.dart'
    as runtime_i18n_prefs;

part 'i18n_manager.containers.dart';

/// @nodoc
final class CanonicalUnitNative extends ffi.Struct {
  external native_types.NativeString unit;
  @ffi.Double()
  external core.double value;
}

final CanonicalUnitNative Function(native_types.NativeString, core.double)
    _CanonicalUnitNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    CanonicalUnitNative Function(
                        native_types.NativeString, ffi.Double)>>(
            'yandex_flutter_runtime_i18n_CanonicalUnit_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'CanonicalUnit.toPointer',
    toPlatform: '(val) => CanonicalUnit.fromPointer(val, needFree: false)')
class CanonicalUnit {
  final core.String unit;
  final core.double value;

  const CanonicalUnit({
    required this.unit,
    required this.value,
  });

  /// @nodoc
  @internal
  CanonicalUnit.fromNative(CanonicalUnitNative native)
      : this(
            unit: to_platform.toPlatformString(native.unit),
            value: native.value);

  /// @nodoc
  @internal
  static CanonicalUnitNative toNative(CanonicalUnit c) {
    return _CanonicalUnitNativeInit(to_native.toNativeString(c.unit), c.value);
  }

  /// @nodoc
  @internal
  static CanonicalUnit? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        CanonicalUnit.fromNative(ptr.cast<CanonicalUnitNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(CanonicalUnit? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<CanonicalUnitNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

/// Localization manager.
@bindings_annotations.WeakInterface('runtime.i18n.I18nManager')
@bindings_annotations.ContainerData(
    toNative: 'I18nManager.getNativePtr',
    toPlatform:
        '(val) => I18nManager.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class I18nManager implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_I18nManager_free.cast());

  /// @nodoc
  I18nManager.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  I18nManager.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory I18nManager.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(I18nManager? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _I18nManager_check(ptr);
  }

  @internal

  /// @nodoc
  static I18nManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return I18nManager.fromNativePtr(ptr);
  }

  /// Localization preferences.
  runtime_i18n_prefs.I18nPrefs get prefs {
    return runtime_i18n_prefs.I18nPrefs.fromNative(_I18nManager_get_prefs(ptr));
  }

  set prefs(runtime_i18n_prefs.I18nPrefs val) {
    return _I18nManager_set_prefs(
        ptr, runtime_i18n_prefs.I18nPrefs.toNative(val));
  }

  /// System of measurement used.
  runtime_i18n_prefs.SystemOfMeasurement get som {
    return runtime_i18n_prefs.SystemOfMeasurement.fromInt(
        _I18nManager_get_som(ptr));
  }

  set som(runtime_i18n_prefs.SystemOfMeasurement val) {
    return _I18nManager_set_som(
        ptr, runtime_i18n_prefs.SystemOfMeasurement.toInt(val));
  }

  /// Preferred time format.
  runtime_i18n_prefs.TimeFormat get timeFormat {
    return runtime_i18n_prefs.TimeFormat.fromInt(
        _I18nManager_get_timeFormat(ptr));
  }

  set timeFormat(runtime_i18n_prefs.TimeFormat val) {
    return _I18nManager_set_timeFormat(
        ptr, runtime_i18n_prefs.TimeFormat.toInt(val));
  }

  /// Converts a distance value to the current locale.
  core.String localizeDistance(core.int distance) {
    return to_platform
        .toPlatformString(_I18nManager_localizeDistance(ptr, distance));
  }

  /// Converts a duration to the current locale.
  core.String localizeDuration(core.int duration) {
    return to_platform
        .toPlatformString(_I18nManager_localizeDuration(ptr, duration));
  }

  /// Converts speed to the current locale.
  core.String localizeSpeed(core.double speed) {
    return to_platform.toPlatformString(_I18nManager_localizeSpeed(ptr, speed));
  }

  /// Converts data size to the current locale.
  core.String localizeDataSize(core.int dataSize) {
    return to_platform
        .toPlatformString(_I18nManager_localizeDataSize(ptr, dataSize));
  }

  /// Represents the speed with the value and unit of measurement
  /// separated.
  CanonicalUnit canonicalSpeed(core.double speed) {
    return CanonicalUnit.fromNative(_I18nManager_canonicalSpeed(ptr, speed));
  }

  /// Localizes a value represented by canonical units.
  core.String localizeCanonicalUnit(CanonicalUnit canonicalUnit) {
    return to_platform.toPlatformString(_I18nManager_localizeCanonicalUnit(
        ptr, CanonicalUnit.toNative(canonicalUnit)));
  }
}

final _I18nManager_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_i18n_I18nManager_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _I18nManager_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_i18n_I18nManager_check')
    .asFunction(isLeaf: true);

final runtime_i18n_prefs.I18nPrefsNative Function(ffi.Pointer<ffi.Void>)
    _I18nManager_get_prefs = lib.library
        .lookup<
                ffi.NativeFunction<
                    runtime_i18n_prefs.I18nPrefsNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_i18n_I18nManager_get_prefs')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, runtime_i18n_prefs.I18nPrefsNative)
    _I18nManager_set_prefs = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        runtime_i18n_prefs.I18nPrefsNative)>>(
            'yandex_flutter_runtime_i18n_I18nManager_set_prefs')
        .asFunction();

final core.int Function(ffi.Pointer<ffi.Void>) _I18nManager_get_som = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_i18n_I18nManager_get_som')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _I18nManager_set_som = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_runtime_i18n_I18nManager_set_som')
    .asFunction();

final core.int Function(ffi.Pointer<ffi.Void>) _I18nManager_get_timeFormat = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_i18n_I18nManager_get_timeFormat')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int)
    _I18nManager_set_timeFormat = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_runtime_i18n_I18nManager_set_timeFormat')
        .asFunction();

final native_types.NativeString Function(ffi.Pointer<ffi.Void>, core.int)
    _I18nManager_localizeDistance = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(
                        ffi.Pointer<ffi.Void>, ffi.Int)>>(
            'yandex_flutter_runtime_i18n_I18nManager_localizeDistance')
        .asFunction();
final native_types.NativeString Function(ffi.Pointer<ffi.Void>, core.int)
    _I18nManager_localizeDuration = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(
                        ffi.Pointer<ffi.Void>, ffi.Int)>>(
            'yandex_flutter_runtime_i18n_I18nManager_localizeDuration')
        .asFunction();
final native_types.NativeString Function(ffi.Pointer<ffi.Void>, core.double)
    _I18nManager_localizeSpeed = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(
                        ffi.Pointer<ffi.Void>, ffi.Double)>>(
            'yandex_flutter_runtime_i18n_I18nManager_localizeSpeed')
        .asFunction();
final native_types.NativeString Function(ffi.Pointer<ffi.Void>, core.int)
    _I18nManager_localizeDataSize = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_runtime_i18n_I18nManager_localizeDataSize')
        .asFunction();
final CanonicalUnitNative Function(ffi.Pointer<ffi.Void>, core.double)
    _I18nManager_canonicalSpeed = lib.library
        .lookup<
                ffi.NativeFunction<
                    CanonicalUnitNative Function(
                        ffi.Pointer<ffi.Void>, ffi.Double)>>(
            'yandex_flutter_runtime_i18n_I18nManager_canonicalSpeed')
        .asFunction();
final native_types.NativeString Function(
        ffi.Pointer<ffi.Void>, CanonicalUnitNative)
    _I18nManager_localizeCanonicalUnit = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(
                        ffi.Pointer<ffi.Void>, CanonicalUnitNative)>>(
            'yandex_flutter_runtime_i18n_I18nManager_localizeCanonicalUnit')
        .asFunction();

class I18nManagerFactory {
  I18nManagerFactory._();

  /// Returns the locale currently used by the runtime. Should be called
  /// only after locale has been set.
  static core.String getLocale() {
    return to_platform.toPlatformString(_I18nManagerFactory_getLocale());
  }

  /// Sets the application's locale. Useful only if MapKit is not used by
  /// the application. Otherwise, use {@code
  /// mapkit.MapKitFactory.setLocale()}. Also useless if someone else has
  /// already set the locale (produses warning and does nothing). Can be
  /// set to none, in this case system locale will be used.
  static void setLocale(core.String? locale) {
    _I18nManagerFactory_setLocale(to_native.toNativePtrString(locale));
  }

  /// Gets the internationalization manager interface.
  static I18nManager getI18nManagerInstance() {
    return I18nManager.fromNativePtr(
        _I18nManagerFactory_getI18nManagerInstance());
  }
}

final native_types.NativeString Function() _I18nManagerFactory_getLocale = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_runtime_i18n_I18nManagerFactory_getLocale')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _I18nManagerFactory_setLocale = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_i18n_I18nManagerFactory_setLocale')
    .asFunction();
final ffi.Pointer<ffi.Void> Function()
    _I18nManagerFactory_getI18nManagerInstance = lib.library
        .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function()>>(
            'yandex_flutter_runtime_i18n_I18nManagerFactory_getI18nManagerInstance')
        .asFunction();
