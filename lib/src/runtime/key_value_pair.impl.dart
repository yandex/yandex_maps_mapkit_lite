part of 'key_value_pair.dart';

final class KeyValuePairNative extends ffi.Struct {
  external native_types.NativeString key;
  external native_types.NativeString value;
}

final KeyValuePairNative Function(
        native_types.NativeString, native_types.NativeString)
    _KeyValuePairNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    KeyValuePairNative Function(
                        native_types.NativeString, native_types.NativeString)>>(
            'yandex_flutter_runtime_KeyValuePair_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'KeyValuePairImpl.toPointer',
    toPlatform: '(val) => KeyValuePairImpl.fromPointer(val, needFree: false)',
    platformType: 'KeyValuePair')
extension KeyValuePairImpl on KeyValuePair {
  static KeyValuePair fromNative(KeyValuePairNative native) {
    return KeyValuePair(
        key: to_platform.toPlatformString(native.key),
        value: to_platform.toPlatformString(native.value));
  }

  static KeyValuePairNative toNative(KeyValuePair obj) {
    return _KeyValuePairNativeInit(
        to_native.toNativeString(obj.key), to_native.toNativeString(obj.value));
  }

  static KeyValuePair? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        KeyValuePairImpl.fromNative(ptr.cast<KeyValuePairNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(KeyValuePair? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<KeyValuePairNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
