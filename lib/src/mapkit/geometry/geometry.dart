import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'geometry.containers.dart';

/// @nodoc
final class BoundingBoxNative extends ffi.Struct {
  external mapkit_geometry_point.PointNative southWest;
  external mapkit_geometry_point.PointNative northEast;
}

final BoundingBoxNative Function(
        mapkit_geometry_point.PointNative, mapkit_geometry_point.PointNative)
    _BoundingBoxNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    BoundingBoxNative Function(
                        mapkit_geometry_point.PointNative,
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_geometry_BoundingBox_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'BoundingBox.toPointer',
    toPlatform: '(val) => BoundingBox.fromPointer(val, needFree: false)')
class BoundingBox {
  final mapkit_geometry_point.Point southWest;
  final mapkit_geometry_point.Point northEast;

  const BoundingBox(this.southWest, this.northEast);

  /// @nodoc
  @internal
  BoundingBox.fromNative(BoundingBoxNative native)
      : this(mapkit_geometry_point.Point.fromNative(native.southWest),
            mapkit_geometry_point.Point.fromNative(native.northEast));

  /// @nodoc
  @internal
  static BoundingBoxNative toNative(BoundingBox c) {
    return _BoundingBoxNativeInit(
        mapkit_geometry_point.Point.toNative(c.southWest),
        mapkit_geometry_point.Point.toNative(c.northEast));
  }

