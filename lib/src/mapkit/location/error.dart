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
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;

part 'error.containers.dart';

/// This error is returned if the location is not available.
@bindings_annotations.WeakInterface('mapkit.location.LocationUnavailableError')
@bindings_annotations.ContainerData(
    toNative: 'LocationUnavailableError.getNativePtr',
    toPlatform:
        '(val) => LocationUnavailableError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class LocationUnavailableError extends runtime_error.Error
    implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_LocationUnavailableError_free.cast());

  /// @nodoc
  LocationUnavailableError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  LocationUnavailableError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory LocationUnavailableError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(LocationUnavailableError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _LocationUnavailableError_check(ptr);
  }

  @internal

  /// @nodoc
  static LocationUnavailableError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LocationUnavailableError.fromNativePtr(ptr);
  }
}

final _LocationUnavailableError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationUnavailableError_free');
final core.bool Function(ffi.Pointer<ffi.Void>)
    _LocationUnavailableError_check = lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_location_LocationUnavailableError_check')
        .asFunction(isLeaf: true);
