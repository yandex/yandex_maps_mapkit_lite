part of 'cluster.dart';

@bindings_annotations.WeakInterface('mapkit.map.Cluster')
@bindings_annotations.ContainerData(
    toNative: 'ClusterImpl.getNativePtr',
    toPlatform:
        '(val) => ClusterImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Cluster')
class ClusterImpl implements Cluster, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Cluster_free.cast());

  /// @nodoc
  ClusterImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  ClusterImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory ClusterImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Cluster? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as ClusterImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _Cluster_check(ptr);
  }

  @internal

  /// @nodoc
  static Cluster? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return ClusterImpl.fromNativePtr(ptr);
  }

  @core.override
  core.List<mapkit_map_placemark.PlacemarkMapObject> get placemarks {
    return mapkit_map_placemark.PlacemarkMapObjectContainerExtension
        .toPlatformVector(_Cluster_get_placemarks(ptr));
  }

  @core.override
  core.int get size {
    return _Cluster_get_size(ptr);
  }

  @core.override
  mapkit_map_placemark.PlacemarkMapObject get appearance {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _Cluster_get_appearance(ptr));
  }

  void addClusterTapListener(
      mapkit_map_cluster_tap_listener.ClusterTapListener clusterTapListener) {
    _Cluster_addClusterTapListener(
        ptr,
        mapkit_map_cluster_tap_listener.ClusterTapListenerImpl.getNativePtr(
            clusterTapListener));
  }

  void removeClusterTapListener(
      mapkit_map_cluster_tap_listener.ClusterTapListener clusterTapListener) {
    _Cluster_removeClusterTapListener(
        ptr,
        mapkit_map_cluster_tap_listener.ClusterTapListenerImpl.getNativePtr(
            clusterTapListener));
  }
}

final _Cluster_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Cluster_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Cluster_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Cluster_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _Cluster_get_placemarks = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Cluster_get_placemarks')
        .asFunction();

final core.int Function(ffi.Pointer<ffi.Void>) _Cluster_get_size = lib.library
    .lookup<ffi.NativeFunction<ffi.Uint32 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Cluster_get_size')
    .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _Cluster_get_appearance = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Cluster_get_appearance')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Cluster_addClusterTapListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Cluster_addClusterTapListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Cluster_removeClusterTapListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Cluster_removeClusterTapListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _Cluster_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_Cluster_set_')
    .asFunction(isLeaf: true);
