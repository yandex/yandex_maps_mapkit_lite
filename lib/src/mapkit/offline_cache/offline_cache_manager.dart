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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/offline_cache/data_move_listener.dart'
    as mapkit_offline_cache_data_move_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/offline_cache/region.dart'
    as mapkit_offline_cache_region;
import 'package:yandex_maps_mapkit_lite/src/mapkit/offline_cache/region_list_updates_listener.dart'
    as mapkit_offline_cache_region_list_updates_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/offline_cache/region_listener.dart'
    as mapkit_offline_cache_region_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/offline_cache/region_state.dart'
    as mapkit_offline_cache_region_state;
import 'package:yandex_maps_mapkit_lite/src/mapkit/offline_cache/regions_at_point_listener.dart'
    as mapkit_offline_cache_regions_at_point_listener;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;
import 'package:yandex_maps_mapkit_lite/src/runtime/local_error.dart'
    as runtime_local_error;
import 'package:yandex_maps_mapkit_lite/src/runtime/network/errors.dart'
    as runtime_network_errors;

part 'offline_cache_manager.containers.dart';
part 'offline_cache_manager.impl.dart';

/// Offline cache manager.
/// @attention This feature is not available in the free MapKit version.
abstract class OfflineCacheManager implements ffi.Finalizable {
  /// Copying a list of regions from memory. All changes of regions won't
  /// affected on on the collection.
  core.List<mapkit_offline_cache_region.OfflineCacheRegion> regions();

  /// Indicates whether to allow downloading using cellular networks (3G,
  /// LTE, and other). Disallowed by default.
  void allowUseCellularNetwork(core.bool useCellular);

  /// Subscribe on update of region list
  ///
  /// The class does not retain the object in the 'regionListUpdatesListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addRegionListUpdatesListener(
      mapkit_offline_cache_region_list_updates_listener
          .OfflineMapRegionListUpdatesListener
          regionListUpdatesListener);

  /// Unsubscribe from region list update
  void removeRegionListUpdatesListener(
      mapkit_offline_cache_region_list_updates_listener
          .OfflineMapRegionListUpdatesListener
          regionListUpdatesListener);

  /// Subscribe on errors
  ///
  /// The class does not retain the object in the 'errorListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addErrorListener(OfflineCacheManagerErrorListener errorListener);

  /// Unsubscribe from errors
  void removeErrorListener(OfflineCacheManagerErrorListener errorListener);

  /// Subscribe on status events
  ///
  /// The class does not retain the object in the 'regionListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addRegionListener(
      mapkit_offline_cache_region_listener.OfflineCacheRegionListener
          regionListener);

  /// Unsubscribe from status events
  void removeRegionListener(
      mapkit_offline_cache_region_listener.OfflineCacheRegionListener
          regionListener);

  /// Returns a list of cities.
  core.List<core.String> getCities(core.int regionId);

  /// Current region state
  mapkit_offline_cache_region_state.OfflineCacheRegionState getState(
      core.int regionId);

  /// Release time of downloaded region files
  core.DateTime? getDownloadedReleaseTime(core.int regionId);

  /// Current region progress \[0,1\]. For downloaded files returns 1; If
  /// we haven't start download yet, returns 0;
  core.double getProgress(core.int regionId);

  /// Start to download new offline cache for the region or update if
  /// region has been downloaded
  void startDownload(core.int regionId);

  /// Stop downloading of region
  void stopDownload(core.int regionId);

  /// Pause downloading of region
  void pauseDownload(core.int regionId);

  /// Drop region data from the device. If data is being downloaded then
  /// downloading is cancelled.
  void drop(core.int regionId);

  /// Returns true if available disk space might not be enough for
  /// installation of the region data.
  core.bool mayBeOutOfAvailableSpace(core.int regionId);

  /// Returns true if region has files with legacy localized path. If
  /// region in downloading state result may be incorrect.
  core.bool isLegacyPath(core.int regionId);

  /// Calculates the full cache size in bytes.
  void computeCacheSize(OfflineCacheManagerSizeListener callback);

  /// Provides the data path for offline cache files.
  void requestPath(OfflineCacheManagerPathGetterListener callback);

  /// Moves offline caches to the specified folder. This operation is
  /// non-cancellable. If there is already a pending operation to set the
  /// cache path, it throws an error (Android). If the application exits
  /// before the operation is completed, it does not take effect, but
  /// garbage will not be cleared.
  ///
  /// The class does not retain the object in the 'dataMoveListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  ///
  /// [newPath] New path to store data.
  /// [dataMoveListener] It will be unsubscribed automatically when the
  /// operation is completed or fails with an error.
  void moveData(
    mapkit_offline_cache_data_move_listener.OfflineCacheDataMoveListener
        dataMoveListener, {
    required core.String newPath,
  });

  /// Sets a new path for caches. If the specified path contains an
  /// existing cache, this cache will be used; otherwise, a new cache will
  /// be initialized.
  void setCachePath(
    OfflineCacheManagerPathSetterListener pathSetterListener, {
    required core.String path,
  });

  /// Enables autoupdating downloaded caches when they become outdated.
  void enableAutoUpdate(core.bool enable);

  /// Erases all data for downloads and regions and wipes the cache. Forces
  /// reloading the list from the remote source
  void clear(OfflineCacheManagerClearListener callback);

  /// Provides ids of regions containing specified point. Some of the
  /// returned regions may not be available in current regions list.
  void requestRegionsAtPoint(
      mapkit_geometry_point.Point point,
      mapkit_offline_cache_regions_at_point_listener.RegionsAtPointListener
          callback);

  core.bool isValid();
}

