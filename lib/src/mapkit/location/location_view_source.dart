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

part 'location_view_source.containers.dart';

/// Base class interface of a location-view source.
@bindings_annotations.ContainerData(
    toNative: 'LocationViewSource.getNativePtr',
    toPlatform:
        '(val) => LocationViewSource.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class LocationViewSource implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_LocationViewSource_free.cast());

  /// @nodoc
  LocationViewSource.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  LocationViewSource.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(LocationViewSource? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  @internal

  /// @nodoc
  static LocationViewSource? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LocationViewSource.fromNativePtr(ptr);
  }
}

final _LocationViewSource_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_LocationViewSource_free');
