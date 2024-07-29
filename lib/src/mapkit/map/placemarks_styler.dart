import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:math' as math;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;

part 'placemarks_styler.containers.dart';
part 'placemarks_styler.impl.dart';

/// Represents a styler for all placemarks in the map object collection,
/// including placemarks in child collections. When a new placemark is
/// added to a collection, the placemark tries to get style properties
/// from the collection where it has been added. If this collection
/// doesn't have a style property, the placemark tries to get it from the
/// closest parent collection. If none of these collections have a
/// specific style property, the placemark sets the default value for
/// this property.
abstract class PlacemarksStyler implements ffi.Finalizable {
  /// Sets piecewise linear scale, depending on the zoom. The 'points' must
  /// be sorted by x; x coordinates must be unique. If zoom <
  /// minZoom(points) or zoom > maxZoom(points), it is set within the
  /// defined bounds before applying the function. By default, the scale
  /// function is defined by a single point (1, 1). If points is null or
  /// points.empty(), it resets the function to the default. If
  /// points.size() == 1, the scale is constant and equals point.y.
  void setScaleFunction(core.List<math.Point<core.double>> points);

  core.bool isValid();
}
