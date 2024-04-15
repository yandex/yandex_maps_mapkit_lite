import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/overzoom_mode.dart'
    as mapkit_layers_overzoom_mode;

part 'layer_options.containers.dart';

/// @nodoc
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
    toNative: 'LayerOptions.toPointer',
    toPlatform: '(val) => LayerOptions.fromPointer(val, needFree: false)')
class LayerOptions {
  final core.bool active;
  final core.bool nightModeAvailable;
  final core.bool cacheable;
  final core.bool animateOnActivation;
  final core.Duration tileAppearingAnimationDuration;
  final mapkit_layers_overzoom_mode.OverzoomMode overzoomMode;
  final core.bool transparent;
  final core.bool versionSupport;

  const LayerOptions({
    this.active = true,
    this.nightModeAvailable = true,
    this.cacheable = false,
    this.animateOnActivation = false,
    this.tileAppearingAnimationDuration =
        const core.Duration(milliseconds: 400),
    this.overzoomMode = mapkit_layers_overzoom_mode.OverzoomMode.Disabled,
    this.transparent = false,
    this.versionSupport = true,
  });

  /// @nodoc
  @internal
  LayerOptions.fromNative(LayerOptionsNative native)
      : this(
            active: native.active,
            nightModeAvailable: native.nightModeAvailable,
            cacheable: native.cacheable,
            animateOnActivation: native.animateOnActivation,
            tileAppearingAnimationDuration: to_platform
                .toPlatformTimeInterval(native.tileAppearingAnimationDuration),
            overzoomMode: mapkit_layers_overzoom_mode.OverzoomMode.fromInt(
                native.overzoomMode),
            transparent: native.transparent,
            versionSupport: native.versionSupport);

  /// @nodoc
  @internal
  static LayerOptionsNative toNative(LayerOptions c) {
    return _LayerOptionsNativeInit(
        c.active,
        c.nightModeAvailable,
        c.cacheable,
        c.animateOnActivation,
        to_native.toNativeTimeInterval(c.tileAppearingAnimationDuration),
        mapkit_layers_overzoom_mode.OverzoomMode.toInt(c.overzoomMode),
        c.transparent,
        c.versionSupport);
  }

  /// @nodoc
  @internal
  static LayerOptions? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = LayerOptions.fromNative(ptr.cast<LayerOptionsNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(LayerOptions? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LayerOptionsNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
