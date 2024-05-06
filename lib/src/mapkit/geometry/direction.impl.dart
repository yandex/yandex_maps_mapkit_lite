part of 'direction.dart';

final class DirectionNative extends ffi.Struct {
  @ffi.Double()
  external core.double azimuth;
  @ffi.Double()
  external core.double tilt;
}

final DirectionNative Function(core.double, core.double) _DirectionNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    DirectionNative Function(ffi.Double, ffi.Double)>>(
            'yandex_flutter_mapkit_geometry_Direction_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'DirectionImpl.toPointer',
    toPlatform: '(val) => DirectionImpl.fromPointer(val, needFree: false)',
    platformType: 'Direction')
extension DirectionImpl on Direction {
  static Direction fromNative(DirectionNative native) {
    return Direction(azimuth: native.azimuth, tilt: native.tilt);
  }

  static DirectionNative toNative(Direction obj) {
    return _DirectionNativeInit(obj.azimuth, obj.tilt);
  }

  static Direction? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = DirectionImpl.fromNative(ptr.cast<DirectionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Direction? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<DirectionNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
