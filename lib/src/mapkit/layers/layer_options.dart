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

/// Options that are used when adding a layer to the map.

final class LayerOptions {
  /// Inactive layers are not displayed on the map and do not request any
  /// tiles from TileProvider.
  final core.bool active;

  /// Indicates the availability of night mode for this layer (for example,
  /// night mode is disabled for the satellite layer). Default: true.
  final core.bool nightModeAvailable;

  /// Determines whether tiles are cached on persistent storage or not.
  final core.bool cacheable;

  /// Indicates whether layer activation/deactivation should be animated.
  final core.bool animateOnActivation;

  /// Specifies duration of tile appearing animation. Can be set to 0 to
  /// disable animation. Default: 400 ms
  final core.Duration tileAppearingAnimationDuration;

  /// Whether to render tiles from adjacent zoom levels in place of absent
  /// or translucent tiles.
  final mapkit_layers_overzoom_mode.OverzoomMode overzoomMode;

  /// Set this flag if layer is transparent, that is parts of underlying
  /// layers can be seen through it. This will disable some rendering
  /// optimizations that take advantage of layer opacity.
  final core.bool transparent;

  /// Determines if layer supports versioning
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
