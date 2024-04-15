import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'money.containers.dart';

/// @nodoc
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
    toNative: 'TaxiMoney.toPointer',
    toPlatform: '(val) => TaxiMoney.fromPointer(val, needFree: false)')
class TaxiMoney {
  final core.double value;
  final core.String text;
  final core.String currency;

  const TaxiMoney({
    required this.value,
    required this.text,
    required this.currency,
  });

  /// @nodoc
  @internal
  TaxiMoney.fromNative(TaxiMoneyNative native)
      : this(
            value: native.value,
            text: to_platform.toPlatformString(native.text),
            currency: to_platform.toPlatformString(native.currency));

  /// @nodoc
  @internal
  static TaxiMoneyNative toNative(TaxiMoney c) {
    return _TaxiMoneyNativeInit(c.value, to_native.toNativeString(c.text),
        to_native.toNativeString(c.currency));
  }

  /// @nodoc
  @internal
  static TaxiMoney? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = TaxiMoney.fromNative(ptr.cast<TaxiMoneyNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(TaxiMoney? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<TaxiMoneyNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
