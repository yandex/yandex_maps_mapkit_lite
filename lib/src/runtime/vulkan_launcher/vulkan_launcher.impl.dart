part of 'vulkan_launcher.dart';

core.bool get _vulkanEnabled {
  return _VulkanLauncher_get_vulkanEnabled();
}

final core.bool Function() _VulkanLauncher_get_vulkanEnabled = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function()>>(
        'yandex_flutter_runtime_vulkan_launcher_VulkanLauncher_get_vulkanEnabled')
    .asFunction(isLeaf: true);
