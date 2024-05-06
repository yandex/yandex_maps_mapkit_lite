part of 'padding.dart';

final class LogoPaddingNative extends ffi.Struct {
  @ffi.Uint32()
  external core.int horizontalPadding;
  @ffi.Uint32()
  external core.int verticalPadding;
}

final LogoPaddingNative Function(core.int, core.int) _LogoPaddingNativeInit =
    lib.library
        .lookup<
            ffi.NativeFunction<
                LogoPaddingNative Function(ffi.Uint32,
                    ffi.Uint32)>>('yandex_flutter_mapkit_logo_LogoPadding_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LogoPaddingImpl.toPointer',
    toPlatform: '(val) => LogoPaddingImpl.fromPointer(val, needFree: false)',
    platformType: 'LogoPadding')
extension LogoPaddingImpl on LogoPadding {
  static LogoPadding fromNative(LogoPaddingNative native) {
    return LogoPadding(
        horizontalPadding: native.horizontalPadding,
        verticalPadding: native.verticalPadding);
  }

  static LogoPaddingNative toNative(LogoPadding obj) {
    return _LogoPaddingNativeInit(obj.horizontalPadding, obj.verticalPadding);
  }

  static LogoPadding? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        LogoPaddingImpl.fromNative(ptr.cast<LogoPaddingNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(LogoPadding? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LogoPaddingNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
