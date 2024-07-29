import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;

part 'gpu_info.impl.dart';

/// @nodoc
class GpuInfoManager {
  GpuInfoManager._();

  static core.String glGpuVendor() {
    return _glGpuVendor();
  }

  static core.String glGpuRenderer() {
    return _glGpuRenderer();
  }
}
