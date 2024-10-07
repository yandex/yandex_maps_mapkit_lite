part of 'offline_cache_manager.dart';

@bindings_annotations.WeakInterface('mapkit.offline_cache.OfflineCacheManager')
@bindings_annotations.ContainerData(
    toNative: 'OfflineCacheManagerImpl.getNativePtr',
    toPlatform:
        '(val) => OfflineCacheManagerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'OfflineCacheManager')
class OfflineCacheManagerImpl implements OfflineCacheManager, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_OfflineCacheManager_free.cast());

  /// @nodoc
  OfflineCacheManagerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  OfflineCacheManagerImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory OfflineCacheManagerImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(OfflineCacheManager? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as OfflineCacheManagerImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _OfflineCacheManager_check(ptr);
  }

  @internal

  /// @nodoc
  static OfflineCacheManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return OfflineCacheManagerImpl.fromNativePtr(ptr);
  }

  core.List<mapkit_offline_cache_region.OfflineCacheRegion> regions() {
    final result = _OfflineCacheManager_regions(ptr);
    exception.checkCallResult();
    return mapkit_offline_cache_region.OfflineCacheRegionContainerExtension
        .toPlatformVector(result);
  }

  void allowUseCellularNetwork(core.bool useCellular) {
    _OfflineCacheManager_allowUseCellularNetwork(ptr, useCellular);
    exception.checkCallResult();
  }

  void addRegionListUpdatesListener(
      mapkit_offline_cache_region_list_updates_listener
          .OfflineMapRegionListUpdatesListener
          regionListUpdatesListener) {
    _OfflineCacheManager_addRegionListUpdatesListener(
        ptr,
        mapkit_offline_cache_region_list_updates_listener
                .OfflineMapRegionListUpdatesListenerImpl
            .getNativePtr(regionListUpdatesListener));
    exception.checkCallResult();
  }

  void removeRegionListUpdatesListener(
      mapkit_offline_cache_region_list_updates_listener
          .OfflineMapRegionListUpdatesListener
          regionListUpdatesListener) {
    _OfflineCacheManager_removeRegionListUpdatesListener(
        ptr,
        mapkit_offline_cache_region_list_updates_listener
                .OfflineMapRegionListUpdatesListenerImpl
            .getNativePtr(regionListUpdatesListener));
    exception.checkCallResult();
  }

  void addErrorListener(OfflineCacheManagerErrorListener errorListener) {
    _OfflineCacheManager_addErrorListener(
        ptr, OfflineCacheManagerErrorListenerImpl.getNativePtr(errorListener));
    exception.checkCallResult();
  }

  void removeErrorListener(OfflineCacheManagerErrorListener errorListener) {
    _OfflineCacheManager_removeErrorListener(
        ptr, OfflineCacheManagerErrorListenerImpl.getNativePtr(errorListener));
    exception.checkCallResult();
  }

  void addRegionListener(
      mapkit_offline_cache_region_listener.OfflineCacheRegionListener
          regionListener) {
    _OfflineCacheManager_addRegionListener(
        ptr,
        mapkit_offline_cache_region_listener.OfflineCacheRegionListenerImpl
            .getNativePtr(regionListener));
    exception.checkCallResult();
  }

  void removeRegionListener(
      mapkit_offline_cache_region_listener.OfflineCacheRegionListener
          regionListener) {
    _OfflineCacheManager_removeRegionListener(
        ptr,
        mapkit_offline_cache_region_listener.OfflineCacheRegionListenerImpl
            .getNativePtr(regionListener));
    exception.checkCallResult();
  }

  core.List<core.String> getCities(core.int regionId) {
    final result = _OfflineCacheManager_getCities(ptr, regionId);
    exception.checkCallResult();
    return to_platform.toVectorString(result);
  }

  mapkit_offline_cache_region_state.OfflineCacheRegionState getState(
      core.int regionId) {
    final result = _OfflineCacheManager_getState(ptr, regionId);
    exception.checkCallResult();
    return mapkit_offline_cache_region_state.OfflineCacheRegionStateImpl
        .fromInt(result);
  }

  core.DateTime? getDownloadedReleaseTime(core.int regionId) {
    final result = _OfflineCacheManager_getDownloadedReleaseTime(ptr, regionId);
    exception.checkCallResult();
    return to_platform.toPlatformFromPointerAbsTimestamp(result);
  }

  core.double getProgress(core.int regionId) {
    final result = _OfflineCacheManager_getProgress(ptr, regionId);
    exception.checkCallResult();
    return result;
  }

  void startDownload(core.int regionId) {
    _OfflineCacheManager_startDownload(ptr, regionId);
    exception.checkCallResult();
  }

  void stopDownload(core.int regionId) {
    _OfflineCacheManager_stopDownload(ptr, regionId);
    exception.checkCallResult();
  }

  void pauseDownload(core.int regionId) {
    _OfflineCacheManager_pauseDownload(ptr, regionId);
    exception.checkCallResult();
  }

  void drop(core.int regionId) {
    _OfflineCacheManager_drop(ptr, regionId);
    exception.checkCallResult();
  }

  core.bool mayBeOutOfAvailableSpace(core.int regionId) {
    final result = _OfflineCacheManager_mayBeOutOfAvailableSpace(ptr, regionId);
    exception.checkCallResult();
    return result;
  }

  core.bool isLegacyPath(core.int regionId) {
    final result = _OfflineCacheManager_isLegacyPath(ptr, regionId);
    exception.checkCallResult();
    return result;
  }

  void computeCacheSize(OfflineCacheManagerSizeListener callback) {
    _OfflineCacheManager_computeCacheSize(
        ptr, OfflineCacheManagerSizeListenerImpl.getNativePtr(callback));
    exception.checkCallResult();
  }

  void requestPath(OfflineCacheManagerPathGetterListener callback) {
    _OfflineCacheManager_requestPath(
        ptr, OfflineCacheManagerPathGetterListenerImpl.getNativePtr(callback));
    exception.checkCallResult();
  }

  void moveData(
    mapkit_offline_cache_data_move_listener.OfflineCacheDataMoveListener
        dataMoveListener, {
    required core.String newPath,
  }) {
    _OfflineCacheManager_moveData(
      ptr,
      to_native.toNativeString(newPath),
      mapkit_offline_cache_data_move_listener.OfflineCacheDataMoveListenerImpl
          .getNativePtr(dataMoveListener),
    );
    exception.checkCallResult();
  }

  void setCachePath(
    OfflineCacheManagerPathSetterListener pathSetterListener, {
    required core.String path,
  }) {
    _OfflineCacheManager_setCachePath(
      ptr,
      to_native.toNativeString(path),
      OfflineCacheManagerPathSetterListenerImpl.getNativePtr(
          pathSetterListener),
    );
    exception.checkCallResult();
  }

  void enableAutoUpdate(core.bool enable) {
    _OfflineCacheManager_enableAutoUpdate(ptr, enable);
    exception.checkCallResult();
  }

  void clear(OfflineCacheManagerClearListener callback) {
    _OfflineCacheManager_clear(
        ptr, OfflineCacheManagerClearListenerImpl.getNativePtr(callback));
    exception.checkCallResult();
  }

  void requestRegionsAtPoint(
      mapkit_geometry_point.Point point,
      mapkit_offline_cache_regions_at_point_listener.RegionsAtPointListener
          callback) {
    _OfflineCacheManager_requestRegionsAtPoint(
        ptr,
        mapkit_geometry_point.PointImpl.toNative(point),
        mapkit_offline_cache_regions_at_point_listener
            .RegionsAtPointListenerImpl.getNativePtr(callback));
    exception.checkCallResult();
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
final void Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point.PointNative,
    ffi
        .Pointer<ffi.Void>) _OfflineCacheManager_requestRegionsAtPoint = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_requestRegionsAtPoint')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _OfflineCacheManager_set =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_offline_cache_OfflineCacheManager_set_')
        .asFunction(isLeaf: true);

