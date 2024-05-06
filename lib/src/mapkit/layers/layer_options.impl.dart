part of 'layer_options.dart';

final class LayerOptionsNative extends ffi.Struct {
  @ffi.Bool()
  external core.bool active;
  @ffi.Bool()
  external core.bool nightModeAvailable;
  @ffi.Bool()
  external core.bool cacheable;
  @ffi.Bool()
  external core.bool animateOnActivation;
  external native_types.NativeInterval tileAppearingAnimationDuration;
  @ffi.Int64()
  external core.int overzoomMode;
  @ffi.Bool()
  external core.bool transparent;
  @ffi.Bool()
  external core.bool versionSupport;
}

final LayerOptionsNative Function(
    core.bool,
    core.bool,
    core.bool,
    core.bool,
    native_types.NativeInterval,
    core.int,
    core.bool,
    core
        .bool) _LayerOptionsNativeInit = lib.library
    .lookup<
        ffi.NativeFunction<
            LayerOptionsNative Function(
                ffi.Bool,
                ffi.Bool,
                ffi.Bool,
                ffi.Bool,
                native_types.NativeInterval,
                ffi.Int64,
                ffi.Bool,
                ffi.Bool)>>('yandex_flutter_mapkit_layers_LayerOptions_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LayerOptionsImpl.toPointer',
    toPlatform: '(val) => LayerOptionsImpl.fromPointer(val, needFree: false)',
    platformType: 'LayerOptions')
extension LayerOptionsImpl on LayerOptions {
  static LayerOptions fromNative(LayerOptionsNative native) {
    return LayerOptions(
        active: native.active,
        nightModeAvailable: native.nightModeAvailable,
        cacheable: native.cacheable,
        animateOnActivation: native.animateOnActivation,
        tileAppearingAnimationDuration: to_platform
            .toPlatformTimeInterval(native.tileAppearingAnimationDuration),
        overzoomMode: mapkit_layers_overzoom_mode.OverzoomModeImpl.fromInt(
            native.overzoomMode),
        transparent: native.transparent,
        versionSupport: native.versionSupport);
  }

  static LayerOptionsNative toNative(LayerOptions obj) {
    return _LayerOptionsNativeInit(
        obj.active,
        obj.nightModeAvailable,
        obj.cacheable,
        obj.animateOnActivation,
        to_native.toNativeTimeInterval(obj.tileAppearingAnimationDuration),
        mapkit_layers_overzoom_mode.OverzoomModeImpl.toInt(obj.overzoomMode),
        obj.transparent,
        obj.versionSupport);
  }

  static LayerOptions? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        LayerOptionsImpl.fromNative(ptr.cast<LayerOptionsNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(LayerOptions? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LayerOptionsNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
