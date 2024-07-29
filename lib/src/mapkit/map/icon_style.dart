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

/// The style of created icons.

final class IconStyle {
  /// An anchor is used to alter image placement. Normalized: (0.0f, 0.0f)
  /// denotes the top left image corner; (1.0f, 1.0f) denotes bottom right.
  /// Default is (0.5f, 0.5f).
  ///
  final math.Point<core.double>? anchor;

  /// Icon rotation type. Default: NoRotation.
  ///
  final mapkit_map_rotation_type.RotationType? rotationType;

  /// Z-index of the icon, relative to the placemark's z-index.
  ///
  final core.double? zIndex;

  /// If true, the icon is displayed on the map surface. If false, the icon
  /// is displayed on the screen surface. Default: false.
  ///
  final core.bool? flat;

  /// Sets icon visibility. Default: true.
  ///
  final core.bool? visible;

  /// Scale of the icon. Default: 1.0f.
  ///
  final core.double? scale;

  /// Tappable area on the icon. Coordinates are measured the same way as
  /// anchor coordinates. If rect is empty or invalid, the icon will not
  /// process taps. By default, icons process all taps.
  ///
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
