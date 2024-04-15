import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/cluster_tap_listener.dart'
    as mapkit_map_cluster_tap_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;

part 'cluster.containers.dart';

@bindings_annotations.WeakInterface('mapkit.map.Cluster')
@bindings_annotations.ContainerData(
    toNative: 'Cluster.getNativePtr',
    toPlatform:
        '(val) => Cluster.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class Cluster implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Cluster_free.cast());

  /// @nodoc
  Cluster.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  Cluster.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory Cluster.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Cluster? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _Cluster_check(ptr);
  }

  @internal

  /// @nodoc
  static Cluster? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return Cluster.fromNativePtr(ptr);
  }

  /// A list of placemarks the cluster contains.
  core.List<mapkit_map_placemark.PlacemarkMapObject> get placemarks {
    return mapkit_map_placemark.PlacemarkMapObjectContainerExtension
        .toPlatformVector(_Cluster_get_placemarks(ptr));
  }

  /// Cluster size.
  core.int get size {
    return _Cluster_get_size(ptr);
  }

  /// Cluster representation displayed on the map.
  mapkit_map_placemark.PlacemarkMapObject get appearance {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _Cluster_get_appearance(ptr));
  }

  /// Adds a tap listener for cluster.
  ///
  /// The class does not retain the object in the 'clusterTapListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addClusterTapListener(
      mapkit_map_cluster_tap_listener.ClusterTapListener clusterTapListener) {
    _Cluster_addClusterTapListener(
        ptr,
        mapkit_map_cluster_tap_listener.ClusterTapListener.getNativePtr(
            clusterTapListener));
  }

  /// Removes tap listener.
  void removeClusterTapListener(
      mapkit_map_cluster_tap_listener.ClusterTapListener clusterTapListener) {
    _Cluster_removeClusterTapListener(
        ptr,
        mapkit_map_cluster_tap_listener.ClusterTapListener.getNativePtr(
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
