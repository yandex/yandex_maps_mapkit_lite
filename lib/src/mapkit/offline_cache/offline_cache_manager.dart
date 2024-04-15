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
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;
import 'package:yandex_maps_mapkit_lite/src/runtime/local_error.dart'
    as runtime_local_error;
import 'package:yandex_maps_mapkit_lite/src/runtime/network/errors.dart'
    as runtime_network_errors;

part 'offline_cache_manager.containers.dart';

/// Offline cache manager.
/// @attention This feature is not available in the free MapKit version.
@bindings_annotations.WeakInterface('mapkit.offline_cache.OfflineCacheManager')
@bindings_annotations.ContainerData(
    toNative: 'OfflineCacheManager.getNativePtr',
    toPlatform:
        '(val) => OfflineCacheManager.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class OfflineCacheManager implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_OfflineCacheManager_free.cast());

  /// @nodoc
  OfflineCacheManager.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  OfflineCacheManager.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory OfflineCacheManager.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(OfflineCacheManager? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _OfflineCacheManager_check(ptr);
  }

  @internal

  /// @nodoc
  static OfflineCacheManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return OfflineCacheManager.fromNativePtr(ptr);
  }

  /// Copying a list of regions from memory. All changes of regions won't
  /// affected on on the collection.
  core.List<mapkit_offline_cache_region.OfflineCacheRegion> regions() {
    return mapkit_offline_cache_region.OfflineCacheRegionContainerExtension
        .toPlatformVector(_OfflineCacheManager_regions(ptr));
  }

  /// Indicates whether to allow downloading using cellular networks (3G,
  /// LTE, and other). Disallowed by default.
  void allowUseCellularNetwork(core.bool useCellular) {
    _OfflineCacheManager_allowUseCellularNetwork(ptr, useCellular);
  }

  /// Subscribe on update of region list
  ///
  /// The class does not retain the object in the 'regionListUpdatesListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addRegionListUpdatesListener(
      mapkit_offline_cache_region_list_updates_listener
          .OfflineMapRegionListUpdatesListener
          regionListUpdatesListener) {
    _OfflineCacheManager_addRegionListUpdatesListener(
        ptr,
        mapkit_offline_cache_region_list_updates_listener
                .OfflineMapRegionListUpdatesListener
            .getNativePtr(regionListUpdatesListener));
  }

  /// Unsubscribe from region list update
  void removeRegionListUpdatesListener(
      mapkit_offline_cache_region_list_updates_listener
          .OfflineMapRegionListUpdatesListener
          regionListUpdatesListener) {
    _OfflineCacheManager_removeRegionListUpdatesListener(
        ptr,
        mapkit_offline_cache_region_list_updates_listener
                .OfflineMapRegionListUpdatesListener
            .getNativePtr(regionListUpdatesListener));
  }

  /// Subscribe on errors
  ///
  /// The class does not retain the object in the 'errorListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addErrorListener(OfflineCacheManagerErrorListener errorListener) {
    _OfflineCacheManager_addErrorListener(
        ptr, OfflineCacheManagerErrorListener.getNativePtr(errorListener));
  }

  /// Unsubscribe from errors
  void removeErrorListener(OfflineCacheManagerErrorListener errorListener) {
    _OfflineCacheManager_removeErrorListener(
        ptr, OfflineCacheManagerErrorListener.getNativePtr(errorListener));
  }

  /// Subscribe on status events
  ///
  /// The class does not retain the object in the 'regionListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addRegionListener(
      mapkit_offline_cache_region_listener.OfflineCacheRegionListener
          regionListener) {
    _OfflineCacheManager_addRegionListener(
        ptr,
        mapkit_offline_cache_region_listener.OfflineCacheRegionListener
            .getNativePtr(regionListener));
  }

  /// Unsubscribe from status events
  void removeRegionListener(
      mapkit_offline_cache_region_listener.OfflineCacheRegionListener
          regionListener) {
    _OfflineCacheManager_removeRegionListener(
        ptr,
        mapkit_offline_cache_region_listener.OfflineCacheRegionListener
            .getNativePtr(regionListener));
  }

  /// Returns a list of cities.
  core.List<core.String> getCities(core.int regionId) {
    return to_platform
        .toVectorString(_OfflineCacheManager_getCities(ptr, regionId));
  }

  /// Current region state
  mapkit_offline_cache_region_state.OfflineCacheRegionState getState(
      core.int regionId) {
    return mapkit_offline_cache_region_state.OfflineCacheRegionState.fromInt(
        _OfflineCacheManager_getState(ptr, regionId));
  }

  /// Release time of downloaded region files
  core.DateTime? getDownloadedReleaseTime(core.int regionId) {
    return to_platform.toPlatformFromPointerAbsTimestamp(
        _OfflineCacheManager_getDownloadedReleaseTime(ptr, regionId));
  }

  /// Current region progress \[0,1\]. For downloaded files returns 1; If
  /// we haven't start download yet, returns 0;
  core.double getProgress(core.int regionId) {
    return _OfflineCacheManager_getProgress(ptr, regionId);
  }

  /// Start to download new offline cache for the region or update if
  /// region has been downloaded
  void startDownload(core.int regionId) {
    _OfflineCacheManager_startDownload(ptr, regionId);
  }

  /// Stop downloading of region
  void stopDownload(core.int regionId) {
    _OfflineCacheManager_stopDownload(ptr, regionId);
  }

  /// Pause downloading of region
  void pauseDownload(core.int regionId) {
    _OfflineCacheManager_pauseDownload(ptr, regionId);
  }

  /// Drop region data from the device. If data is being downloaded then
  /// downloading is cancelled.
  void drop(core.int regionId) {
    _OfflineCacheManager_drop(ptr, regionId);
  }

  /// Returns true if available disk space might not be enough for
  /// installation of the region data.
  core.bool mayBeOutOfAvailableSpace(core.int regionId) {
    return _OfflineCacheManager_mayBeOutOfAvailableSpace(ptr, regionId);
  }

  /// Returns true if region has files with legacy localized path. If
  /// region in downloading state result may be incorrect.
  core.bool isLegacyPath(core.int regionId) {
    return _OfflineCacheManager_isLegacyPath(ptr, regionId);
  }

  /// Calculates the full cache size in bytes.
  void computeCacheSize(OfflineCacheManagerSizeListener callback) {
    _OfflineCacheManager_computeCacheSize(
        ptr, OfflineCacheManagerSizeListener.getNativePtr(callback));
  }

  /// Provides the data path for offline cache files.
  void requestPath(OfflineCacheManagerPathGetterListener callback) {
    _OfflineCacheManager_requestPath(
        ptr, OfflineCacheManagerPathGetterListener.getNativePtr(callback));
  }

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
  }) {
    _OfflineCacheManager_moveData(
      ptr,
      to_native.toNativeString(newPath),
      mapkit_offline_cache_data_move_listener.OfflineCacheDataMoveListener
          .getNativePtr(dataMoveListener),
    );
  }

  /// Sets a new path for caches. If the specified path contains an
  /// existing cache, this cache will be used; otherwise, a new cache will
  /// be initialized.
  void setCachePath(
    OfflineCacheManagerPathSetterListener pathSetterListener, {
    required core.String path,
  }) {
    _OfflineCacheManager_setCachePath(
      ptr,
      to_native.toNativeString(path),
      OfflineCacheManagerPathSetterListener.getNativePtr(pathSetterListener),
    );
  }

  /// Enables autoupdating downloaded caches when they become outdated.
  void enableAutoUpdate(core.bool enable) {
    _OfflineCacheManager_enableAutoUpdate(ptr, enable);
  }

  /// Erases all data for downloads and regions and wipes the cache. Forces
  /// reloading the list from the remote source
  void clear(OfflineCacheManagerClearListener callback) {
    _OfflineCacheManager_clear(
        ptr, OfflineCacheManagerClearListener.getNativePtr(callback));
  }
}

