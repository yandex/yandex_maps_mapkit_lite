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
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location.dart'
    as mapkit_location_location;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location_manager.dart'
    as mapkit_location_location_manager;

part 'dummy_location_manager.containers.dart';

/// Provides the ability to set any location and notify all consumers of
/// this location.
///
/// This is a very simple location manager that is responsible for
/// passing any locations via setLocation method and notifying all
/// consumers.
///
/// @attention The main reason why we need this class is to allow the
/// user to set this LocationManager to Guide via setLocationManager,
/// just to correct any desirable location via Guide.
@bindings_annotations.ContainerData(
    toNative: 'DummyLocationManager.getNativePtr',
    toPlatform:
        '(val) => DummyLocationManager.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class DummyLocationManager extends mapkit_location_location_manager
    .LocationManager implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_DummyLocationManager_free.cast());

  /// @nodoc
  DummyLocationManager.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  DummyLocationManager.fromNativePtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DummyLocationManager? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  @internal

  /// @nodoc
  static DummyLocationManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DummyLocationManager.fromNativePtr(ptr);
  }

  /// Sets a location and notifies all consumers of this location.
  ///
  /// [location] Any desirable location that we would like to provide.
  void setLocation(mapkit_location_location.Location location) {
    _DummyLocationManager_setLocation(
        ptr, mapkit_location_location.Location.toNative(location));
  }
}

final _DummyLocationManager_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_DummyLocationManager_free');

final void Function(
        ffi.Pointer<ffi.Void>, mapkit_location_location.LocationNative)
    _DummyLocationManager_setLocation = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_location_location.LocationNative)>>(
            'yandex_flutter_mapkit_location_DummyLocationManager_setLocation')
        .asFunction();