final class OfflineCacheManagerClearListenerImpl
    implements OfflineCacheManagerClearListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, OfflineCacheManagerClearListener>{};

  OfflineCacheManagerClearListenerImpl(
      {required void Function() onClearCompleted})
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

  @core.override
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
    return (obj as OfflineCacheManagerClearListenerImpl)._ptr;
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
  final listener =
      OfflineCacheManagerClearListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onClearCompleted();
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

final class OfflineCacheManagerSizeListenerImpl
    implements OfflineCacheManagerSizeListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, OfflineCacheManagerSizeListener>{};

  OfflineCacheManagerSizeListenerImpl(
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

  @core.override
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
    return (obj as OfflineCacheManagerSizeListenerImpl)._ptr;
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
  final listener =
      OfflineCacheManagerSizeListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onSizeComputed(to_platform.toPlatformFromPointerInt64(size));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

final class OfflineCacheManagerPathGetterListenerImpl
    implements OfflineCacheManagerPathGetterListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, OfflineCacheManagerPathGetterListener>{};

  OfflineCacheManagerPathGetterListenerImpl(
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

  @core.override
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
    return (obj as OfflineCacheManagerPathGetterListenerImpl)._ptr;
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
      OfflineCacheManagerPathGetterListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onPathReceived(to_platform.toPlatformString(path));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

final class OfflineCacheManagerPathSetterListenerImpl
    implements OfflineCacheManagerPathSetterListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, OfflineCacheManagerPathSetterListener>{};

  OfflineCacheManagerPathSetterListenerImpl(
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

  @core.override
  void onPathSet() => _onPathSet();
  @core.override
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
    return (obj as OfflineCacheManagerPathSetterListenerImpl)._ptr;
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
      OfflineCacheManagerPathSetterListenerImpl._pointerToListener[_ptr]!;

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
      OfflineCacheManagerPathSetterListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onPathSetError(runtime_error.ErrorImpl.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

final class _OfflineCacheManagerErrorListenerWrapper
    implements ffi.Finalizable {
  _OfflineCacheManagerErrorListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_OfflineCacheManagerErrorListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension OfflineCacheManagerErrorListenerImpl
    on OfflineCacheManagerErrorListener {
  static final _pointerToListener = <ffi.Pointer<ffi.Void>,
      core.WeakReference<OfflineCacheManagerErrorListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<
      OfflineCacheManagerErrorListener,
      _OfflineCacheManagerErrorListenerWrapper?>();

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
      OfflineCacheManagerErrorListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onError(runtime_error.ErrorImpl.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _OfflineCacheManagerErrorListener_onRegionError(ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> error, core.int regionId) {
  final listener =
      OfflineCacheManagerErrorListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onRegionError(
        runtime_error.ErrorImpl.fromNativePtr(error), regionId);
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