final _OfflineCacheManager_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _OfflineCacheManager_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _OfflineCacheManager_regions = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_regions')
        .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core
        .bool) _OfflineCacheManager_allowUseCellularNetwork = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_allowUseCellularNetwork')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<
        ffi.Void>) _OfflineCacheManager_addRegionListUpdatesListener = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_addRegionListUpdatesListener')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<
        ffi.Void>) _OfflineCacheManager_removeRegionListUpdatesListener = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_removeRegionListUpdatesListener')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _OfflineCacheManager_addErrorListener = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_addErrorListener')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _OfflineCacheManager_removeErrorListener = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_removeErrorListener')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _OfflineCacheManager_addRegionListener = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_addRegionListener')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _OfflineCacheManager_removeRegionListener = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_removeRegionListener')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>, core.int)
    _OfflineCacheManager_getCities = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_getCities')
        .asFunction();
final core.int Function(ffi.Pointer<ffi.Void>, core.int)
    _OfflineCacheManager_getState = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Int64 Function(ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_getState')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    core
        .int) _OfflineCacheManager_getDownloadedReleaseTime = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_getDownloadedReleaseTime')
    .asFunction();
final core.double Function(
    ffi.Pointer<ffi.Void>,
    core
        .int) _OfflineCacheManager_getProgress = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Float Function(ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_getProgress')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core
        .int) _OfflineCacheManager_startDownload = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_startDownload')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core
        .int) _OfflineCacheManager_stopDownload = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_stopDownload')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core
        .int) _OfflineCacheManager_pauseDownload = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_pauseDownload')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _OfflineCacheManager_drop =
    lib
        .library
        .lookup<
                ffi
                .NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_drop')
        .asFunction();
