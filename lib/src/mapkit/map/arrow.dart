import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:ui' as ui;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;

part 'arrow.containers.dart';
part 'arrow.impl.dart';

/// The arrow element.
abstract class Arrow implements ffi.Finalizable {
  /// Arrow center.
  mapkit_geometry_geometry.PolylinePosition get position;

  /// Arrow fill color.
  ui.Color get fillColor;
  set fillColor(ui.Color val);

  /// Color of the arrow's outline. Default: white.
  ui.Color get outlineColor;
  set outlineColor(ui.Color val);

  /// The width of the outline in units. Default: 2.
  core.double get outlineWidth;
  set outlineWidth(core.double val);

  /// The overall length of the arrow (including the tip) in units. The
  /// size of a unit is equal to the size of a pixel at the current zoom
  /// level when the camera tilt is equal to 0 and the scale factor is
  /// equal to 1.
  core.double get length;
  set length(core.double val);

  /// Arrow visibility. Default: true.
  core.bool get visible;
  set visible(core.bool val);

  /// Describes height of the arrowhead in units. Default: 0.2 * length.
  core.double get triangleHeight;
  set triangleHeight(core.double val);

  core.bool isValid();
}
