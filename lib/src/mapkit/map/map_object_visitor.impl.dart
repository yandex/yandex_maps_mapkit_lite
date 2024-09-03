part of 'map_object_visitor.dart';

final class _MapObjectVisitorWrapper implements ffi.Finalizable {
  _MapObjectVisitorWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_MapObjectVisitor_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension MapObjectVisitorImpl on MapObjectVisitor {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<MapObjectVisitor>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<MapObjectVisitor, _MapObjectVisitorWrapper?>();

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
  final listener = MapObjectVisitorImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onPlacemarkVisited(
        mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(placemark));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectVisitor_onPolylineVisited(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> polyline) {
  final listener = MapObjectVisitorImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onPolylineVisited(
        mapkit_map_polyline.PolylineMapObjectImpl.fromNativePtr(polyline));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectVisitor_onPolygonVisited(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> polygon) {
  final listener = MapObjectVisitorImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onPolygonVisited(
        mapkit_map_polygon.PolygonMapObjectImpl.fromNativePtr(polygon));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectVisitor_onCircleVisited(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> circle) {
  final listener = MapObjectVisitorImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onCircleVisited(
        mapkit_map_circle.CircleMapObjectImpl.fromNativePtr(circle));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

core.bool _MapObjectVisitor_onCollectionVisitStart(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> collection) {
  final listener = MapObjectVisitorImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return listener.onCollectionVisitStart(
        mapkit_map_map_object_collection.MapObjectCollectionImpl.fromNativePtr(
            collection));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectVisitor_onCollectionVisitEnd(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> collection) {
  final listener = MapObjectVisitorImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onCollectionVisitEnd(
        mapkit_map_map_object_collection.MapObjectCollectionImpl.fromNativePtr(
            collection));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

core.bool _MapObjectVisitor_onClusterizedCollectionVisitStart(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> collection) {
  final listener = MapObjectVisitorImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return listener.onClusterizedCollectionVisitStart(
        mapkit_map_clusterized_placemark_collection
            .ClusterizedPlacemarkCollectionImpl.fromNativePtr(collection));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _MapObjectVisitor_onClusterizedCollectionVisitEnd(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> collection) {
  final listener = MapObjectVisitorImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onClusterizedCollectionVisitEnd(
        mapkit_map_clusterized_placemark_collection
            .ClusterizedPlacemarkCollectionImpl.fromNativePtr(collection));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
