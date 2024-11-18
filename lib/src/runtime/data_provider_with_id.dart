import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;

part 'data_provider_with_id.impl.dart';

/// Provides any data.
abstract class DataProviderWithId {
  /// Use the same id for the identical data, to prevent repeated loading
  /// of the same data into RAM and VRAM.
  core.String providerId();

  /// Returns data.
  core.Future<typed_data.ByteBuffer> load();
}
