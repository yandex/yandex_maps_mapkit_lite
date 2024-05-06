part of 'span.dart';

final class SpanNative extends ffi.Struct {
  @ffi.Double()
  external core.double horizontalAngle;
  @ffi.Double()
  external core.double verticalAngle;
}

final SpanNative Function(core.double, core.double) _SpanNativeInit = lib
    .library
    .lookup<ffi.NativeFunction<SpanNative Function(ffi.Double, ffi.Double)>>(
        'yandex_flutter_mapkit_geometry_Span_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'SpanImpl.toPointer',
    toPlatform: '(val) => SpanImpl.fromPointer(val, needFree: false)',
    platformType: 'Span')
extension SpanImpl on Span {
  static Span fromNative(SpanNative native) {
    return Span(
        horizontalAngle: native.horizontalAngle,
        verticalAngle: native.verticalAngle);
  }

  static SpanNative toNative(Span obj) {
    return _SpanNativeInit(obj.horizontalAngle, obj.verticalAngle);
  }

  static Span? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = SpanImpl.fromNative(ptr.cast<SpanNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Span? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<SpanNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
