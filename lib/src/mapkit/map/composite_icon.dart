import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart'
    as image_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/callback.dart'
    as mapkit_map_callback;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/icon_style.dart'
    as mapkit_map_icon_style;

part 'composite_icon.containers.dart';
part 'composite_icon.impl.dart';

/// Combines multiple icons into one.
abstract class CompositeIcon implements ffi.Finalizable {
  /// Creates or resets a named layer with an icon and its style.
  void setIcon(
    image_provider.ImageProvider image,
    mapkit_map_icon_style.IconStyle style, {
    required core.String name,
  });

  /// Creates or resets a named layer that contains an icon and its style.
  ///
  /// [onFinished] Called when an icon is loaded.
  void setIconWithCallback(
    image_provider.ImageProvider image,
    mapkit_map_icon_style.IconStyle style,
    mapkit_map_callback.Callback onFinished, {
    required core.String name,
  });

  /// Changes the icon style for a specific layer.
  void setIconStyle(
    mapkit_map_icon_style.IconStyle style, {
    required core.String name,
  });

  /// Removes the named layer.
  void removeIcon(core.String name);

  /// Removes all layers.
  void removeAll();
}
