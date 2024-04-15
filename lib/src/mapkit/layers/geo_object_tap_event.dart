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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geo_object.dart'
    as mapkit_geo_object;

part 'geo_object_tap_event.containers.dart';

/// Information about the tapped object.
@bindings_annotations.WeakInterface('mapkit.layers.GeoObjectTapEvent')
@bindings_annotations.ContainerData(
    toNative: 'GeoObjectTapEvent.getNativePtr',
    toPlatform:
        '(val) => GeoObjectTapEvent.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class GeoObjectTapEvent implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_GeoObjectTapEvent_free.cast());

  /// @nodoc
  GeoObjectTapEvent.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  GeoObjectTapEvent.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory GeoObjectTapEvent.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectTapEvent? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _GeoObjectTapEvent_check(ptr);
  }

  @internal

  /// @nodoc
  static GeoObjectTapEvent? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return GeoObjectTapEvent.fromNativePtr(ptr);
  }

  /// Return GeoObject The object that was tapped.
  mapkit_geo_object.GeoObject get geoObject {
    return mapkit_geo_object.GeoObject.fromNativePtr(
        _GeoObjectTapEvent_get_geoObject(ptr));
  }
}

final _GeoObjectTapEvent_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_GeoObjectTapEvent_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _GeoObjectTapEvent_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_GeoObjectTapEvent_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectTapEvent_get_geoObject = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_layers_GeoObjectTapEvent_get_geoObject')
        .asFunction();
