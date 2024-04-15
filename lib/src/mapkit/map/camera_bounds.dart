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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;

part 'camera_bounds.containers.dart';

/// The object that is used to interact with the map bounds.
@bindings_annotations.WeakInterface('mapkit.map.CameraBounds')
@bindings_annotations.ContainerData(
    toNative: 'CameraBounds.getNativePtr',
    toPlatform:
        '(val) => CameraBounds.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class CameraBounds implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_CameraBounds_free.cast());

  /// @nodoc
  CameraBounds.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  CameraBounds.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory CameraBounds.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(CameraBounds? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _CameraBounds_check(ptr);
  }

  @internal

  /// @nodoc
  static CameraBounds? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return CameraBounds.fromNativePtr(ptr);
  }

  /// Latitudes should be in range \[-89.3, 89.3\]. Longitudes should be in
  /// range \[-180, 180).
  ///
  mapkit_geometry_geometry.BoundingBox? get latLngBounds {
    return mapkit_geometry_geometry.BoundingBox.fromPointer(
        _CameraBounds_get_latLngBounds(ptr));
  }

  set latLngBounds(mapkit_geometry_geometry.BoundingBox? val) {
    return _CameraBounds_set_latLngBounds(
        ptr, mapkit_geometry_geometry.BoundingBox.toPointer(val));
  }

  /// Minimum available zoom level considering zoom level hint provided via
  /// #setMinZoomPreference.
  core.double getMinZoom() {
    return _CameraBounds_getMinZoom(ptr);
  }

  /// Maximum available zoom level considering zoom level hint provided via
  /// #setMaxZoomPreference
  core.double getMaxZoom() {
    return _CameraBounds_getMaxZoom(ptr);
  }

  /// Set minimum available zoom level hint.
  void setMinZoomPreference(core.double zoom) {
    _CameraBounds_setMinZoomPreference(ptr, zoom);
  }

  /// Set maximum available zoom level hint.
  void setMaxZoomPreference(core.double zoom) {
    _CameraBounds_setMaxZoomPreference(ptr, zoom);
  }

  /// Reset minimum and maximum available zoom level hints.
  void resetMinMaxZoomPreference() {
    _CameraBounds_resetMinMaxZoomPreference(ptr);
  }
}

final _CameraBounds_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CameraBounds_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _CameraBounds_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CameraBounds_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _CameraBounds_get_latLngBounds = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CameraBounds_get_latLngBounds')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _CameraBounds_set_latLngBounds = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CameraBounds_set_latLngBounds')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _CameraBounds_getMinZoom = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CameraBounds_getMinZoom')
    .asFunction();
final core.double Function(ffi.Pointer<ffi.Void>) _CameraBounds_getMaxZoom = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CameraBounds_getMaxZoom')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _CameraBounds_setMinZoomPreference = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_CameraBounds_setMinZoomPreference')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _CameraBounds_setMaxZoomPreference = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_CameraBounds_setMaxZoomPreference')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>)
    _CameraBounds_resetMinMaxZoomPreference = lib.library
        .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CameraBounds_resetMinMaxZoomPreference')
        .asFunction();
