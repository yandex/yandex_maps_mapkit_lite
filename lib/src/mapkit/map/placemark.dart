import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:math' as math;
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
import 'package:yandex_maps_mapkit_lite/src/bindings/ui_view/view_provider.dart'
    as view_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/callback.dart'
    as mapkit_map_callback;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/composite_icon.dart'
    as mapkit_map_composite_icon;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/icon_style.dart'
    as mapkit_map_icon_style;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as mapkit_map_map_object;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark_animation.dart'
    as mapkit_map_placemark_animation;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/text_style.dart'
    as mapkit_map_text_style;

part 'placemark.containers.dart';
part 'placemark.impl.dart';

/// Represents a geo-positioned object on the map.
abstract class PlacemarkMapObject
    implements mapkit_map_map_object.MapObject, ffi.Finalizable {
  mapkit_geometry_point.Point get geometry;
  set geometry(mapkit_geometry_point.Point val);

  /// Angle between the direction of an object and the direction to north.
  /// Measured in degrees. Default: 0.f.
  core.double get direction;
  set direction(core.double val);

  /// Opacity multiplicator for the placemark content. Values below 0 will
  /// be set to 0. Default: 1.
  core.double get opacity;
  set opacity(core.double val);

  /// Sets an icon with the default style for the placemark. Resets the
  /// animation, the composite icon, the view and the model.
  void setIcon(image_provider.ImageProvider image);

  /// Sets an icon with the given style for the placemark. Resets the
  /// animation, the composite icon, the view and the model.
  void setIconWithStyle(image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style);

  /// Sets an icon with the default style for the placemark. Resets the
  /// animation, the composite icon, the view and the model. The callback
  /// is called immediately after the image finished loading. This means
  /// you can, for example, change the placemark visibility with a new
  /// icon.
  ///
  /// [onFinished] Called when the icon is loaded.
  void setIconWithCallback(image_provider.ImageProvider image,
      mapkit_map_callback.Callback onFinished);

  /// Sets an icon with the given style for the placemark. Resets the
  /// animation, the composite icon, the view and the model. The callback
  /// is called immediately after the image finished loading. This means
  /// you can, for example, change the placemark visibility with a new
  /// icon.
  ///
  /// [onFinished] Called when the icon is loaded.
  void setIconWithStyleAndCallback(
      image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished);

  /// Changes the icon style. Valid only for the single icon, the view and
  /// the animated icon.
  void setIconStyle(mapkit_map_icon_style.IconStyle style);

  /// Sets and returns the composite icon. Resets the single icon, the
  /// animation, the view and the model.
  mapkit_map_composite_icon.CompositeIcon useCompositeIcon();

  /// Sets and returns the placemark animation. Resets the single icon, the
  /// composite icon, the view and the model.
  mapkit_map_placemark_animation.PlacemarkAnimation useAnimation();

  /// Sets the view with the default style for the placemark. Resets icons,
  /// animation and the model.
  void setView(view_provider.ViewProvider view);

  /// Sets the view with the given style for the placemark. Resets icons,
  /// animation and the model.
  void setViewWithStyle(
      view_provider.ViewProvider view, mapkit_map_icon_style.IconStyle style);

  /// Sets the view with the default style for the placemark. Resets icons,
  /// animation and the model. The callback will be called immediately
  /// after the view finished loading.
  ///
  /// [onFinished] Called when the icon is loaded.
  void setViewWithCallback(
      view_provider.ViewProvider view, mapkit_map_callback.Callback onFinished);

  /// Sets the view with the given style for the placemark. Resets icons,
  /// animation and the model. The callback will be called immediately
  /// after the view finished loading.
  ///
  /// [onFinished] Called when the icon is loaded.
  void setViewWithStyleAndCallback(
      view_provider.ViewProvider view,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished);

  /// Sets piecewise linear scale, depending on the zoom. The 'points' must
  /// be sorted by x; x coordinates must be unique. If zoom <
  /// minZoom(points) or zoom > maxZoom(points), it is set within the
  /// defined bounds before applying the function. By default, the scale
  /// function is defined by a single point (1, 1). If points is null or
  /// points.empty(), it resets the function to the default. If
  /// points.size() == 1, the scale is constant and equals point.y.
  void setScaleFunction(core.List<math.Point<core.double>> points);

  /// Sets the text for the placemark, current text style is used
  ///
  /// [text] is a string in UTF-8 encoding
  void setText(core.String text);

  /// Sets the text with the given style for the placemark
  ///
  /// [text] is a string in UTF-8 encoding
  void setTextWithStyle(
    mapkit_map_text_style.TextStyle style, {
    required core.String text,
  });

  /// Changes the text style.
  void setTextStyle(mapkit_map_text_style.TextStyle style);

  core.bool isValid();
}
