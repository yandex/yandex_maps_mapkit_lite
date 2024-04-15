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

part 'point_of_view.containers.dart';

/// The point of view.
@bindings_annotations.ContainerData(
    toNative: 'PointOfView.toPointer',
    toPlatform: '(val) => PointOfView.fromPointer(val, needFree: false)')
enum PointOfView {
  /// Point of View is centered on the screen.
  ScreenCenter,

  /// Point of View has an x-coordinate at focusPoint and a y-coordinate at
  /// the center of the screen.
  AdaptToFocusPointHorizontally,
  ;

  /// @nodoc
  @internal
  static PointOfView fromInt(core.int val) {
    return PointOfView.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(PointOfView e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static PointOfView? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(PointOfView? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
