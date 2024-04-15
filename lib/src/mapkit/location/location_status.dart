import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'location_status.containers.dart';

/// Defines if the location is available or not.
@bindings_annotations.ContainerData(
    toNative: 'LocationStatus.toPointer',
    toPlatform: '(val) => LocationStatus.fromPointer(val, needFree: false)')
enum LocationStatus {
  /// Location is not available.
  NotAvailable,

  /// Location is available.
  Available,

  /// Global location manager has been changed. Clients need to reset any
  /// state and checks related to location.
  Reset,
  ;

  /// @nodoc
  @internal
  static LocationStatus fromInt(core.int val) {
    return LocationStatus.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(LocationStatus e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static LocationStatus? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(LocationStatus? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
