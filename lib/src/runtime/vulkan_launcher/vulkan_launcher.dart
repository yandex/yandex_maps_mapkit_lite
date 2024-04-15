import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;

///
class VulkanLauncher {
  VulkanLauncher._();

  static core.bool get vulkanEnabled {
    return _VulkanLauncher_get_vulkanEnabled();
  }
}

final core.bool Function() _VulkanLauncher_get_vulkanEnabled = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function()>>(
        'yandex_flutter_runtime_vulkan_launcher_VulkanLauncher_get_vulkanEnabled')
    .asFunction(isLeaf: true);
