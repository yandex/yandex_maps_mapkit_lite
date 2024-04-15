import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;

///
class Logger {
  Logger._();

  static void error(core.String str) {
    _Logger_error(to_native.toNativeString(str));
  }

  static void warn(core.String str) {
    _Logger_warn(to_native.toNativeString(str));
  }

  static void info(core.String str) {
    _Logger_info(to_native.toNativeString(str));
  }

  static void debug(core.String str) {
    _Logger_debug(to_native.toNativeString(str));
  }
}

final void Function(native_types.NativeString) _Logger_error = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(native_types.NativeString)>>(
        'yandex_flutter_runtime_logging_Logger_error')
    .asFunction();
final void Function(native_types.NativeString) _Logger_warn = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(native_types.NativeString)>>(
        'yandex_flutter_runtime_logging_Logger_warn')
    .asFunction();
final void Function(native_types.NativeString) _Logger_info = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(native_types.NativeString)>>(
        'yandex_flutter_runtime_logging_Logger_info')
    .asFunction();
final void Function(native_types.NativeString) _Logger_debug = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(native_types.NativeString)>>(
        'yandex_flutter_runtime_logging_Logger_debug')
    .asFunction();