abstract final class OfflineCacheManagerClearListener {
  factory OfflineCacheManagerClearListener(
      {required void Function() onClearCompleted}) {
    return OfflineCacheManagerClearListenerImpl(
      onClearCompleted: onClearCompleted,
    );
  }

  /// Cache was cleared.
  void onClearCompleted();
}

abstract final class OfflineCacheManagerSizeListener {
  factory OfflineCacheManagerSizeListener(
      {required void Function(core.int? size) onSizeComputed}) {
    return OfflineCacheManagerSizeListenerImpl(
      onSizeComputed: onSizeComputed,
    );
  }

  /// Size was calculated.
  void onSizeComputed(core.int? size);
}

abstract final class OfflineCacheManagerPathGetterListener {
  factory OfflineCacheManagerPathGetterListener(
      {required void Function(core.String path) onPathReceived}) {
    return OfflineCacheManagerPathGetterListenerImpl(
      onPathReceived: onPathReceived,
    );
  }

  /// Path was received.
  void onPathReceived(core.String path);
}

abstract final class OfflineCacheManagerPathSetterListener {
  factory OfflineCacheManagerPathSetterListener(
      {required void Function() onPathSet,
      required void Function(runtime_error.Error error) onPathSetError}) {
    return OfflineCacheManagerPathSetterListenerImpl(
      onPathSet: onPathSet,
      onPathSetError: onPathSetError,
    );
  }

  /// New cache path was set.
  void onPathSet();

  /// Error occurred. Cache path wasn't change Expected error types: 1.
  /// [mapkit_offline_cache_errors.CachePathUnavailable]: target path
  /// doesn't exist or there no read permissions
  void onPathSetError(runtime_error.Error error);
}

abstract class OfflineCacheManagerErrorListener {
  ///
  /// [error] Error has occurred in offline cache manager. Expected error
  /// types: 1. [runtime_network_errors.RemoteError] 2.
  /// [runtime_local_error.LocalError]
  void onError(runtime_error.Error error);

  ///
  /// [error] Error has occurred in specific region. Expected error types:
  /// 1. [runtime_network_errors.RemoteError] 2.
  /// [runtime_local_error.LocalError]
  void onRegionError(runtime_error.Error error, core.int regionId);
}