  /// @nodoc
  @internal
  static BoundingBox? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = BoundingBox.fromNative(ptr.cast<BoundingBoxNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(BoundingBox? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<BoundingBoxNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

/// @nodoc
final class CircleNative extends ffi.Struct {
  external mapkit_geometry_point.PointNative center;
  @ffi.Float()
  external core.double radius;
}

final CircleNative Function(mapkit_geometry_point.PointNative, core.double)
    _CircleNativeInit = lib.library
        .lookup<
            ffi.NativeFunction<
                CircleNative Function(mapkit_geometry_point.PointNative,
                    ffi.Float)>>('yandex_flutter_mapkit_geometry_Circle_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Circle.toPointer',
    toPlatform: '(val) => Circle.fromPointer(val, needFree: false)')
class Circle {
  final mapkit_geometry_point.Point center;
  final core.double radius;

  const Circle(
    this.center, {
    required this.radius,
  });

  /// @nodoc
  @internal
  Circle.fromNative(CircleNative native)
      : this(mapkit_geometry_point.Point.fromNative(native.center),
            radius: native.radius);

  /// @nodoc
  @internal
  static CircleNative toNative(Circle c) {
    return _CircleNativeInit(
        mapkit_geometry_point.Point.toNative(c.center), c.radius);
  }

  /// @nodoc
  @internal
  static Circle? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Circle.fromNative(ptr.cast<CircleNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Circle? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<CircleNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

/// @nodoc
final class SegmentNative extends ffi.Struct {
  external mapkit_geometry_point.PointNative startPoint;
  external mapkit_geometry_point.PointNative endPoint;
}

final SegmentNative Function(
        mapkit_geometry_point.PointNative, mapkit_geometry_point.PointNative)
    _SegmentNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    SegmentNative Function(mapkit_geometry_point.PointNative,
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_geometry_Segment_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Segment.toPointer',
    toPlatform: '(val) => Segment.fromPointer(val, needFree: false)')
class Segment {
  final mapkit_geometry_point.Point startPoint;
  final mapkit_geometry_point.Point endPoint;

  const Segment(this.startPoint, this.endPoint);

  /// @nodoc
  @internal
  Segment.fromNative(SegmentNative native)
      : this(mapkit_geometry_point.Point.fromNative(native.startPoint),
            mapkit_geometry_point.Point.fromNative(native.endPoint));

  /// @nodoc
  @internal
  static SegmentNative toNative(Segment c) {
    return _SegmentNativeInit(
        mapkit_geometry_point.Point.toNative(c.startPoint),
        mapkit_geometry_point.Point.toNative(c.endPoint));
  }

  /// @nodoc
  @internal
  static Segment? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Segment.fromNative(ptr.cast<SegmentNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Segment? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<SegmentNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'Polyline.toPointer',
    toPlatform: '(val) => Polyline.fromPointer(val, needFree: false)')
class Polyline implements ffi.Finalizable {
  late final points =
      mapkit_geometry_point.PointContainerExtension.toPlatformVector(
          _Polyline_get_points(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_Polyline_free.cast());

  Polyline(core.List<mapkit_geometry_point.Point> points)
      : this.fromNativePtr(_Polyline_init(
            mapkit_geometry_point.PointContainerExtension.toNativeVector(
                points)));

  /// @nodoc
  @internal
  Polyline.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(Polyline? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static Polyline? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return Polyline.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static Polyline? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        Polyline.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Polyline? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _Polyline_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _Polyline_clone =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_Polyline_clone')
        .asFunction(isLeaf: true);

final _Polyline_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_geometry_Polyline_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _Polyline_init = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_Polyline_init')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _Polyline_get_points = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_Polyline_get_points')
        .asFunction(isLeaf: true);

/// @nodoc
final class PolylinePositionNative extends ffi.Struct {
  @ffi.Uint32()
  external core.int segmentIndex;
  @ffi.Double()
  external core.double segmentPosition;
}

final PolylinePositionNative Function(core.int, core.double)
    _PolylinePositionNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    PolylinePositionNative Function(ffi.Uint32, ffi.Double)>>(
            'yandex_flutter_mapkit_geometry_PolylinePosition_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'PolylinePosition.toPointer',
    toPlatform: '(val) => PolylinePosition.fromPointer(val, needFree: false)')
class PolylinePosition {
  final core.int segmentIndex;
  final core.double segmentPosition;

  const PolylinePosition({
    required this.segmentIndex,
    required this.segmentPosition,
  });

  /// @nodoc
  @internal
  PolylinePosition.fromNative(PolylinePositionNative native)
      : this(
            segmentIndex: native.segmentIndex,
            segmentPosition: native.segmentPosition);

  /// @nodoc
  @internal
  static PolylinePositionNative toNative(PolylinePosition c) {
    return _PolylinePositionNativeInit(c.segmentIndex, c.segmentPosition);
  }

  /// @nodoc
  @internal
  static PolylinePosition? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        PolylinePosition.fromNative(ptr.cast<PolylinePositionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(PolylinePosition? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<PolylinePositionNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

/// @nodoc
final class SubpolylineNative extends ffi.Struct {
  external PolylinePositionNative begin;
  external PolylinePositionNative end;
}

final SubpolylineNative Function(PolylinePositionNative, PolylinePositionNative)
    _SubpolylineNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    SubpolylineNative Function(
                        PolylinePositionNative, PolylinePositionNative)>>(
            'yandex_flutter_mapkit_geometry_Subpolyline_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Subpolyline.toPointer',
    toPlatform: '(val) => Subpolyline.fromPointer(val, needFree: false)')
class Subpolyline {
  final PolylinePosition begin;
  final PolylinePosition end;

  const Subpolyline(this.begin, this.end);

  /// @nodoc
  @internal
  Subpolyline.fromNative(SubpolylineNative native)
      : this(PolylinePosition.fromNative(native.begin),
            PolylinePosition.fromNative(native.end));

  /// @nodoc
  @internal
  static SubpolylineNative toNative(Subpolyline c) {
    return _SubpolylineNativeInit(
        PolylinePosition.toNative(c.begin), PolylinePosition.toNative(c.end));
  }

  /// @nodoc
  @internal
  static Subpolyline? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Subpolyline.fromNative(ptr.cast<SubpolylineNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Subpolyline? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<SubpolylineNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'LinearRing.toPointer',
    toPlatform: '(val) => LinearRing.fromPointer(val, needFree: false)')
class LinearRing implements ffi.Finalizable {
  late final points =
      mapkit_geometry_point.PointContainerExtension.toPlatformVector(
          _LinearRing_get_points(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_LinearRing_free.cast());

  LinearRing(core.List<mapkit_geometry_point.Point> points)
      : this.fromNativePtr(_LinearRing_init(
            mapkit_geometry_point.PointContainerExtension.toNativeVector(
                points)));

  /// @nodoc
  @internal
  LinearRing.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(LinearRing? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static LinearRing? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LinearRing.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static LinearRing? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        LinearRing.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(LinearRing? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _LinearRing_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _LinearRing_clone =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_LinearRing_clone')
        .asFunction(isLeaf: true);

final _LinearRing_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_geometry_LinearRing_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _LinearRing_init =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_LinearRing_init')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _LinearRing_get_points = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_LinearRing_get_points')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Polygon.toPointer',
    toPlatform: '(val) => Polygon.fromPointer(val, needFree: false)')
class Polygon implements ffi.Finalizable {
  late final outerRing = LinearRing.fromNativePtr(_Polygon_get_outerRing(_ptr));
  late final innerRings = LinearRingContainerExtension.toPlatformVector(
      _Polygon_get_innerRings(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_Polygon_free.cast());

  Polygon(LinearRing outerRing, core.List<LinearRing> innerRings)
      : this.fromNativePtr(_Polygon_init(LinearRing.getNativePtr(outerRing),
            LinearRingContainerExtension.toNativeVector(innerRings)));

  /// @nodoc
  @internal
  Polygon.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(Polygon? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static Polygon? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return Polygon.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static Polygon? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        Polygon.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Polygon? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _Polygon_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _Polygon_clone = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_Polygon_clone')
    .asFunction(isLeaf: true);

final _Polygon_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_geometry_Polygon_free');

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>) _Polygon_init =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_Polygon_init')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _Polygon_get_outerRing = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_Polygon_get_outerRing')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _Polygon_get_innerRings = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_Polygon_get_innerRings')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'MultiPolygon.toPointer',
    toPlatform: '(val) => MultiPolygon.fromPointer(val, needFree: false)')
class MultiPolygon implements ffi.Finalizable {
  late final polygons = PolygonContainerExtension.toPlatformVector(
      _MultiPolygon_get_polygons(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_MultiPolygon_free.cast());

  MultiPolygon(core.List<Polygon> polygons)
      : this.fromNativePtr(_MultiPolygon_init(
            PolygonContainerExtension.toNativeVector(polygons)));

  /// @nodoc
  @internal
  MultiPolygon.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(MultiPolygon? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static MultiPolygon? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return MultiPolygon.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static MultiPolygon? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        MultiPolygon.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(MultiPolygon? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _MultiPolygon_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MultiPolygon_clone = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_MultiPolygon_clone')
        .asFunction(isLeaf: true);

final _MultiPolygon_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_geometry_MultiPolygon_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _MultiPolygon_init =
    lib
        .library
        .lookup<
                ffi
                .NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_MultiPolygon_init')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MultiPolygon_get_polygons = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_geometry_MultiPolygon_get_polygons')
        .asFunction(isLeaf: true);

/// @nodoc
@internal
final class GeometryNativeData extends ffi.Union {
  external mapkit_geometry_point.PointNative point;
  external ffi.Pointer<ffi.Void> polyline;
  external ffi.Pointer<ffi.Void> polygon;
  external ffi.Pointer<ffi.Void> multiPolygon;
  external BoundingBoxNative boundingBox;
  external CircleNative circle;
}

/// @nodoc
@internal
final class GeometryNative extends ffi.Struct {
  @ffi.Int()
  external core.int tag;
  external GeometryNativeData data;
}

/// A container of other geometry objects. Point - A point on the map.
/// Polyline - A polyline between a number of points. Polygon - A polygon
/// with one or more polygons in it. BoundingBox - A rectangular box
/// around the object. Circle - A circle around the specified point.
@bindings_annotations.ContainerData(
    toNative: 'Geometry.toPointer',
    toPlatform: '(val) => Geometry.fromPointer(val, needFree: false)')
class Geometry {
  const Geometry.fromPoint(mapkit_geometry_point.Point point) : _value = point;

  const Geometry.fromPolyline(Polyline polyline) : _value = polyline;

  const Geometry.fromPolygon(Polygon polygon) : _value = polygon;

  const Geometry.fromMultiPolygon(MultiPolygon multiPolygon)
      : _value = multiPolygon;

  const Geometry.fromBoundingBox(BoundingBox boundingBox)
      : _value = boundingBox;

  const Geometry.fromCircle(Circle circle) : _value = circle;

  /// @nodoc
  @internal
  static Geometry toPlatform(GeometryNative obj) {
    switch (obj.tag) {
      case 0:
        return Geometry.fromPoint(
            mapkit_geometry_point.Point.fromNative(obj.data.point));
      case 1:
        return Geometry.fromPolyline(Polyline.fromNativePtr(obj.data.polyline));
      case 2:
        return Geometry.fromPolygon(Polygon.fromNativePtr(obj.data.polygon));
      case 3:
        return Geometry.fromMultiPolygon(
            MultiPolygon.fromNativePtr(obj.data.multiPolygon));
      case 4:
        return Geometry.fromBoundingBox(
            BoundingBox.fromNative(obj.data.boundingBox));
      case 5:
        return Geometry.fromCircle(Circle.fromNative(obj.data.circle));
    }
    throw core.TypeError();
  }

  /// @nodoc
  @internal
  static GeometryNative toNative(Geometry obj) {
    if (obj._value is mapkit_geometry_point.Point) {
      return _GeometryNative_PointNative_init(
          mapkit_geometry_point.Point.toNative(obj._value));
    }
    if (obj._value is Polyline) {
      return _GeometryNative_Polyline_init(Polyline.getNativePtr(obj._value));
    }
    if (obj._value is Polygon) {
      return _GeometryNative_Polygon_init(Polygon.getNativePtr(obj._value));
    }
    if (obj._value is MultiPolygon) {
      return _GeometryNative_MultiPolygon_init(
          MultiPolygon.getNativePtr(obj._value));
    }
    if (obj._value is BoundingBox) {
      return _GeometryNative_BoundingBoxNative_init(
          BoundingBox.toNative(obj._value));
    }
    if (obj._value is Circle) {
      return _GeometryNative_CircleNative_init(Circle.toNative(obj._value));
    }
    throw core.TypeError();
  }

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

  /// @nodoc
  @internal
  static Geometry? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = toPlatform(ptr.cast<GeometryNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Geometry? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<GeometryNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }

  final core.dynamic _value;
}

final GeometryNative Function(mapkit_geometry_point.PointNative)
    _GeometryNative_PointNative_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    GeometryNative Function(
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_geometry_Geometry_PointNative_init')
        .asFunction(isLeaf: true);
final GeometryNative Function(
    ffi
        .Pointer<ffi.Void>) _GeometryNative_Polyline_init = lib.library
    .lookup<ffi.NativeFunction<GeometryNative Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_Geometry_Polyline_init')
    .asFunction(isLeaf: true);
final GeometryNative Function(
    ffi
        .Pointer<ffi.Void>) _GeometryNative_Polygon_init = lib.library
    .lookup<ffi.NativeFunction<GeometryNative Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_Geometry_Polygon_init')
    .asFunction(isLeaf: true);
final GeometryNative Function(
    ffi
        .Pointer<ffi.Void>) _GeometryNative_MultiPolygon_init = lib.library
    .lookup<ffi.NativeFunction<GeometryNative Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_Geometry_MultiPolygon_init')
    .asFunction(isLeaf: true);
final GeometryNative Function(BoundingBoxNative)
    _GeometryNative_BoundingBoxNative_init = lib.library
        .lookup<ffi.NativeFunction<GeometryNative Function(BoundingBoxNative)>>(
            'yandex_flutter_mapkit_geometry_Geometry_BoundingBoxNative_init')
        .asFunction(isLeaf: true);
final GeometryNative Function(CircleNative) _GeometryNative_CircleNative_init =
    lib.library
        .lookup<ffi.NativeFunction<GeometryNative Function(CircleNative)>>(
            'yandex_flutter_mapkit_geometry_Geometry_CircleNative_init')
        .asFunction(isLeaf: true);
