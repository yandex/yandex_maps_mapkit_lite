part of 'polyline_index.dart';

@bindings_annotations.ContainerData(
    toNative: 'PolylineIndexImpl.getNativePtr',
    toPlatform:
        '(val) => PolylineIndexImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'PolylineIndex')
class PolylineIndexImpl implements PolylineIndex, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_PolylineIndex_free.cast());

  /// @nodoc
  PolylineIndexImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  PolylineIndexImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PolylineIndex? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as PolylineIndexImpl).ptr;
  }

  @internal

  /// @nodoc
  static PolylineIndex? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PolylineIndexImpl.fromNativePtr(ptr);
  }

  mapkit_geometry_geometry.PolylinePosition?
      closestPolylinePositionWithPriority(
    mapkit_geometry_point.Point point,
    PolylineIndexPriority priority, {
    required core.double maxLocationBias,
  }) {
    final result = _PolylineIndex_closestPolylinePositionWithPriority(
        ptr,
        mapkit_geometry_point.PointImpl.toNative(point),
        PolylineIndexPriorityImpl.toInt(priority),
        maxLocationBias);
    return mapkit_geometry_geometry.PolylinePositionImpl.fromPointer(result);
  }

  mapkit_geometry_geometry.PolylinePosition? closestPolylinePosition(
    mapkit_geometry_point.Point point,
    mapkit_geometry_geometry.PolylinePosition positionFrom,
    mapkit_geometry_geometry.PolylinePosition positionTo, {
    required core.double maxLocationBias,
  }) {
    final result = _PolylineIndex_closestPolylinePosition(
        ptr,
        mapkit_geometry_point.PointImpl.toNative(point),
        mapkit_geometry_geometry.PolylinePositionImpl.toNative(positionFrom),
        mapkit_geometry_geometry.PolylinePositionImpl.toNative(positionTo),
        maxLocationBias);
    return mapkit_geometry_geometry.PolylinePositionImpl.fromPointer(result);
  }
}

final _PolylineIndex_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineIndex_free');

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point.PointNative,
    core.int,
    core
        .double) _PolylineIndex_closestPolylinePositionWithPriority = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative, ffi.Int64, ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineIndex_closestPolylinePositionWithPriority')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point.PointNative,
    mapkit_geometry_geometry.PolylinePositionNative,
    mapkit_geometry_geometry.PolylinePositionNative,
    core
        .double) _PolylineIndex_closestPolylinePosition = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative,
                    mapkit_geometry_geometry.PolylinePositionNative,
                    mapkit_geometry_geometry.PolylinePositionNative,
                    ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineIndex_closestPolylinePosition')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _PolylineIndex_set = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
        'yandex_flutter_mapkit_geometry_geo_PolylineIndex_set_')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'PolylineIndexPriorityImpl.toPointer',
    toPlatform:
        '(val) => PolylineIndexPriorityImpl.fromPointer(val, needFree: false)',
    platformType: 'PolylineIndexPriority')
extension PolylineIndexPriorityImpl on PolylineIndexPriority {
  static core.int toInt(PolylineIndexPriority e) {
    return e.index;
  }

  static PolylineIndexPriority fromInt(core.int val) {
    return PolylineIndexPriority.values[val];
  }

  static PolylineIndexPriority? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(PolylineIndexPriority? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
