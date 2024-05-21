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
import 'package:yandex_maps_mapkit_lite/src/bindings/image/animated_image_provider.dart'
    as animated_image_provider;
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart'
    as image_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as mapkit_map_map_object;

part 'polygon.containers.dart';
part 'polygon.impl.dart';

/// A polygon displayed on the map.
abstract class PolygonMapObject
    implements mapkit_map_map_object.MapObject, ffi.Finalizable {
  mapkit_geometry_geometry.Polygon get geometry;
  set geometry(mapkit_geometry_geometry.Polygon val);

  /// Sets the stroke color. Default: hexademical RGBA code 0x0066FFFF.
  /// Setting the stroke color to any transparent color (for example, RGBA
  /// code 0x00000000) effectively disables the stroke.
  ui.Color get strokeColor;
  set strokeColor(ui.Color val);

  /// Sets the stroke width in units. Default: 5. The size of a unit is
  /// equal to the size of a pixel at the current zoom when the camera
  /// position's tilt is equal to 0 and the scale factor is equal to 1.
  core.double get strokeWidth;
  set strokeWidth(core.double val);

  /// Sets the fill color. Default: hexademical RGBA code 0x0066FF99.
  /// \@attention Fill color is ignored if a pattern is set.
  ui.Color get fillColor;
  set fillColor(ui.Color val);

  /// The object geometry can be interpreted in two different ways:
  /// <ul><li>If the object mode is 'geodesic', the object geometry is
  /// defined on a sphere.</li> <li>Otherwise, the object geometry is
  /// defined in projected space.</li></ul> Default: false.
  core.bool get geodesic;
  set geodesic(core.bool val);

  /// Sets pattern to fill polygon. \@attention Original linear sizes of
  /// pattern should be equal to power of 2. \@attention Fill color is
  /// ignored if a pattern is set.
  void setAnimatedPattern(
    animated_image_provider.AnimatedImageProvider animatedImage, {
    required core.double scale,
  });

  /// Sets pattern to fill polygon. \@attention Original linear sizes of
  /// pattern should be equal to power of 2. \@attention Fill color is
  /// ignored if pattern is set.
  void setPattern(
    image_provider.ImageProvider image, {
    required core.double scale,
  });

  /// Removes pattern.
  void resetPattern();
}
