import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'route_position.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'RoutePosition.getNativePtr',
    toPlatform:
        '(val) => RoutePosition.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class RoutePosition implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_RoutePosition_free.cast());

  /// @nodoc
  RoutePosition.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  RoutePosition.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(RoutePosition? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  @internal

  /// @nodoc
  static RoutePosition? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return RoutePosition.fromNativePtr(ptr);
  }

  /// As point on the map
  mapkit_geometry_point.Point get point {
    return mapkit_geometry_point.Point.fromNative(
        _RoutePosition_get_point(ptr));
  }

  /// Check if this position on the same route as passed.
  core.bool onRoute(core.String routeId) {
    return _RoutePosition_onRoute(ptr, to_native.toNativeString(routeId));
  }

  /// Return polyline position on route. If the position not on the passed
  /// route none will be returned.
  mapkit_geometry_geometry.PolylinePosition? positionOnRoute(
      core.String routeId) {
    return mapkit_geometry_geometry.PolylinePosition.fromPointer(
        _RoutePosition_positionOnRoute(ptr, to_native.toNativeString(routeId)));
  }

  /// Create position shifted by distance. If the distance is more than
  /// remains route length, the end of the route will be returned. If the
  /// distance is less than a negative distance from the start, the
  /// beginning of the route will be returned.
  RoutePosition advance(core.double distance) {
    return RoutePosition.fromNativePtr(_RoutePosition_advance(ptr, distance));
  }

  /// Distance to another point on the route. Return none if point on
  /// another route. May be less 0 if position "to" stay before this
  /// position.
  core.double? distanceTo(RoutePosition to) {
    return to_platform.toPlatformFromPointerDouble(
        _RoutePosition_distanceTo(ptr, RoutePosition.getNativePtr(to)));
  }

  /// Determines if position precedes another position on the route. Throws
  /// if another position belongs to another route.
  core.bool precedes(RoutePosition another) {
    return _RoutePosition_precedes(ptr, RoutePosition.getNativePtr(another));
  }

  /// Determines if position precedes or equals another position on the
  /// route. Throws if another position belongs to another route.
  core.bool precedesOrEquals(RoutePosition another) {
    return _RoutePosition_precedesOrEquals(
        ptr, RoutePosition.getNativePtr(another));
  }

  /// Determines if position equals another position on the route. Throws
  /// if another position belongs to another route.
  core.bool equals(RoutePosition another) {
    return _RoutePosition_equals(ptr, RoutePosition.getNativePtr(another));
  }

  /// Heading movement on the route at this position. It is equal heading
  /// of the segment which is belonged position.
  core.double heading() {
    return _RoutePosition_heading(ptr);
  }

  /// Distance to the end of the route.
  core.double distanceToFinish() {
    return _RoutePosition_distanceToFinish(ptr);
  }

  /// Time to the end of the route.
  core.double timeToFinish() {
    return _RoutePosition_timeToFinish(ptr);
  }
}

final _RoutePosition_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_navigation_RoutePosition_free');

final mapkit_geometry_point.PointNative Function(ffi.Pointer<ffi.Void>)
    _RoutePosition_get_point = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_point.PointNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_navigation_RoutePosition_get_point')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _RoutePosition_onRoute = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Bool Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_navigation_RoutePosition_onRoute')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, native_types.NativeString)
    _RoutePosition_positionOnRoute = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_navigation_RoutePosition_positionOnRoute')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>, core.double)
    _RoutePosition_advance = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, ffi.Double)>>(
            'yandex_flutter_mapkit_navigation_RoutePosition_advance')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _RoutePosition_distanceTo = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_navigation_RoutePosition_distanceTo')
        .asFunction();
final core.bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _RoutePosition_precedes = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Bool Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_navigation_RoutePosition_precedes')
        .asFunction();
final core.bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _RoutePosition_precedesOrEquals = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Bool Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_navigation_RoutePosition_precedesOrEquals')
        .asFunction();
final core.bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _RoutePosition_equals = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Bool Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_navigation_RoutePosition_equals')
        .asFunction();
final core.double Function(ffi.Pointer<ffi.Void>) _RoutePosition_heading = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_navigation_RoutePosition_heading')
    .asFunction();
final core.double Function(ffi.Pointer<ffi.Void>)
    _RoutePosition_distanceToFinish = lib.library
        .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_navigation_RoutePosition_distanceToFinish')
        .asFunction();
final core.double Function(ffi.Pointer<ffi.Void>) _RoutePosition_timeToFinish =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Double Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_navigation_RoutePosition_timeToFinish')
        .asFunction();
