import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;

part 'logger.impl.dart';

///
class Logger {
  Logger._();

  static void error(core.String str) {
    _error(
      str,
    );
  }

  static void warn(core.String str) {
    _warn(
      str,
    );
  }

  static void info(core.String str) {
    _info(
      str,
    );
  }

  static void debug(core.String str) {
    _debug(
      str,
    );
  }
}
