import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/storage/storage_error_listener.dart'
    as mapkit_storage_storage_error_listener;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;

part 'storage_manager.containers.dart';
part 'storage_manager.impl.dart';

/// Storage manager. This is a manager that controls temporary cache
/// storages (for example map tiles).
abstract class StorageManager implements ffi.Finalizable {
  /// Subscribes to storage events.
  ///
  /// The class does not retain the object in the 'errorListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addStorageErrorListener(
      mapkit_storage_storage_error_listener.StorageErrorListener errorListener);

  /// Unsubscribes from storage events.
  void removeStorageErrorListener(
      mapkit_storage_storage_error_listener.StorageErrorListener errorListener);

  /// Computes storage size in bytes.
  void computeSize(StorageManagerSizeListener callback);

  /// Removes all data.
  void clear(StorageManagerClearListener callback);

  /// Sets the maximum tile cache size to limit bytes. When the limit is
  /// reached, old tiles are removed.
  void setMaxTileStorageSize(
    StorageManagerSizeListener callback, {
    required core.int limit,
  });

  /// Resets the tile cache size limit.
  void resetMaxTileStorageSize(StorageManagerSizeListener callback);

  /// Obtains the current storage size limit in bytes.
  void maxTileStorageSize(StorageManagerSizeListener callback);

  core.bool isValid();
}

abstract final class StorageManagerClearListener {
  factory StorageManagerClearListener(
      {required void Function() onClearCompleted}) {
    return StorageManagerClearListenerImpl(
      onClearCompleted: onClearCompleted,
    );
  }

  /// Storage was cleared.
  void onClearCompleted();
}

abstract final class StorageManagerSizeListener {
  factory StorageManagerSizeListener(
      {required void Function(core.int? bytes) onSuccess,
      required void Function(runtime_error.Error error) onError}) {
    return StorageManagerSizeListenerImpl(
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  /// Storage size was computed/modify.
  void onSuccess(core.int? bytes);

  /// There was an error during size operation.
  void onError(runtime_error.Error error);
}
