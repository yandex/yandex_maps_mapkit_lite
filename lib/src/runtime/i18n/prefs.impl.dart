part of 'prefs.dart';

@bindings_annotations.ContainerData(
    toNative: 'SystemOfMeasurementImpl.toPointer',
    toPlatform:
        '(val) => SystemOfMeasurementImpl.fromPointer(val, needFree: false)',
    platformType: 'SystemOfMeasurement')
extension SystemOfMeasurementImpl on SystemOfMeasurement {
  static core.int toInt(SystemOfMeasurement e) {
    return e.index;
  }

  static SystemOfMeasurement fromInt(core.int val) {
    return SystemOfMeasurement.values[val];
  }

  static SystemOfMeasurement? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(SystemOfMeasurement? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'TimeFormatImpl.toPointer',
    toPlatform: '(val) => TimeFormatImpl.fromPointer(val, needFree: false)',
    platformType: 'TimeFormat')
extension TimeFormatImpl on TimeFormat {
  static core.int toInt(TimeFormat e) {
    return e.index;
  }

  static TimeFormat fromInt(core.int val) {
    return TimeFormat.values[val];
  }

  static TimeFormat? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(TimeFormat? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

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
    toNative: 'I18nPrefsImpl.toPointer',
    toPlatform: '(val) => I18nPrefsImpl.fromPointer(val, needFree: false)',
    platformType: 'I18nPrefs')
extension I18nPrefsImpl on I18nPrefs {
  static I18nPrefs fromNative(I18nPrefsNative native) {
    return I18nPrefs(SystemOfMeasurementImpl.fromInt(native.som),
        TimeFormatImpl.fromInt(native.timeFormat));
  }

  static I18nPrefsNative toNative(I18nPrefs obj) {
    return _I18nPrefsNativeInit(SystemOfMeasurementImpl.toInt(obj.som),
        TimeFormatImpl.toInt(obj.timeFormat));
  }

  static I18nPrefs? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = I18nPrefsImpl.fromNative(ptr.cast<I18nPrefsNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(I18nPrefs? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<I18nPrefsNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
