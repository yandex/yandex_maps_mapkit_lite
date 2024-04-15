import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;

///
class Runtime {
  Runtime._();

  static core.String version() {
    return to_platform.toPlatformString(_Runtime_version());
  }

  static void setPreinitializationOptions(
      core.Map<core.String, core.String> runtimeOptions) {
    _Runtime_setPreinitializationOptions(
        to_native.toNativeMapString(runtimeOptions));
  }
}

final native_types.NativeString Function() _Runtime_version = lib.library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_runtime_Runtime_version')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>)
    _Runtime_setPreinitializationOptions = lib.library
        .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_Runtime_setPreinitializationOptions')
        .asFunction();
