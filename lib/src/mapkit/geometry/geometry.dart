import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'geometry.containers.dart';
part 'geometry.impl.dart';

/// A rectangular box around the object.

final class BoundingBox {
  /// The coordinates of the southwest corner of the box.
  final mapkit_geometry_point.Point southWest;

  /// The coordinates of the northeast corner of the box.
  final mapkit_geometry_point.Point northEast;

  const BoundingBox(this.southWest, this.northEast);

  @core.override
  core.int get hashCode => core.Object.hashAll([southWest, northEast]);

  @core.override
  core.bool operator ==(covariant BoundingBox other) {
    if (core.identical(this, other)) {
      return true;
    }
    return southWest == other.southWest && northEast == other.northEast;
  }

  @core.override
  core.String toString() {
    return "BoundingBox(southWest: $southWest, northEast: $northEast)";
  }
}

/// A circle around the specified point.

final class Circle {
  /// The coordinates of the center of the circle.
  final mapkit_geometry_point.Point center;

  /// The radius of the circle in meters.
  final core.double radius;

  const Circle(
    this.center, {
    required this.radius,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([center, radius]);

  @core.override
  core.bool operator ==(covariant Circle other) {
    if (core.identical(this, other)) {
      return true;
    }
    return center == other.center && radius == other.radius;
  }

  @core.override
  core.String toString() {
    return "Circle(center: $center, radius: $radius)";
  }
}

/// A line between two points.

final class Segment {
  /// Starting point of the segment.
  final mapkit_geometry_point.Point startPoint;

  /// End point of the segment.
  final mapkit_geometry_point.Point endPoint;

  const Segment(this.startPoint, this.endPoint);

  @core.override
  core.int get hashCode => core.Object.hashAll([startPoint, endPoint]);

  @core.override
  core.bool operator ==(covariant Segment other) {
    if (core.identical(this, other)) {
      return true;
    }
    return startPoint == other.startPoint && endPoint == other.endPoint;
  }

  @core.override
  core.String toString() {
    return "Segment(startPoint: $startPoint, endPoint: $endPoint)";
  }
}

/// A polyline between a number of points. A polyline is drawn between
/// consecutive points.
abstract final class Polyline implements ffi.Finalizable {
  factory Polyline(core.List<mapkit_geometry_point.Point> points) =>
      PolylineImpl(points);

  /// The list of points to connect.
  core.List<mapkit_geometry_point.Point> get points;

  @core.override
  core.int get hashCode => core.Object.hashAll([points]);

  @core.override
  core.bool operator ==(covariant Polyline other) {
    if (core.identical(this, other)) {
      return true;
    }
    return points == other.points;
  }

  @core.override
  core.String toString() {
    return "Polyline(points: $points)";
  }
}

/// The position on a polyline.

final class PolylinePosition {
  /// Zero-based index of the polyline segment.
  final core.int segmentIndex;

  /// Position in the specified segment. Possible values: from 0 to 1,
  /// where 0 is the start of the segment and 1 is the end of it.
  final core.double segmentPosition;

  const PolylinePosition({
    required this.segmentIndex,
    required this.segmentPosition,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([segmentIndex, segmentPosition]);

  @core.override
  core.bool operator ==(covariant PolylinePosition other) {
    if (core.identical(this, other)) {
      return true;
    }
    return segmentIndex == other.segmentIndex &&
        segmentPosition == other.segmentPosition;
  }

  @core.override
  core.String toString() {
    return "PolylinePosition(segmentIndex: $segmentIndex, segmentPosition: $segmentPosition)";
  }
}

/// A part of a polyline.

final class Subpolyline {
  /// The start of the selected part of the polyline.
  final PolylinePosition begin;

  /// The end of the selected part of the polyline.
  final PolylinePosition end;

  const Subpolyline(this.begin, this.end);

  @core.override
  core.int get hashCode => core.Object.hashAll([begin, end]);

  @core.override
  core.bool operator ==(covariant Subpolyline other) {
    if (core.identical(this, other)) {
      return true;
    }
    return begin == other.begin && end == other.end;
  }

  @core.override
  core.String toString() {
    return "Subpolyline(begin: $begin, end: $end)";
  }
}

/// A sequence of four or more vertices, with all points along the
/// linearly-interpolated curves (line segments) between each pair of
/// consecutive vertices. A ring must have either 0, 4 or more points.
/// The first and last points of the ring must be in the same position.
/// The ring must not intersect with itself.
abstract final class LinearRing implements ffi.Finalizable {
  factory LinearRing(core.List<mapkit_geometry_point.Point> points) =>
      LinearRingImpl(points);

  /// The list of points to connect.
  core.List<mapkit_geometry_point.Point> get points;

  @core.override
  core.int get hashCode => core.Object.hashAll([points]);

  @core.override
  core.bool operator ==(covariant LinearRing other) {
    if (core.identical(this, other)) {
      return true;
    }
    return points == other.points;
  }

  @core.override
  core.String toString() {
    return "LinearRing(points: $points)";
  }
}

/// A polygon with one or more polygons in it. The exterior and interior
/// areas are specified using LinearRing.
abstract final class Polygon implements ffi.Finalizable {
  factory Polygon(LinearRing outerRing, core.List<LinearRing> innerRings) =>
      PolygonImpl(outerRing, innerRings);

  /// The ring specifying the area.
  LinearRing get outerRing;

  /// The list of rings in the specified area.
  core.List<LinearRing> get innerRings;

  @core.override
  core.int get hashCode => core.Object.hashAll([outerRing, innerRings]);

  @core.override
  core.bool operator ==(covariant Polygon other) {
    if (core.identical(this, other)) {
      return true;
    }
    return outerRing == other.outerRing && innerRings == other.innerRings;
  }

  @core.override
  core.String toString() {
    return "Polygon(outerRing: $outerRing, innerRings: $innerRings)";
  }
}

/// An area consisting of multiple external polygons.
abstract final class MultiPolygon implements ffi.Finalizable {
  factory MultiPolygon(core.List<Polygon> polygons) =>
      MultiPolygonImpl(polygons);

  core.List<Polygon> get polygons;

  @core.override
  core.int get hashCode => core.Object.hashAll([polygons]);

  @core.override
  core.bool operator ==(covariant MultiPolygon other) {
    if (core.identical(this, other)) {
      return true;
    }
    return polygons == other.polygons;
  }

  @core.override
  core.String toString() {
    return "MultiPolygon(polygons: $polygons)";
  }
}

/// A container of other geometry objects. Point - A point on the map.
/// Polyline - A polyline between a number of points. Polygon - A polygon
/// with one or more polygons in it. BoundingBox - A rectangular box
/// around the object. Circle - A circle around the specified point.
final class Geometry {
  const Geometry.fromPoint(mapkit_geometry_point.Point point) : _value = point;

  const Geometry.fromPolyline(Polyline polyline) : _value = polyline;

  const Geometry.fromPolygon(Polygon polygon) : _value = polygon;

  const Geometry.fromMultiPolygon(MultiPolygon multiPolygon)
      : _value = multiPolygon;

  const Geometry.fromBoundingBox(BoundingBox boundingBox)
      : _value = boundingBox;

  const Geometry.fromCircle(Circle circle) : _value = circle;

  mapkit_geometry_point.Point? asPoint() {
    if (_value is mapkit_geometry_point.Point) {
      return _value;
    }
    return null;
  }

  Polyline? asPolyline() {
    if (_value is Polyline) {
      return _value;
    }
    return null;
  }

  Polygon? asPolygon() {
    if (_value is Polygon) {
      return _value;
    }
    return null;
  }

  MultiPolygon? asMultiPolygon() {
    if (_value is MultiPolygon) {
      return _value;
    }
    return null;
  }

  BoundingBox? asBoundingBox() {
    if (_value is BoundingBox) {
      return _value;
    }
    return null;
  }

  Circle? asCircle() {
    if (_value is Circle) {
      return _value;
    }
    return null;
  }

  /// Applies the passed function to the variant value.
  void when({
    required void Function(mapkit_geometry_point.Point value) onPoint,
    required void Function(Polyline value) onPolyline,
    required void Function(Polygon value) onPolygon,
    required void Function(MultiPolygon value) onMultiPolygon,
    required void Function(BoundingBox value) onBoundingBox,
    required void Function(Circle value) onCircle,
  }) {
    if (_value is mapkit_geometry_point.Point) {
      return onPoint(_value as mapkit_geometry_point.Point);
    }
    if (_value is Polyline) {
      return onPolyline(_value as Polyline);
    }
    if (_value is Polygon) {
      return onPolygon(_value as Polygon);
    }
    if (_value is MultiPolygon) {
      return onMultiPolygon(_value as MultiPolygon);
    }
    if (_value is BoundingBox) {
      return onBoundingBox(_value as BoundingBox);
    }
    if (_value is Circle) {
      return onCircle(_value as Circle);
    }
    assert(false);
  }

  final core.dynamic _value;
}
