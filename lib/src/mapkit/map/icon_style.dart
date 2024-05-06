import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/rect.dart'
    as mapkit_map_rect;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/rotation_type.dart'
    as mapkit_map_rotation_type;

part 'icon_style.containers.dart';
part 'icon_style.impl.dart';

final class IconStyle {
  final math.Point<core.double>? anchor;
  final mapkit_map_rotation_type.RotationType? rotationType;
  final core.double? zIndex;
  final core.bool? flat;
  final core.bool? visible;
  final core.double? scale;
  final mapkit_map_rect.Rect? tappableArea;

  const IconStyle({
    this.anchor,
    this.rotationType,
    this.zIndex,
    this.flat,
    this.visible,
    this.scale,
    this.tappableArea,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll(
      [anchor, rotationType, zIndex, flat, visible, scale, tappableArea]);

  @core.override
  core.bool operator ==(covariant IconStyle other) {
    if (core.identical(this, other)) {
      return true;
    }
    return anchor == other.anchor &&
        rotationType == other.rotationType &&
        zIndex == other.zIndex &&
        flat == other.flat &&
        visible == other.visible &&
        scale == other.scale &&
        tappableArea == other.tappableArea;
  }

  @core.override
  core.String toString() {
    return "IconStyle(anchor: $anchor, rotationType: $rotationType, zIndex: $zIndex, flat: $flat, visible: $visible, scale: $scale, tappableArea: $tappableArea)";
  }
}
