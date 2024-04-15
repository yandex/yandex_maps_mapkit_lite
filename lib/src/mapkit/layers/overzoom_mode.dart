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

part 'overzoom_mode.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'OverzoomMode.toPointer',
    toPlatform: '(val) => OverzoomMode.fromPointer(val, needFree: false)')
enum OverzoomMode {
  /// Overzoom is fully disabled.
  Disabled,

  /// If a tile is absent or translucent, tiles from lower or higher zooms
  /// will be shown.
  Enabled,

  /// Same as Enabled, plus it fetches tiles well below absent or
  /// translucent tiles that don't have any overzoom tiles to replace them
  /// with.
  WithPrefetch,
  ;

  /// @nodoc
  @internal
  static OverzoomMode fromInt(core.int val) {
    return OverzoomMode.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(OverzoomMode e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static OverzoomMode? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(OverzoomMode? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
