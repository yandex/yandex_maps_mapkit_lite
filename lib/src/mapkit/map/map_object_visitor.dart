import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/circle.dart'
    as mapkit_map_circle;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/clusterized_placemark_collection.dart'
    as mapkit_map_clusterized_placemark_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object_collection.dart'
    as mapkit_map_map_object_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polygon.dart'
    as mapkit_map_polygon;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polyline.dart'
    as mapkit_map_polyline;

/// @nodoc
class _MapObjectVisitorWrapper implements ffi.Finalizable {
  _MapObjectVisitorWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_MapObjectVisitor_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Used to traverse over the children of the MapObjectCollection.
abstract class MapObjectVisitor {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<MapObjectVisitor>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<MapObjectVisitor, _MapObjectVisitorWrapper?>();

  /// Called when a placemark is visited.
  void onPlacemarkVisited(mapkit_map_placemark.PlacemarkMapObject placemark);

  /// Called when a polyline is visited.
  void onPolylineVisited(mapkit_map_polyline.PolylineMapObject polyline);

  /// Called when a polygon is visited.
  void onPolygonVisited(mapkit_map_polygon.PolygonMapObject polygon);

  /// Called when a circle is visited.
  void onCircleVisited(mapkit_map_circle.CircleMapObject circle);

  /// Called for every child collection. The collection is ignored if this
  /// method returns false.
  core.bool onCollectionVisitStart(
      mapkit_map_map_object_collection.MapObjectCollection collection);

  /// Called for visited collections only. If an exception occurred during
  /// the visit, the method might be skipped.
  void onCollectionVisitEnd(
      mapkit_map_map_object_collection.MapObjectCollection collection);

  /// Called for clusterized placemark collection. The collection is
  /// ignored if this method returns false.
  core.bool onClusterizedCollectionVisitStart(
      mapkit_map_clusterized_placemark_collection.ClusterizedPlacemarkCollection
          collection);

  /// Called for visited clusterized placemark collections only. If an
  /// exception occurred during the visit, the method might be skipped.
  void onClusterizedCollectionVisitEnd(
      mapkit_map_clusterized_placemark_collection.ClusterizedPlacemarkCollection
          collection);

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(MapObjectVisitor obj) {
    final ptr = _MapObjectVisitor_new(
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectVisitor_onPlacemarkVisited),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectVisitor_onPolylineVisited),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectVisitor_onPolygonVisited),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectVisitor_onCircleVisited),
        ffi.Pointer.fromFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectVisitor_onCollectionVisitStart, false),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectVisitor_onCollectionVisitEnd),
        ffi.Pointer.fromFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectVisitor_onClusterizedCollectionVisitStart, false),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _MapObjectVisitor_onClusterizedCollectionVisitEnd));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _MapObjectVisitorWrapper(ptr);
    _MapObjectVisitorsetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(MapObjectVisitor? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _MapObjectVisitorsetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapObjectVisitor_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _MapObjectVisitor_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<
                        ffi.NativeFunction<
                            ffi.Void Function(
                                ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>('yandex_flutter_mapkit_map_MapObjectVisitor_new')
        .asFunction(isLeaf: true);

final _MapObjectVisitor_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObjectVisitor_free');
void _MapObjectVisitor_onPlacemarkVisited(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> placemark) {
  final listener = MapObjectVisitor._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onPlacemarkVisited(
        mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(placemark));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectVisitor_onPolylineVisited(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> polyline) {
  final listener = MapObjectVisitor._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onPolylineVisited(
        mapkit_map_polyline.PolylineMapObject.fromNativePtr(polyline));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectVisitor_onPolygonVisited(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> polygon) {
  final listener = MapObjectVisitor._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onPolygonVisited(
        mapkit_map_polygon.PolygonMapObject.fromNativePtr(polygon));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectVisitor_onCircleVisited(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> circle) {
  final listener = MapObjectVisitor._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onCircleVisited(
        mapkit_map_circle.CircleMapObject.fromNativePtr(circle));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

core.bool _MapObjectVisitor_onCollectionVisitStart(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> collection) {
  final listener = MapObjectVisitor._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return listener.onCollectionVisitStart(
        mapkit_map_map_object_collection.MapObjectCollection.fromNativePtr(
            collection));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectVisitor_onCollectionVisitEnd(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> collection) {
  final listener = MapObjectVisitor._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onCollectionVisitEnd(
        mapkit_map_map_object_collection.MapObjectCollection.fromNativePtr(
            collection));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

core.bool _MapObjectVisitor_onClusterizedCollectionVisitStart(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> collection) {
  final listener = MapObjectVisitor._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return listener.onClusterizedCollectionVisitStart(
        mapkit_map_clusterized_placemark_collection
            .ClusterizedPlacemarkCollection.fromNativePtr(collection));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectVisitor_onClusterizedCollectionVisitEnd(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> collection) {
  final listener = MapObjectVisitor._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onClusterizedCollectionVisitEnd(
        mapkit_map_clusterized_placemark_collection
            .ClusterizedPlacemarkCollection.fromNativePtr(collection));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
