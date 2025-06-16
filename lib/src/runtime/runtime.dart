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

part 'runtime.impl.dart';

/// @nodoc
class Runtime {
  Runtime._();

  static core.String version() {
    return _version();
  }

  static void setPreinitializationOptions(
      core.Map<core.String, core.String> runtimeOptions) {
    _setPreinitializationOptions(
      runtimeOptions,
    );
  }

  /// only for flutter
  static core.int onDartVMCreated() {
    return _onDartVMCreated();
  }

  static void onDetachedFromEngine(core.int engineId) {
    _onDetachedFromEngine(
      engineId,
    );
  }
}
