part of 'gpu_info.dart';

core.String _glGpuVendor() {
  final result = to_platform.toPlatformString(_GpuInfoManager_glGpuVendor());
  return result;
}

core.String _glGpuRenderer() {
  final result = to_platform.toPlatformString(_GpuInfoManager_glGpuRenderer());
  return result;
}

final native_types.NativeString Function() _GpuInfoManager_glGpuVendor = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_runtime_view_GpuInfoManager_glGpuVendor')
    .asFunction();
final native_types.NativeString Function() _GpuInfoManager_glGpuRenderer = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_runtime_view_GpuInfoManager_glGpuRenderer')
    .asFunction();
