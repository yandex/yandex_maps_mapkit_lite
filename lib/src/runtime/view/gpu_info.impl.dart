part of 'gpu_info.dart';

core.String _glGpuVendor() {
  return to_platform.toPlatformString(_GpuInfoManager_glGpuVendor());
}

core.String _glGpuRenderer() {
  return to_platform.toPlatformString(_GpuInfoManager_glGpuRenderer());
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
