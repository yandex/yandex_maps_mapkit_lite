import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'overzoom_mode.containers.dart';
part 'overzoom_mode.impl.dart';

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
}
