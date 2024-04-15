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

part 'sensors.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'LocationActivityType.toPointer',
    toPlatform:
        '(val) => LocationActivityType.fromPointer(val, needFree: false)')
enum LocationActivityType {
  /// Auto activity type detect
  AutoDetect,

  /// Activity type for car navigation
  Car,

  /// Activity type for pedestrian navigation
  Pedestrian,

  /// Activity type without any hint
  Other,
  ;

  /// @nodoc
  @internal
  static LocationActivityType fromInt(core.int val) {
    return LocationActivityType.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(LocationActivityType e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static LocationActivityType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(LocationActivityType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
