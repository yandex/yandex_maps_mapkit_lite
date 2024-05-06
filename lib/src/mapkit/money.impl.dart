part of 'money.dart';

final class TaxiMoneyNative extends ffi.Struct {
  @ffi.Double()
  external core.double value;
  external native_types.NativeString text;
  external native_types.NativeString currency;
}

final TaxiMoneyNative Function(
        core.double, native_types.NativeString, native_types.NativeString)
    _TaxiMoneyNativeInit = lib.library
        .lookup<
            ffi.NativeFunction<
                TaxiMoneyNative Function(
                    ffi.Double,
                    native_types.NativeString,
                    native_types
                        .NativeString)>>('yandex_flutter_mapkit_TaxiMoney_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'TaxiMoneyImpl.toPointer',
    toPlatform: '(val) => TaxiMoneyImpl.fromPointer(val, needFree: false)',
    platformType: 'TaxiMoney')
extension TaxiMoneyImpl on TaxiMoney {
  static TaxiMoney fromNative(TaxiMoneyNative native) {
    return TaxiMoney(
        value: native.value,
        text: to_platform.toPlatformString(native.text),
        currency: to_platform.toPlatformString(native.currency));
  }

  static TaxiMoneyNative toNative(TaxiMoney obj) {
    return _TaxiMoneyNativeInit(obj.value, to_native.toNativeString(obj.text),
        to_native.toNativeString(obj.currency));
  }

  static TaxiMoney? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = TaxiMoneyImpl.fromNative(ptr.cast<TaxiMoneyNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(TaxiMoney? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<TaxiMoneyNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
