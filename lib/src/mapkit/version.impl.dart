part of 'version.dart';

final class VersionNative extends ffi.Struct {
  external native_types.NativeString str;
}

final VersionNative Function(native_types.NativeString) _VersionNativeInit = lib
    .library
    .lookup<
            ffi
            .NativeFunction<VersionNative Function(native_types.NativeString)>>(
        'yandex_flutter_mapkit_Version_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'VersionImpl.toPointer',
    toPlatform: '(val) => VersionImpl.fromPointer(val, needFree: false)',
    platformType: 'Version')
extension VersionImpl on Version {
  static Version fromNative(VersionNative native) {
    return Version(str: to_platform.toPlatformString(native.str));
  }

  static VersionNative toNative(Version obj) {
    return _VersionNativeInit(to_native.toNativeString(obj.str));
  }

  static Version? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = VersionImpl.fromNative(ptr.cast<VersionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Version? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<VersionNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
