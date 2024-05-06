part of 'alignment.dart';

@bindings_annotations.ContainerData(
    toNative: 'LogoHorizontalAlignmentImpl.toPointer',
    toPlatform:
        '(val) => LogoHorizontalAlignmentImpl.fromPointer(val, needFree: false)',
    platformType: 'LogoHorizontalAlignment')
extension LogoHorizontalAlignmentImpl on LogoHorizontalAlignment {
  static core.int toInt(LogoHorizontalAlignment e) {
    return e.index;
  }

  static LogoHorizontalAlignment fromInt(core.int val) {
    return LogoHorizontalAlignment.values[val];
  }

  static LogoHorizontalAlignment? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(LogoHorizontalAlignment? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'LogoVerticalAlignmentImpl.toPointer',
    toPlatform:
        '(val) => LogoVerticalAlignmentImpl.fromPointer(val, needFree: false)',
    platformType: 'LogoVerticalAlignment')
extension LogoVerticalAlignmentImpl on LogoVerticalAlignment {
  static core.int toInt(LogoVerticalAlignment e) {
    return e.index;
  }

  static LogoVerticalAlignment fromInt(core.int val) {
    return LogoVerticalAlignment.values[val];
  }

  static LogoVerticalAlignment? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(LogoVerticalAlignment? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

final class LogoAlignmentNative extends ffi.Struct {
  @ffi.Int64()
  external core.int horizontalAlignment;
  @ffi.Int64()
  external core.int verticalAlignment;
}

final LogoAlignmentNative Function(core.int, core.int)
    _LogoAlignmentNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    LogoAlignmentNative Function(ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_logo_LogoAlignment_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LogoAlignmentImpl.toPointer',
    toPlatform: '(val) => LogoAlignmentImpl.fromPointer(val, needFree: false)',
    platformType: 'LogoAlignment')
extension LogoAlignmentImpl on LogoAlignment {
  static LogoAlignment fromNative(LogoAlignmentNative native) {
    return LogoAlignment(
        LogoHorizontalAlignmentImpl.fromInt(native.horizontalAlignment),
        LogoVerticalAlignmentImpl.fromInt(native.verticalAlignment));
  }

  static LogoAlignmentNative toNative(LogoAlignment obj) {
    return _LogoAlignmentNativeInit(
        LogoHorizontalAlignmentImpl.toInt(obj.horizontalAlignment),
        LogoVerticalAlignmentImpl.toInt(obj.verticalAlignment));
  }

  static LogoAlignment? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        LogoAlignmentImpl.fromNative(ptr.cast<LogoAlignmentNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(LogoAlignment? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LogoAlignmentNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
