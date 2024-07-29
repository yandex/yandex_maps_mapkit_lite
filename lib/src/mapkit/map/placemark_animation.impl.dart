part of 'placemark_animation.dart';

@bindings_annotations.WeakInterface('mapkit.map.PlacemarkAnimation')
@bindings_annotations.ContainerData(
    toNative: 'PlacemarkAnimationImpl.getNativePtr',
    toPlatform:
        '(val) => PlacemarkAnimationImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'PlacemarkAnimation')
class PlacemarkAnimationImpl implements PlacemarkAnimation, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_PlacemarkAnimation_free.cast());

  /// @nodoc
  PlacemarkAnimationImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  PlacemarkAnimationImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PlacemarkAnimationImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PlacemarkAnimation? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as PlacemarkAnimationImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _PlacemarkAnimation_check(ptr);
  }

  @internal

  /// @nodoc
  static PlacemarkAnimation? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PlacemarkAnimationImpl.fromNativePtr(ptr);
  }

  @core.override
  core.bool get reversed {
    return _PlacemarkAnimation_get_reversed(ptr);
  }

  @core.override
  set reversed(core.bool val) {
    _PlacemarkAnimation_set_reversed(ptr, val);
  }

  void setIcon(animated_image_provider.AnimatedImageProvider image,
      mapkit_map_icon_style.IconStyle style) {
    _PlacemarkAnimation_setIcon(
        ptr,
        to_native.toNativeAnimatedImageProvider(image),
        mapkit_map_icon_style.IconStyleImpl.toNative(style));
  }

  void setIconWithCallback(
      animated_image_provider.AnimatedImageProvider image,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished) {
    _PlacemarkAnimation_setIconWithCallback(
        ptr,
        to_native.toNativeAnimatedImageProvider(image),
        mapkit_map_icon_style.IconStyleImpl.toNative(style),
        mapkit_map_callback.CallbackImpl.getNativePtr(onFinished));
  }

  void setIconStyle(mapkit_map_icon_style.IconStyle style) {
    _PlacemarkAnimation_setIconStyle(
        ptr, mapkit_map_icon_style.IconStyleImpl.toNative(style));
  }

  void play() {
    _PlacemarkAnimation_play(ptr);
  }

  void playWithCallback(mapkit_map_callback.Callback onFinished) {
    _PlacemarkAnimation_playWithCallback(
        ptr, mapkit_map_callback.CallbackImpl.getNativePtr(onFinished));
  }

  void resume() {
    _PlacemarkAnimation_resume(ptr);
  }

  void stop() {
    _PlacemarkAnimation_stop(ptr);
  }

  void pause() {
    _PlacemarkAnimation_pause(ptr);
  }
}

final _PlacemarkAnimation_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkAnimation_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _PlacemarkAnimation_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkAnimation_check')
    .asFunction(isLeaf: true);

final core.bool Function(ffi.Pointer<ffi.Void>)
    _PlacemarkAnimation_get_reversed = lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkAnimation_get_reversed')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _PlacemarkAnimation_set_reversed = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_PlacemarkAnimation_set_reversed')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative) _PlacemarkAnimation_setIcon =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_PlacemarkAnimation_setIcon')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative, ffi.Pointer<ffi.Void>)
    _PlacemarkAnimation_setIconWithCallback = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkAnimation_setIconWithCallback')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_map_icon_style.IconStyleNative)
    _PlacemarkAnimation_setIconStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_PlacemarkAnimation_setIconStyle')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _PlacemarkAnimation_play = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkAnimation_play')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PlacemarkAnimation_playWithCallback = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkAnimation_playWithCallback')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _PlacemarkAnimation_resume = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkAnimation_resume')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _PlacemarkAnimation_stop = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkAnimation_stop')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _PlacemarkAnimation_pause = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkAnimation_pause')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _PlacemarkAnimation_set =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_PlacemarkAnimation_set_')
        .asFunction(isLeaf: true);
