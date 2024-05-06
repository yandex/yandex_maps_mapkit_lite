part of 'icon_style.dart';

final class IconStyleNative extends ffi.Struct {
  external ffi.Pointer<ffi.Void> anchor;
  external ffi.Pointer<ffi.Void> rotationType;
  external ffi.Pointer<ffi.Void> zIndex;
  external ffi.Pointer<ffi.Void> flat;
  external ffi.Pointer<ffi.Void> visible;
  external ffi.Pointer<ffi.Void> scale;
  external ffi.Pointer<ffi.Void> tappableArea;
}

final IconStyleNative Function(
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>) _IconStyleNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    IconStyleNative Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_IconStyle_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'IconStyleImpl.toPointer',
    toPlatform: '(val) => IconStyleImpl.fromPointer(val, needFree: false)',
    platformType: 'IconStyle')
extension IconStyleImpl on IconStyle {
  static IconStyle fromNative(IconStyleNative native) {
    return IconStyle(
        anchor: to_platform.toPlatformFromPointerPoint(native.anchor),
        rotationType: mapkit_map_rotation_type.RotationTypeImpl.fromPointer(
            native.rotationType),
        zIndex: to_platform.toPlatformFromPointerFloat(native.zIndex),
        flat: to_platform.toPlatformFromPointerBool(native.flat),
        visible: to_platform.toPlatformFromPointerBool(native.visible),
        scale: to_platform.toPlatformFromPointerFloat(native.scale),
        tappableArea:
            mapkit_map_rect.RectImpl.fromPointer(native.tappableArea));
  }

  static IconStyleNative toNative(IconStyle obj) {
    return _IconStyleNativeInit(
        to_native.toNativePtrPoint(obj.anchor),
        mapkit_map_rotation_type.RotationTypeImpl.toPointer(obj.rotationType),
        to_native.toNativePtrFloat(obj.zIndex),
        to_native.toNativePtrBool(obj.flat),
        to_native.toNativePtrBool(obj.visible),
        to_native.toNativePtrFloat(obj.scale),
        mapkit_map_rect.RectImpl.toPointer(obj.tappableArea));
  }

  static IconStyle? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = IconStyleImpl.fromNative(ptr.cast<IconStyleNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(IconStyle? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<IconStyleNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
