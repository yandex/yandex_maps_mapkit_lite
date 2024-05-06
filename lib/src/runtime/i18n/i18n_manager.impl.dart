part of 'i18n_manager.dart';

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
    toNative: 'CanonicalUnitImpl.toPointer',
    toPlatform: '(val) => CanonicalUnitImpl.fromPointer(val, needFree: false)',
    platformType: 'CanonicalUnit')
extension CanonicalUnitImpl on CanonicalUnit {
  static CanonicalUnit fromNative(CanonicalUnitNative native) {
    return CanonicalUnit(
        unit: to_platform.toPlatformString(native.unit), value: native.value);
  }

  static CanonicalUnitNative toNative(CanonicalUnit obj) {
    return _CanonicalUnitNativeInit(
        to_native.toNativeString(obj.unit), obj.value);
  }

  static CanonicalUnit? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        CanonicalUnitImpl.fromNative(ptr.cast<CanonicalUnitNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(CanonicalUnit? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<CanonicalUnitNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

@bindings_annotations.WeakInterface('runtime.i18n.I18nManager')
@bindings_annotations.ContainerData(
    toNative: 'I18nManagerImpl.getNativePtr',
    toPlatform:
        '(val) => I18nManagerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'I18nManager')
class I18nManagerImpl implements I18nManager, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_I18nManager_free.cast());

  /// @nodoc
  I18nManagerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  I18nManagerImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory I18nManagerImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(I18nManager? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as I18nManagerImpl).ptr;
  }

  core.bool isValid() {
    return _I18nManager_check(ptr);
  }

  @internal

  /// @nodoc
  static I18nManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return I18nManagerImpl.fromNativePtr(ptr);
  }

  @core.override
  runtime_i18n_prefs.I18nPrefs get prefs {
    return runtime_i18n_prefs.I18nPrefsImpl.fromNative(
        _I18nManager_get_prefs(ptr));
  }

  @core.override
  set prefs(runtime_i18n_prefs.I18nPrefs val) {
    _I18nManager_set_prefs(ptr, runtime_i18n_prefs.I18nPrefsImpl.toNative(val));
  }

  @core.override
  runtime_i18n_prefs.SystemOfMeasurement get som {
    return runtime_i18n_prefs.SystemOfMeasurementImpl.fromInt(
        _I18nManager_get_som(ptr));
  }

  @core.override
  set som(runtime_i18n_prefs.SystemOfMeasurement val) {
    _I18nManager_set_som(
        ptr, runtime_i18n_prefs.SystemOfMeasurementImpl.toInt(val));
  }

  @core.override
  runtime_i18n_prefs.TimeFormat get timeFormat {
    return runtime_i18n_prefs.TimeFormatImpl.fromInt(
        _I18nManager_get_timeFormat(ptr));
  }

  @core.override
  set timeFormat(runtime_i18n_prefs.TimeFormat val) {
    _I18nManager_set_timeFormat(
        ptr, runtime_i18n_prefs.TimeFormatImpl.toInt(val));
  }

  core.String localizeDistance(core.int distance) {
    return to_platform
        .toPlatformString(_I18nManager_localizeDistance(ptr, distance));
  }

  core.String localizeDuration(core.int duration) {
    return to_platform
        .toPlatformString(_I18nManager_localizeDuration(ptr, duration));
  }

  core.String localizeSpeed(core.double speed) {
    return to_platform.toPlatformString(_I18nManager_localizeSpeed(ptr, speed));
  }

  core.String localizeDataSize(core.int dataSize) {
    return to_platform
        .toPlatformString(_I18nManager_localizeDataSize(ptr, dataSize));
  }

  CanonicalUnit canonicalSpeed(core.double speed) {
    return CanonicalUnitImpl.fromNative(
        _I18nManager_canonicalSpeed(ptr, speed));
  }

  core.String localizeCanonicalUnit(CanonicalUnit canonicalUnit) {
    return to_platform.toPlatformString(_I18nManager_localizeCanonicalUnit(
        ptr, CanonicalUnitImpl.toNative(canonicalUnit)));
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

core.String _getLocale() {
  return to_platform.toPlatformString(_I18nManagerFactory_getLocale());
}

void _setLocale(core.String? locale) {
  _I18nManagerFactory_setLocale(to_native.toNativePtrString(locale));
}

I18nManager _getI18nManagerInstance() {
  return I18nManagerImpl.fromNativePtr(
      _I18nManagerFactory_getI18nManagerInstance());
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
