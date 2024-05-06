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
part 'placemark_animation.impl.dart';

/// Provides an interface to load and control animation of placemark.
abstract class PlacemarkAnimation implements ffi.Finalizable {
  /// If true, animation will be played in the reverse direction. Default
  /// value is false.
  core.bool get reversed;
  set reversed(core.bool val);

  /// Sets the animated image and icon style. The new animation will be in
  /// the paused state.
  void setIcon(animated_image_provider.AnimatedImageProvider image,
      mapkit_map_icon_style.IconStyle style);

  /// Sets the animated image and icon style. The new animation will be in
  /// the paused state.
  ///
  /// [onFinished] is called when the icon is loaded.
  void setIconWithCallback(
      animated_image_provider.AnimatedImageProvider image,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished);

  /// Changes the icon style.
  void setIconStyle(mapkit_map_icon_style.IconStyle style);

  /// Starts animation. Removes the current play callback. Same as
  /// play(null).
  void play();

  /// Starts animation and handles the callback.
  ///
  /// [onFinished] is called when animation finishes and replaces the
  /// previous callback.
  void playWithCallback(mapkit_map_callback.Callback onFinished);

  /// Resumes paused animation. Callback (if any) is NOT removed.
  void resume();

  /// Stops animation. Animation returns to the initial paused state.
  void stop();

  /// Pauses animation.
  void pause();
}
