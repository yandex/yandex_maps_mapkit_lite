part of 'line_style.dart';

final class LineStyleNative extends ffi.Struct {
  @ffi.Float()
  external core.double strokeWidth;
  @ffi.Float()
  external core.double gradientLength;
  external native_types.NativeColor outlineColor;
  @ffi.Float()
  external core.double outlineWidth;
  @ffi.Bool()
  external core.bool innerOutlineEnabled;
  @ffi.Float()
  external core.double turnRadius;
  @ffi.Float()
  external core.double arcApproximationStep;
  @ffi.Float()
  external core.double dashLength;
  @ffi.Float()
  external core.double gapLength;
  @ffi.Float()
  external core.double dashOffset;
}

final LineStyleNative Function(
        core.double,
        core.double,
        native_types.NativeColor,
        core.double,
        core.bool,
        core.double,
        core.double,
        core.double,
        core.double,
        core.double) _LineStyleNativeInit =
    lib.library
        .lookup<
            ffi.NativeFunction<
                LineStyleNative Function(
                    ffi.Float,
                    ffi.Float,
                    native_types.NativeColor,
                    ffi.Float,
                    ffi.Bool,
                    ffi.Float,
                    ffi.Float,
                    ffi.Float,
                    ffi.Float,
                    ffi.Float)>>('yandex_flutter_mapkit_map_LineStyle_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LineStyleImpl.toPointer',
    toPlatform: '(val) => LineStyleImpl.fromPointer(val, needFree: false)',
    platformType: 'LineStyle')
extension LineStyleImpl on LineStyle {
  static LineStyle fromNative(LineStyleNative native) {
    return LineStyle(
        strokeWidth: native.strokeWidth,
        gradientLength: native.gradientLength,
        outlineColor: to_platform.toPlatformColor(native.outlineColor),
        outlineWidth: native.outlineWidth,
        innerOutlineEnabled: native.innerOutlineEnabled,
        turnRadius: native.turnRadius,
        arcApproximationStep: native.arcApproximationStep,
        dashLength: native.dashLength,
        gapLength: native.gapLength,
        dashOffset: native.dashOffset);
  }

  static LineStyleNative toNative(LineStyle obj) {
    return _LineStyleNativeInit(
        obj.strokeWidth,
        obj.gradientLength,
        to_native.toNativeColor(obj.outlineColor),
        obj.outlineWidth,
        obj.innerOutlineEnabled,
        obj.turnRadius,
        obj.arcApproximationStep,
        obj.dashLength,
        obj.gapLength,
        obj.dashOffset);
  }

  static LineStyle? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = LineStyleImpl.fromNative(ptr.cast<LineStyleNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(LineStyle? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LineStyleNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
