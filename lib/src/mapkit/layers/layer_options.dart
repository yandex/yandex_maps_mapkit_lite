import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
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
part 'layer_options.impl.dart';

final class LayerOptions {
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

  @core.override
  core.int get hashCode => core.Object.hashAll([
        active,
        nightModeAvailable,
        cacheable,
        animateOnActivation,
        tileAppearingAnimationDuration,
        overzoomMode,
        transparent,
        versionSupport
      ]);

  @core.override
  core.bool operator ==(covariant LayerOptions other) {
    if (core.identical(this, other)) {
      return true;
    }
    return active == other.active &&
        nightModeAvailable == other.nightModeAvailable &&
        cacheable == other.cacheable &&
        animateOnActivation == other.animateOnActivation &&
        tileAppearingAnimationDuration ==
            other.tileAppearingAnimationDuration &&
        overzoomMode == other.overzoomMode &&
        transparent == other.transparent &&
        versionSupport == other.versionSupport;
  }

  @core.override
  core.String toString() {
    return "LayerOptions(active: $active, nightModeAvailable: $nightModeAvailable, cacheable: $cacheable, animateOnActivation: $animateOnActivation, tileAppearingAnimationDuration: $tileAppearingAnimationDuration, overzoomMode: $overzoomMode, transparent: $transparent, versionSupport: $versionSupport)";
  }
}
