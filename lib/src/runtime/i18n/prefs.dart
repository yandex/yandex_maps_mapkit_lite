import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'prefs.containers.dart';

/// The .h generated from this idl should define the same entities as
/// libs/i18n/include/yandex/maps/i18n/prefs.h from the mapscore repo.
/// Please edit these two files simultaneously. The system of measurement
/// to use.
@bindings_annotations.ContainerData(
    toNative: 'SystemOfMeasurement.toPointer',
    toPlatform:
        '(val) => SystemOfMeasurement.fromPointer(val, needFree: false)')
enum SystemOfMeasurement {
  Default,

  /// Metric system. (kilometers etc)
  Metric,

  /// Imperial system. (miles etc)
  Imperial,
  ;

  /// @nodoc
  @internal
  static SystemOfMeasurement fromInt(core.int val) {
    return SystemOfMeasurement.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(SystemOfMeasurement e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static SystemOfMeasurement? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(SystemOfMeasurement? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

/// Time format to use.
@bindings_annotations.ContainerData(
    toNative: 'TimeFormat.toPointer',
    toPlatform: '(val) => TimeFormat.fromPointer(val, needFree: false)')
enum TimeFormat {
  Default,

  /// 24-hour time format.
  H24,

  /// 12-hour time format with AM/PM marker.
  H12,
  ;

  /// @nodoc
  @internal
  static TimeFormat fromInt(core.int val) {
    return TimeFormat.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(TimeFormat e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static TimeFormat? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(TimeFormat? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

/// @nodoc
final class I18nPrefsNative extends ffi.Struct {
  @ffi.Int64()
  external core.int som;
  @ffi.Int64()
  external core.int timeFormat;
}

final I18nPrefsNative Function(core.int, core.int) _I18nPrefsNativeInit = lib
    .library
    .lookup<ffi.NativeFunction<I18nPrefsNative Function(ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_runtime_i18n_I18nPrefs_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'I18nPrefs.toPointer',
    toPlatform: '(val) => I18nPrefs.fromPointer(val, needFree: false)')
class I18nPrefs {
  final SystemOfMeasurement som;
  final TimeFormat timeFormat;

  const I18nPrefs(this.som, this.timeFormat);

  /// @nodoc
  @internal
  I18nPrefs.fromNative(I18nPrefsNative native)
      : this(SystemOfMeasurement.fromInt(native.som),
            TimeFormat.fromInt(native.timeFormat));

  /// @nodoc
  @internal
  static I18nPrefsNative toNative(I18nPrefs c) {
    return _I18nPrefsNativeInit(
        SystemOfMeasurement.toInt(c.som), TimeFormat.toInt(c.timeFormat));
  }

  /// @nodoc
  @internal
  static I18nPrefs? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = I18nPrefs.fromNative(ptr.cast<I18nPrefsNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(I18nPrefs? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<I18nPrefsNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
