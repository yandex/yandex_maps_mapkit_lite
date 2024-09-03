part of 'runtime.dart';

core.String _version() {
  final result = to_platform.toPlatformString(_Runtime_version());
  return result;
}

void _setPreinitializationOptions(
    core.Map<core.String, core.String> runtimeOptions) {
  _Runtime_setPreinitializationOptions(
      to_native.toNativeMapString(runtimeOptions));
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
