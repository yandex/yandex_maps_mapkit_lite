part of 'localized_value.dart';

final class LocalizedValueNative extends ffi.Struct {
  @ffi.Double()
  external core.double value;
  external native_types.NativeString text;
}

final LocalizedValueNative Function(core.double, native_types.NativeString)
    _LocalizedValueNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    LocalizedValueNative Function(
                        ffi.Double, native_types.NativeString)>>(
            'yandex_flutter_mapkit_LocalizedValue_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LocalizedValueImpl.toPointer',
    toPlatform: '(val) => LocalizedValueImpl.fromPointer(val, needFree: false)',
    platformType: 'LocalizedValue')
extension LocalizedValueImpl on LocalizedValue {
  static LocalizedValue fromNative(LocalizedValueNative native) {
    return LocalizedValue(
        value: native.value, text: to_platform.toPlatformString(native.text));
  }

  static LocalizedValueNative toNative(LocalizedValue obj) {
    return _LocalizedValueNativeInit(
        obj.value, to_native.toNativeString(obj.text));
  }

  static LocalizedValue? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        LocalizedValueImpl.fromNative(ptr.cast<LocalizedValueNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(LocalizedValue? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LocalizedValueNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
