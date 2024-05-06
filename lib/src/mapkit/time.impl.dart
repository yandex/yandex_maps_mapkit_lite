part of 'time.dart';

final class TimeNative extends ffi.Struct {
  @ffi.Int64()
  external core.int value;
  @ffi.Int()
  external core.int tzOffset;
  external native_types.NativeString text;
}

final TimeNative Function(core.int, core.int, native_types.NativeString)
    _TimeNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    TimeNative Function(
                        ffi.Int64, ffi.Int, native_types.NativeString)>>(
            'yandex_flutter_mapkit_Time_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'TimeImpl.toPointer',
    toPlatform: '(val) => TimeImpl.fromPointer(val, needFree: false)',
    platformType: 'Time')
extension TimeImpl on Time {
  static Time fromNative(TimeNative native) {
    return Time(
        value: native.value,
        tzOffset: native.tzOffset,
        text: to_platform.toPlatformString(native.text));
  }

  static TimeNative toNative(Time obj) {
    return _TimeNativeInit(
        obj.value, obj.tzOffset, to_native.toNativeString(obj.text));
  }

  static Time? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = TimeImpl.fromNative(ptr.cast<TimeNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Time? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<TimeNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