final core.bool Function(
    ffi.Pointer<ffi.Void>,
    core
        .int) _OfflineCacheManager_mayBeOutOfAvailableSpace = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_mayBeOutOfAvailableSpace')
    .asFunction();
final core.bool Function(
    ffi.Pointer<ffi.Void>,
    core
        .int) _OfflineCacheManager_isLegacyPath = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Uint32)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_isLegacyPath')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _OfflineCacheManager_computeCacheSize = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_computeCacheSize')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _OfflineCacheManager_requestPath = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_requestPath')
    .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, native_types.NativeString, ffi.Pointer<ffi.Void>)
    _OfflineCacheManager_moveData = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        native_types.NativeString, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_moveData')
        .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    native_types.NativeString,
    ffi
        .Pointer<ffi.Void>) _OfflineCacheManager_setCachePath = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>,
                    native_types.NativeString, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_setCachePath')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core
        .bool) _OfflineCacheManager_enableAutoUpdate = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_enableAutoUpdate')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _OfflineCacheManager_clear = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_clear')
        .asFunction();

class OfflineCacheManagerClearListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, OfflineCacheManagerClearListener>{};

  OfflineCacheManagerClearListener({required void Function() onClearCompleted})
      : _ptr = _OfflineCacheManagerClearListener_new(
            ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
                _OfflineCacheManagerClearListener_onClearCompleted)),
        _onClearCompleted = onClearCompleted {
    _pointerToListener[_ptr] = this;
    _OfflineCacheManagerClearListenersetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  /// Cache was cleared.
  void onClearCompleted() => _onClearCompleted();

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function() _onClearCompleted;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(
      OfflineCacheManagerClearListener? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _OfflineCacheManagerClearListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_OfflineCacheManagerClearListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)
    _OfflineCacheManagerClearListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_OfflineCacheManagerClearListener_new')
        .asFunction(isLeaf: true);

void _OfflineCacheManagerClearListener_onClearCompleted(
    ffi.Pointer<ffi.Void> _ptr) {
  final listener = OfflineCacheManagerClearListener._pointerToListener[_ptr]!;

  try {
    listener.onClearCompleted();
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

class OfflineCacheManagerSizeListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, OfflineCacheManagerSizeListener>{};

  OfflineCacheManagerSizeListener(
      {required void Function(core.int? size) onSizeComputed})
      : _ptr = _OfflineCacheManagerSizeListener_new(ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _OfflineCacheManagerSizeListener_onSizeComputed)),
        _onSizeComputed = onSizeComputed {
    _pointerToListener[_ptr] = this;
    _OfflineCacheManagerSizeListenersetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  /// Size was calculated.
  void onSizeComputed(core.int? size) => _onSizeComputed(size);

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function(core.int?) _onSizeComputed;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(
      OfflineCacheManagerSizeListener? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _OfflineCacheManagerSizeListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_OfflineCacheManagerSizeListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _OfflineCacheManagerSizeListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_OfflineCacheManagerSizeListener_new')
        .asFunction(isLeaf: true);

void _OfflineCacheManagerSizeListener_onSizeComputed(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> size) {
  final listener = OfflineCacheManagerSizeListener._pointerToListener[_ptr]!;

  try {
    listener.onSizeComputed(to_platform.toPlatformFromPointerInt64(size));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

class OfflineCacheManagerPathGetterListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, OfflineCacheManagerPathGetterListener>{};

  OfflineCacheManagerPathGetterListener(
      {required void Function(core.String path) onPathReceived})
      : _ptr = _OfflineCacheManagerPathGetterListener_new(
            ffi.Pointer.fromFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>(
                _OfflineCacheManagerPathGetterListener_onPathReceived)),
        _onPathReceived = onPathReceived {
    _pointerToListener[_ptr] = this;
    _OfflineCacheManagerPathGetterListenersetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  /// Path was received.
  void onPathReceived(core.String path) => _onPathReceived(path);

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function(core.String) _onPathReceived;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(
      OfflineCacheManagerPathGetterListener? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _OfflineCacheManagerPathGetterListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_OfflineCacheManagerPathGetterListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)>>)
    _OfflineCacheManagerPathGetterListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)>>)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_OfflineCacheManagerPathGetterListener_new')
        .asFunction(isLeaf: true);

void _OfflineCacheManagerPathGetterListener_onPathReceived(
    ffi.Pointer<ffi.Void> _ptr, native_types.NativeString path) {
  final listener =
      OfflineCacheManagerPathGetterListener._pointerToListener[_ptr]!;

  try {
    listener.onPathReceived(to_platform.toPlatformString(path));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

class OfflineCacheManagerPathSetterListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, OfflineCacheManagerPathSetterListener>{};

  OfflineCacheManagerPathSetterListener(
      {required void Function() onPathSet,
      required void Function(runtime_error.Error error) onPathSetError})
      : _ptr = _OfflineCacheManagerPathSetterListener_new(
            ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
                _OfflineCacheManagerPathSetterListener_onPathSet),
            ffi.Pointer.fromFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
                _OfflineCacheManagerPathSetterListener_onPathSetError)),
        _onPathSet = onPathSet,
        _onPathSetError = onPathSetError {
    _pointerToListener[_ptr] = this;
    _OfflineCacheManagerPathSetterListenersetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  /// New cache path was set.
  void onPathSet() => _onPathSet();

  /// Error occurred. Cache path wasn't change Expected error types: 1.
  /// [mapkit_offline_cache_errors.CachePathUnavailable]: target path
  /// doesn't exist or there no read permissions
  void onPathSetError(runtime_error.Error error) => _onPathSetError(error);

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function() _onPathSet;
  final void Function(runtime_error.Error) _onPathSetError;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(
      OfflineCacheManagerPathSetterListener? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _OfflineCacheManagerPathSetterListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_OfflineCacheManagerPathSetterListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _OfflineCacheManagerPathSetterListener_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<
                        ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>('yandex_flutter_mapkit_offline_cache_OfflineCacheManager_OfflineCacheManagerPathSetterListener_new')
        .asFunction(isLeaf: true);

void _OfflineCacheManagerPathSetterListener_onPathSet(
    ffi.Pointer<ffi.Void> _ptr) {
  final listener =
      OfflineCacheManagerPathSetterListener._pointerToListener[_ptr]!;

  try {
    listener.onPathSet();
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

void _OfflineCacheManagerPathSetterListener_onPathSetError(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> error) {
  final listener =
      OfflineCacheManagerPathSetterListener._pointerToListener[_ptr]!;

  try {
    listener.onPathSetError(runtime_error.Error.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

/// @nodoc
class _OfflineCacheManagerErrorListenerWrapper implements ffi.Finalizable {
  _OfflineCacheManagerErrorListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_OfflineCacheManagerErrorListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

abstract class OfflineCacheManagerErrorListener {
  static final _pointerToListener = <ffi.Pointer<ffi.Void>,
      core.WeakReference<OfflineCacheManagerErrorListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<
      OfflineCacheManagerErrorListener,
      _OfflineCacheManagerErrorListenerWrapper?>();

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

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(
      OfflineCacheManagerErrorListener obj) {
    final ptr = _OfflineCacheManagerErrorListener_new(
        ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _OfflineCacheManagerErrorListener_onError),
        ffi.Pointer.fromFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
                ffi.Uint32)>(_OfflineCacheManagerErrorListener_onRegionError));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _OfflineCacheManagerErrorListenerWrapper(ptr);
    _OfflineCacheManagerErrorListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(
      OfflineCacheManagerErrorListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _OfflineCacheManagerErrorListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_OfflineCacheManagerErrorListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Uint32)>>)
    _OfflineCacheManagerErrorListener_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Uint32)>>)>>('yandex_flutter_mapkit_offline_cache_OfflineCacheManager_OfflineCacheManagerErrorListener_new')
        .asFunction(isLeaf: true);

final _OfflineCacheManagerErrorListener_free = lib.library.lookup<
        ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
    'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_OfflineCacheManagerErrorListener_free');
void _OfflineCacheManagerErrorListener_onError(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> error) {
  final listener =
      OfflineCacheManagerErrorListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onError(runtime_error.Error.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _OfflineCacheManagerErrorListener_onRegionError(ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> error, core.int regionId) {
  final listener =
      OfflineCacheManagerErrorListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onRegionError(runtime_error.Error.fromNativePtr(error), regionId);
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
