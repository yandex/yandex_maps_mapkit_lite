import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/image/animated_image_provider.dart'
    as animated_image_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/callback.dart'
    as mapkit_map_callback;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/icon_style.dart'
    as mapkit_map_icon_style;

part 'placemark_animation.containers.dart';

/// Provides an interface to load and control animation of placemark.
@bindings_annotations.WeakInterface('mapkit.map.PlacemarkAnimation')
@bindings_annotations.ContainerData(
    toNative: 'PlacemarkAnimation.getNativePtr',
    toPlatform:
        '(val) => PlacemarkAnimation.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class PlacemarkAnimation implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_PlacemarkAnimation_free.cast());

  /// @nodoc
  PlacemarkAnimation.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  PlacemarkAnimation.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PlacemarkAnimation.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PlacemarkAnimation? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _PlacemarkAnimation_check(ptr);
  }

  @internal

  /// @nodoc
  static PlacemarkAnimation? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PlacemarkAnimation.fromNativePtr(ptr);
  }

  /// If true, animation will be played in the reverse direction. Default
  /// value is false.
  core.bool get reversed {
    return _PlacemarkAnimation_get_reversed(ptr);
  }

  set reversed(core.bool val) {
    return _PlacemarkAnimation_set_reversed(ptr, val);
  }

  /// Sets the animated image and icon style. The new animation will be in
  /// the paused state.
  void setIcon(animated_image_provider.AnimatedImageProvider image,
      mapkit_map_icon_style.IconStyle style) {
    _PlacemarkAnimation_setIcon(
        ptr,
        to_native.toNativeAnimatedImageProvider(image),
        mapkit_map_icon_style.IconStyle.toNative(style));
  }

  /// Sets the animated image and icon style. The new animation will be in
  /// the paused state.
  ///
  /// [onFinished] is called when the icon is loaded.
  void setIconWithCallback(
      animated_image_provider.AnimatedImageProvider image,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished) {
    _PlacemarkAnimation_setIconWithCallback(
        ptr,
        to_native.toNativeAnimatedImageProvider(image),
        mapkit_map_icon_style.IconStyle.toNative(style),
        mapkit_map_callback.Callback.getNativePtr(onFinished));
  }

  /// Changes the icon style.
  void setIconStyle(mapkit_map_icon_style.IconStyle style) {
    _PlacemarkAnimation_setIconStyle(
        ptr, mapkit_map_icon_style.IconStyle.toNative(style));
  }

  /// Starts animation. Removes the current play callback. Same as
  /// play(null).
  void play() {
    _PlacemarkAnimation_play(ptr);
  }

  /// Starts animation and handles the callback.
  ///
  /// [onFinished] is called when animation finishes and replaces the
  /// previous callback.
  void playWithCallback(mapkit_map_callback.Callback onFinished) {
    _PlacemarkAnimation_playWithCallback(
        ptr, mapkit_map_callback.Callback.getNativePtr(onFinished));
  }

  /// Resumes paused animation. Callback (if any) is NOT removed.
  void resume() {
    _PlacemarkAnimation_resume(ptr);
  }

  /// Stops animation. Animation returns to the initial paused state.
  void stop() {
    _PlacemarkAnimation_stop(ptr);
  }

  /// Pauses animation.
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
