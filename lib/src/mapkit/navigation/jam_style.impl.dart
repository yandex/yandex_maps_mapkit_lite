part of 'jam_style.dart';

final class JamTypeColorNative extends ffi.Struct {
  @ffi.Int64()
  external core.int jamType;
  external native_types.NativeColor jamColor;
}

final JamTypeColorNative Function(core.int, native_types.NativeColor)
    _JamTypeColorNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    JamTypeColorNative Function(
                        ffi.Int64, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_navigation_JamTypeColor_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'JamTypeColorImpl.toPointer',
    toPlatform: '(val) => JamTypeColorImpl.fromPointer(val, needFree: false)',
    platformType: 'JamTypeColor')
extension JamTypeColorImpl on JamTypeColor {
  static JamTypeColor fromNative(JamTypeColorNative native) {
    return JamTypeColor(
        mapkit_navigation_jam_segment.JamTypeImpl.fromInt(native.jamType),
        to_platform.toPlatformColor(native.jamColor));
  }

  static JamTypeColorNative toNative(JamTypeColor obj) {
    return _JamTypeColorNativeInit(
        mapkit_navigation_jam_segment.JamTypeImpl.toInt(obj.jamType),
        to_native.toNativeColor(obj.jamColor));
  }

  static JamTypeColor? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        JamTypeColorImpl.fromNative(ptr.cast<JamTypeColorNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(JamTypeColor? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<JamTypeColorNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'JamStyleImpl.toPointer',
    toPlatform: '(val) => JamStyleImpl.fromPointer(val, needFree: false)',
    platformType: 'JamStyle')
final class JamStyleImpl implements JamStyle {
  JamStyleImpl(core.List<JamTypeColor> colors)
      : this.fromNativePtr(_JamStyle_init(
            JamTypeColorContainerExtension.toNativeVector(colors)));

  @core.override
  late final colors = JamTypeColorContainerExtension.toPlatformVector(
      _JamStyle_get_colors(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_JamStyle_free.cast());

  JamStyleImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(JamStyle? obj) {
    return (obj as JamStyleImpl?)?._ptr ?? ffi.nullptr;
  }

  static JamStyle? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : JamStyleImpl.fromNativePtr(ptr);
  }

  static JamStyle? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        JamStyleImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(JamStyle? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _JamStyle_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _JamStyle_clone =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_navigation_JamStyle_clone')
        .asFunction(isLeaf: true);

final _JamStyle_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_navigation_JamStyle_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _JamStyle_init = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_navigation_JamStyle_init')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _JamStyle_get_colors = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_navigation_JamStyle_get_colors')
        .asFunction(isLeaf: true);
