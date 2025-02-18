part of 'geometry.dart';

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
    toNative: 'BoundingBoxImpl.toPointer',
    toPlatform: '(val) => BoundingBoxImpl.fromPointer(val, needFree: false)',
    platformType: 'BoundingBox')
extension BoundingBoxImpl on BoundingBox {
  static BoundingBox fromNative(BoundingBoxNative native) {
    return BoundingBox(
        mapkit_geometry_point.PointImpl.fromNative(native.southWest),
        mapkit_geometry_point.PointImpl.fromNative(native.northEast));
  }

  static BoundingBoxNative toNative(BoundingBox obj) {
    return _BoundingBoxNativeInit(
        mapkit_geometry_point.PointImpl.toNative(obj.southWest),
        mapkit_geometry_point.PointImpl.toNative(obj.northEast));
  }

  static BoundingBox? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        BoundingBoxImpl.fromNative(ptr.cast<BoundingBoxNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(BoundingBox? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<BoundingBoxNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

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
    toNative: 'CircleImpl.toPointer',
    toPlatform: '(val) => CircleImpl.fromPointer(val, needFree: false)',
    platformType: 'Circle')
extension CircleImpl on Circle {
  static Circle fromNative(CircleNative native) {
    return Circle(mapkit_geometry_point.PointImpl.fromNative(native.center),
        radius: native.radius);
  }

  static CircleNative toNative(Circle obj) {
    return _CircleNativeInit(
        mapkit_geometry_point.PointImpl.toNative(obj.center), obj.radius);
  }

  static Circle? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = CircleImpl.fromNative(ptr.cast<CircleNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Circle? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<CircleNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

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
    toNative: 'SegmentImpl.toPointer',
    toPlatform: '(val) => SegmentImpl.fromPointer(val, needFree: false)',
    platformType: 'Segment')
extension SegmentImpl on Segment {
  static Segment fromNative(SegmentNative native) {
    return Segment(
        mapkit_geometry_point.PointImpl.fromNative(native.startPoint),
        mapkit_geometry_point.PointImpl.fromNative(native.endPoint));
  }

  static SegmentNative toNative(Segment obj) {
    return _SegmentNativeInit(
        mapkit_geometry_point.PointImpl.toNative(obj.startPoint),
        mapkit_geometry_point.PointImpl.toNative(obj.endPoint));
  }

  static Segment? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = SegmentImpl.fromNative(ptr.cast<SegmentNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Segment? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<SegmentNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'PolylineImpl.getNativePtr',
    toPlatform: '(val) => PolylineImpl.fromPointer(val, needFree: false)',
    platformType: 'Polyline')
final class PolylineImpl extends Polyline {
  PolylineImpl(core.List<mapkit_geometry_point.Point> points)
      : this.fromNativePtr(_Polyline_init(
            mapkit_geometry_point.PointContainerExtension.toNativeVector(
                points)));

  @core.override
  late final points =
      mapkit_geometry_point.PointContainerExtension.toPlatformVector(
          _Polyline_get_points(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_Polyline_free.cast());

  PolylineImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(Polyline? obj) {
    return (obj as PolylineImpl?)?._ptr ?? ffi.nullptr;
  }

  static Polyline? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : PolylineImpl.fromNativePtr(ptr);
  }

  static Polyline? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        PolylineImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

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
    toNative: 'PolylinePositionImpl.toPointer',
    toPlatform:
        '(val) => PolylinePositionImpl.fromPointer(val, needFree: false)',
    platformType: 'PolylinePosition')
extension PolylinePositionImpl on PolylinePosition {
  static PolylinePosition fromNative(PolylinePositionNative native) {
    return PolylinePosition(
        segmentIndex: native.segmentIndex,
        segmentPosition: native.segmentPosition);
  }

  static PolylinePositionNative toNative(PolylinePosition obj) {
    return _PolylinePositionNativeInit(obj.segmentIndex, obj.segmentPosition);
  }

  static PolylinePosition? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        PolylinePositionImpl.fromNative(ptr.cast<PolylinePositionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(PolylinePosition? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<PolylinePositionNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

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
    toNative: 'SubpolylineImpl.toPointer',
    toPlatform: '(val) => SubpolylineImpl.fromPointer(val, needFree: false)',
    platformType: 'Subpolyline')
extension SubpolylineImpl on Subpolyline {
  static Subpolyline fromNative(SubpolylineNative native) {
    return Subpolyline(PolylinePositionImpl.fromNative(native.begin),
        PolylinePositionImpl.fromNative(native.end));
  }

  static SubpolylineNative toNative(Subpolyline obj) {
    return _SubpolylineNativeInit(PolylinePositionImpl.toNative(obj.begin),
        PolylinePositionImpl.toNative(obj.end));
  }

  static Subpolyline? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        SubpolylineImpl.fromNative(ptr.cast<SubpolylineNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Subpolyline? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<SubpolylineNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'LinearRingImpl.getNativePtr',
    toPlatform: '(val) => LinearRingImpl.fromPointer(val, needFree: false)',
    platformType: 'LinearRing')
final class LinearRingImpl extends LinearRing {
  LinearRingImpl(core.List<mapkit_geometry_point.Point> points)
      : this.fromNativePtr(_LinearRing_init(
            mapkit_geometry_point.PointContainerExtension.toNativeVector(
                points)));

  @core.override
  late final points =
      mapkit_geometry_point.PointContainerExtension.toPlatformVector(
          _LinearRing_get_points(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_LinearRing_free.cast());

  LinearRingImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(LinearRing? obj) {
    return (obj as LinearRingImpl?)?._ptr ?? ffi.nullptr;
  }

  static LinearRing? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : LinearRingImpl.fromNativePtr(ptr);
  }

  static LinearRing? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        LinearRingImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

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
    toNative: 'PolygonImpl.getNativePtr',
    toPlatform: '(val) => PolygonImpl.fromPointer(val, needFree: false)',
    platformType: 'Polygon')
final class PolygonImpl extends Polygon {
  PolygonImpl(LinearRing outerRing, core.List<LinearRing> innerRings)
      : this.fromNativePtr(_Polygon_init(LinearRingImpl.getNativePtr(outerRing),
            LinearRingContainerExtension.toNativeVector(innerRings)));

  @core.override
  late final outerRing =
      LinearRingImpl.fromNativePtr(_Polygon_get_outerRing(_ptr));
  @core.override
  late final innerRings = LinearRingContainerExtension.toPlatformVector(
      _Polygon_get_innerRings(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_Polygon_free.cast());

  PolygonImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(Polygon? obj) {
    return (obj as PolygonImpl?)?._ptr ?? ffi.nullptr;
  }

  static Polygon? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : PolygonImpl.fromNativePtr(ptr);
  }

  static Polygon? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        PolygonImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

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
    toNative: 'MultiPolygonImpl.getNativePtr',
    toPlatform: '(val) => MultiPolygonImpl.fromPointer(val, needFree: false)',
    platformType: 'MultiPolygon')
final class MultiPolygonImpl extends MultiPolygon {
  MultiPolygonImpl(core.List<Polygon> polygons)
      : this.fromNativePtr(_MultiPolygon_init(
            PolygonContainerExtension.toNativeVector(polygons)));

  @core.override
  late final polygons = PolygonContainerExtension.toPlatformVector(
      _MultiPolygon_get_polygons(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_MultiPolygon_free.cast());

  MultiPolygonImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(MultiPolygon? obj) {
    return (obj as MultiPolygonImpl?)?._ptr ?? ffi.nullptr;
  }

  static MultiPolygon? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : MultiPolygonImpl.fromNativePtr(ptr);
  }

  static MultiPolygon? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        MultiPolygonImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

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

final class _GeometryNativeData extends ffi.Union {
  external mapkit_geometry_point.PointNative point;
  external ffi.Pointer<ffi.Void> polyline;
  external ffi.Pointer<ffi.Void> polygon;
  external ffi.Pointer<ffi.Void> multiPolygon;
  external BoundingBoxNative boundingBox;
  external CircleNative circle;
}

final class GeometryNative extends ffi.Struct {
  @ffi.Int()
  external core.int tag;
  external _GeometryNativeData data;
}

@bindings_annotations.ContainerData(
    toNative: 'GeometryImpl.toPointer',
    toPlatform: '(val) => GeometryImpl.fromPointer(val, needFree: false)',
    platformType: 'Geometry')
extension GeometryImpl on Geometry {
  static GeometryNative toNative(Geometry obj) {
    if (obj._value is mapkit_geometry_point.Point) {
      return _GeometryNative_PointNative_init(
          mapkit_geometry_point.PointImpl.toNative(obj._value));
    }
    if (obj._value is Polyline) {
      return _GeometryNative_Polyline_init(
          PolylineImpl.getNativePtr(obj._value));
    }
    if (obj._value is Polygon) {
      return _GeometryNative_Polygon_init(PolygonImpl.getNativePtr(obj._value));
    }
    if (obj._value is MultiPolygon) {
      return _GeometryNative_MultiPolygon_init(
          MultiPolygonImpl.getNativePtr(obj._value));
    }
    if (obj._value is BoundingBox) {
      return _GeometryNative_BoundingBoxNative_init(
          BoundingBoxImpl.toNative(obj._value));
    }
    if (obj._value is Circle) {
      return _GeometryNative_CircleNative_init(CircleImpl.toNative(obj._value));
    }
    throw core.TypeError();
  }

  static Geometry toPlatform(GeometryNative obj) {
    switch (obj.tag) {
      case 0:
        return Geometry.fromPoint(
            mapkit_geometry_point.PointImpl.fromNative(obj.data.point));
      case 1:
        return Geometry.fromPolyline(
            PolylineImpl.fromNativePtr(obj.data.polyline));
      case 2:
        return Geometry.fromPolygon(
            PolygonImpl.fromNativePtr(obj.data.polygon));
      case 3:
        return Geometry.fromMultiPolygon(
            MultiPolygonImpl.fromNativePtr(obj.data.multiPolygon));
      case 4:
        return Geometry.fromBoundingBox(
            BoundingBoxImpl.fromNative(obj.data.boundingBox));
      case 5:
        return Geometry.fromCircle(CircleImpl.fromNative(obj.data.circle));
    }
    throw core.TypeError();
  }

  static Geometry? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = toPlatform(ptr.cast<GeometryNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Geometry? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<GeometryNative>();
    result.ref = toNative(val);

    return result.cast();
  }
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
