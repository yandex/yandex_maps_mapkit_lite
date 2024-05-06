import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/runtime/local_error.dart'
    as runtime_local_error;

part 'storage_error_listener.impl.dart';

/// Storage error listener. This is a listener to subscribe to storage
/// errors in managers that control some type of storage.
abstract class StorageErrorListener {
  /// Possible error types: - [runtime_local_error.DiskCorruptError]:
  /// Called if local storage is corrupted. -
  /// [runtime_local_error.DiskFullError]: Called if local storage is full.
  /// - [runtime_local_error.DiskWriteAccessError]: Called if the
  /// application cannot get write access to local storage.
  void onStorageError(runtime_local_error.LocalError error);
}
