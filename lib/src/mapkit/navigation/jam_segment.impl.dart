part of 'jam_segment.dart';

@bindings_annotations.ContainerData(
    toNative: 'JamTypeImpl.toPointer',
    toPlatform: '(val) => JamTypeImpl.fromPointer(val, needFree: false)',
    platformType: 'JamType')
extension JamTypeImpl on JamType {
  static core.int toInt(JamType e) {
    return e.index;
  }

  static JamType fromInt(core.int val) {
    return JamType.values[val];
  }

  static JamType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(JamType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

final class JamSegmentNative extends ffi.Struct {
  @ffi.Int64()
  external core.int jamType;
  @ffi.Double()
  external core.double speed;
}

final JamSegmentNative Function(core.int, core.double) _JamSegmentNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    JamSegmentNative Function(ffi.Int64, ffi.Double)>>(
            'yandex_flutter_mapkit_navigation_JamSegment_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'JamSegmentImpl.toPointer',
    toPlatform: '(val) => JamSegmentImpl.fromPointer(val, needFree: false)',
    platformType: 'JamSegment')
extension JamSegmentImpl on JamSegment {
  static JamSegment fromNative(JamSegmentNative native) {
    return JamSegment(JamTypeImpl.fromInt(native.jamType), speed: native.speed);
  }

  static JamSegmentNative toNative(JamSegment obj) {
    return _JamSegmentNativeInit(JamTypeImpl.toInt(obj.jamType), obj.speed);
  }

  static JamSegment? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = JamSegmentImpl.fromNative(ptr.cast<JamSegmentNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(JamSegment? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<JamSegmentNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
