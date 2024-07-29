part of 'request_point.dart';

@bindings_annotations.ContainerData(
    toNative: 'RequestPointTypeImpl.toPointer',
    toPlatform:
        '(val) => RequestPointTypeImpl.fromPointer(val, needFree: false)',
    platformType: 'RequestPointType')
extension RequestPointTypeImpl on RequestPointType {
  static core.int toInt(RequestPointType e) {
    return e.index;
  }

  static RequestPointType fromInt(core.int val) {
    return RequestPointType.values[val];
  }

  static RequestPointType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(RequestPointType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'RequestPointImpl.getNativePtr',
    toPlatform: '(val) => RequestPointImpl.fromPointer(val, needFree: false)',
    platformType: 'RequestPoint')
final class RequestPointImpl implements RequestPoint {
  RequestPointImpl(mapkit_geometry_point.Point point, RequestPointType type,
      core.String? pointContext, core.String? drivingArrivalPointId)
      : this.fromNativePtr(_RequestPoint_init(
            mapkit_geometry_point.PointImpl.toNative(point),
            RequestPointTypeImpl.toInt(type),
            to_native.toNativePtrString(pointContext),
            to_native.toNativePtrString(drivingArrivalPointId)));

  @core.override
  late final point =
      mapkit_geometry_point.PointImpl.fromNative(_RequestPoint_get_point(_ptr));
  @core.override
  late final type = RequestPointTypeImpl.fromInt(_RequestPoint_get_type(_ptr));
  @core.override
  late final pointContext = to_platform
      .toPlatformFromPointerString(_RequestPoint_get_pointContext(_ptr));
  @core.override
  late final drivingArrivalPointId = to_platform.toPlatformFromPointerString(
      _RequestPoint_get_drivingArrivalPointId(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_RequestPoint_free.cast());

  RequestPointImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(RequestPoint? obj) {
    return (obj as RequestPointImpl?)?._ptr ?? ffi.nullptr;
  }

  static RequestPoint? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : RequestPointImpl.fromNativePtr(ptr);
  }

  static RequestPoint? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        RequestPointImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

final _RequestPoint_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_RequestPoint_free');

final ffi.Pointer<ffi.Void> Function(mapkit_geometry_point.PointNative,
        core.int, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _RequestPoint_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        mapkit_geometry_point.PointNative,
                        ffi.Int64,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RequestPoint_init')
        .asFunction(isLeaf: true);

final mapkit_geometry_point.PointNative Function(ffi.Pointer<ffi.Void>)
    _RequestPoint_get_point = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_point.PointNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RequestPoint_get_point')
        .asFunction(isLeaf: true);
final core.int Function(ffi.Pointer<ffi.Void>) _RequestPoint_get_type = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_RequestPoint_get_type')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _RequestPoint_get_pointContext = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RequestPoint_get_pointContext')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _RequestPoint_get_drivingArrivalPointId = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RequestPoint_get_drivingArrivalPointId')
        .asFunction(isLeaf: true);
