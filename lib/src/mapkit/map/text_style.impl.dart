part of 'text_style.dart';

final class TextStyleNative extends ffi.Struct {
  @ffi.Float()
  external core.double size;
  external native_types.NativeColor color;
  @ffi.Float()
  external core.double outlineWidth;
  external native_types.NativeColor outlineColor;
  @ffi.Int64()
  external core.int placement;
  @ffi.Float()
  external core.double offset;
  @ffi.Bool()
  external core.bool offsetFromIcon;
  @ffi.Bool()
  external core.bool textOptional;
}

final TextStyleNative Function(
        core.double,
        native_types.NativeColor,
        core.double,
        native_types.NativeColor,
        core.int,
        core.double,
        core.bool,
        core.bool) _TextStyleNativeInit =
    lib.library
        .lookup<
            ffi.NativeFunction<
                TextStyleNative Function(
                    ffi.Float,
                    native_types.NativeColor,
                    ffi.Float,
                    native_types.NativeColor,
                    ffi.Int64,
                    ffi.Float,
                    ffi.Bool,
                    ffi.Bool)>>('yandex_flutter_mapkit_map_TextStyle_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'TextStyleImpl.toPointer',
    toPlatform: '(val) => TextStyleImpl.fromPointer(val, needFree: false)',
    platformType: 'TextStyle')
extension TextStyleImpl on TextStyle {
  static TextStyle fromNative(TextStyleNative native) {
    return TextStyle(
        size: native.size,
        color: to_platform.toPlatformColor(native.color),
        outlineWidth: native.outlineWidth,
        outlineColor: to_platform.toPlatformColor(native.outlineColor),
        placement: TextStylePlacementImpl.fromInt(native.placement),
        offset: native.offset,
        offsetFromIcon: native.offsetFromIcon,
        textOptional: native.textOptional);
  }

  static TextStyleNative toNative(TextStyle obj) {
    return _TextStyleNativeInit(
        obj.size,
        to_native.toNativeColor(obj.color),
        obj.outlineWidth,
        to_native.toNativeColor(obj.outlineColor),
        TextStylePlacementImpl.toInt(obj.placement),
        obj.offset,
        obj.offsetFromIcon,
        obj.textOptional);
  }

  static TextStyle? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = TextStyleImpl.fromNative(ptr.cast<TextStyleNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(TextStyle? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<TextStyleNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'TextStylePlacementImpl.toPointer',
    toPlatform:
        '(val) => TextStylePlacementImpl.fromPointer(val, needFree: false)',
    platformType: 'TextStylePlacement')
extension TextStylePlacementImpl on TextStylePlacement {
  static core.int toInt(TextStylePlacement e) {
    return e.index;
  }

  static TextStylePlacement fromInt(core.int val) {
    return TextStylePlacement.values[val];
  }

  static TextStylePlacement? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(TextStylePlacement? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
