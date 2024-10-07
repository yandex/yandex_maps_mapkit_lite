part of 'gpu_info.dart';

core.String _glGpuVendor() {
  final result = _GpuInfoManager_glGpuVendor();
  return to_platform.toPlatformString(result);
}

core.String _glGpuRenderer() {
  final result = _GpuInfoManager_glGpuRenderer();
  return to_platform.toPlatformString(result);
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
