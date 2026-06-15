import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
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
import 'package:yandex_maps_mapkit_lite/src/bindings/ui_view/view_provider.dart'
    as view_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/callback.dart'
    as mapkit_map_callback;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/icon_style.dart'
    as mapkit_map_icon_style;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark_presentation.dart'
    as mapkit_map_placemark_presentation;

part 'icon.containers.dart';
part 'icon.impl.dart';

/// Provides an interface to set icon and its style for a placemark.
abstract class Icon
    implements
        mapkit_map_placemark_presentation.PlacemarkPresentation,
        ffi.Finalizable {
  /// The style properties (scale, zIndex, etc.) of the icon placemark.
  /// Note: The current style cannot be modified directly - you must reset
  /// it to apply changes.
  mapkit_map_icon_style.IconStyle get style;
  set style(mapkit_map_icon_style.IconStyle val);

  /// Sets the image for the icon.
  ///
  /// [style] The icon style. If not specified, the default style is used.
  /// [onFinished] Optional callback invoked when the icon is loaded.
  void setImage(
    image_provider.ImageProvider image, {
    mapkit_map_icon_style.IconStyle? style,
    mapkit_map_callback.Callback? onFinished,
  });

  /// Sets the view for the icon.
  ///
  /// [style] The icon style. If not specified, the default style is used.
  /// [onFinished] Optional callback invoked when the icon is loaded.
  void setView(
    view_provider.ViewProvider view, {
    mapkit_map_icon_style.IconStyle? style,
    mapkit_map_callback.Callback? onFinished,
  });

  core.bool isValid();
}
