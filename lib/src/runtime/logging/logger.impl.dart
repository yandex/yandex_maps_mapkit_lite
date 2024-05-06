part of 'logger.dart';

void _error(core.String str) {
  _Logger_error(to_native.toNativeString(str));
}

void _warn(core.String str) {
  _Logger_warn(to_native.toNativeString(str));
}

void _info(core.String str) {
  _Logger_info(to_native.toNativeString(str));
}

void _debug(core.String str) {
  _Logger_debug(to_native.toNativeString(str));
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
