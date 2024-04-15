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

/// Represents a geo-positioned object on the map.
@bindings_annotations.WeakInterface('mapkit.map.PlacemarkMapObject')
@bindings_annotations.ContainerData(
    toNative: 'PlacemarkMapObject.getNativePtr',
    toPlatform:
        '(val) => PlacemarkMapObject.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class PlacemarkMapObject extends mapkit_map_map_object.MapObject
    implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_PlacemarkMapObject_free.cast());

  /// @nodoc
  PlacemarkMapObject.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  PlacemarkMapObject.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PlacemarkMapObject.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PlacemarkMapObject? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _PlacemarkMapObject_check(ptr);
  }

  @internal

  /// @nodoc
  static PlacemarkMapObject? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PlacemarkMapObject.fromNativePtr(ptr);
  }

  mapkit_geometry_point.Point get geometry {
    return mapkit_geometry_point.Point.fromNative(
        _PlacemarkMapObject_get_geometry(ptr));
  }

  set geometry(mapkit_geometry_point.Point val) {
    return _PlacemarkMapObject_set_geometry(
        ptr, mapkit_geometry_point.Point.toNative(val));
  }

  /// Angle between the direction of an object and the direction to north.
  /// Measured in degrees. Default: 0.f.
  core.double get direction {
    return _PlacemarkMapObject_get_direction(ptr);
  }

  set direction(core.double val) {
    return _PlacemarkMapObject_set_direction(ptr, val);
  }

  /// Opacity multiplicator for the placemark content. Values below 0 will
  /// be set to 0. Default: 1.
  core.double get opacity {
    return _PlacemarkMapObject_get_opacity(ptr);
  }

  set opacity(core.double val) {
    return _PlacemarkMapObject_set_opacity(ptr, val);
  }

  /// Sets an icon with the default style for the placemark. Resets the
  /// animation, the composite icon, the view and the model.
  void setIcon(image_provider.ImageProvider image) {
    _PlacemarkMapObject_setIcon(ptr, to_native.toNativeImageProvider(image));
  }

  /// Sets an icon with the given style for the placemark. Resets the
  /// animation, the composite icon, the view and the model.
  void setIconWithStyle(image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style) {
    _PlacemarkMapObject_setIconWithStyle(
        ptr,
        to_native.toNativeImageProvider(image),
        mapkit_map_icon_style.IconStyle.toNative(style));
  }

  /// Sets an icon with the default style for the placemark. Resets the
  /// animation, the composite icon, the view and the model. The callback
  /// is called immediately after the image finished loading. This means
  /// you can, for example, change the placemark visibility with a new
  /// icon.
  ///
  /// [onFinished] Called when the icon is loaded.
  void setIconWithCallback(image_provider.ImageProvider image,
      mapkit_map_callback.Callback onFinished) {
    _PlacemarkMapObject_setIconWithCallback(
        ptr,
        to_native.toNativeImageProvider(image),
        mapkit_map_callback.Callback.getNativePtr(onFinished));
  }

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
      mapkit_map_callback.Callback onFinished) {
    _PlacemarkMapObject_setIconWithStyleAndCallback(
        ptr,
        to_native.toNativeImageProvider(image),
        mapkit_map_icon_style.IconStyle.toNative(style),
        mapkit_map_callback.Callback.getNativePtr(onFinished));
  }

  /// Changes the icon style. Valid only for the single icon, the view and
  /// the animated icon.
  void setIconStyle(mapkit_map_icon_style.IconStyle style) {
    _PlacemarkMapObject_setIconStyle(
        ptr, mapkit_map_icon_style.IconStyle.toNative(style));
  }

  /// Sets and returns the composite icon. Resets the single icon, the
  /// animation, the view and the model.
  mapkit_map_composite_icon.CompositeIcon useCompositeIcon() {
    return mapkit_map_composite_icon.CompositeIcon.fromNativePtr(
        _PlacemarkMapObject_useCompositeIcon(ptr));
  }

  /// Sets and returns the placemark animation. Resets the single icon, the
  /// composite icon, the view and the model.
  mapkit_map_placemark_animation.PlacemarkAnimation useAnimation() {
    return mapkit_map_placemark_animation.PlacemarkAnimation.fromNativePtr(
        _PlacemarkMapObject_useAnimation(ptr));
  }

  /// Sets the view with the default style for the placemark. Resets icons,
  /// animation and the model.
  void setView(view_provider.ViewProvider view) {
    _PlacemarkMapObject_setView(ptr, to_native.toNativeViewProvider(view));
  }

  /// Sets the view with the given style for the placemark. Resets icons,
  /// animation and the model.
  void setViewWithStyle(
      view_provider.ViewProvider view, mapkit_map_icon_style.IconStyle style) {
    _PlacemarkMapObject_setViewWithStyle(
        ptr,
        to_native.toNativeViewProvider(view),
        mapkit_map_icon_style.IconStyle.toNative(style));
  }

  /// Sets the view with the default style for the placemark. Resets icons,
  /// animation and the model. The callback will be called immediately
  /// after the view finished loading.
  ///
  /// [onFinished] Called when the icon is loaded.
  void setViewWithCallback(view_provider.ViewProvider view,
      mapkit_map_callback.Callback onFinished) {
    _PlacemarkMapObject_setViewWithCallback(
        ptr,
        to_native.toNativeViewProvider(view),
        mapkit_map_callback.Callback.getNativePtr(onFinished));
  }

  /// Sets the view with the given style for the placemark. Resets icons,
  /// animation and the model. The callback will be called immediately
  /// after the view finished loading.
  ///
  /// [onFinished] Called when the icon is loaded.
  void setViewWithStyleAndCallback(
      view_provider.ViewProvider view,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished) {
    _PlacemarkMapObject_setViewWithStyleAndCallback(
        ptr,
        to_native.toNativeViewProvider(view),
        mapkit_map_icon_style.IconStyle.toNative(style),
        mapkit_map_callback.Callback.getNativePtr(onFinished));
  }

  /// Sets piecewise linear scale, depending on the zoom. The 'points' must
  /// be sorted by x; x coordinates must be unique. If zoom <
  /// minZoom(points) or zoom > maxZoom(points), it is set within the
  /// defined bounds before applying the function. By default, the scale
  /// function is defined by a single point (1, 1). If points is null or
  /// points.empty(), it resets the function to the default. If
  /// points.size() == 1, the scale is constant and equals point.y.
  void setScaleFunction(core.List<math.Point<core.double>> points) {
    _PlacemarkMapObject_setScaleFunction(
        ptr, to_native.toNativeVectorPoint(points));
  }

  /// Sets the text for the placemark, current text style is used
  ///
  /// [text] is a string in UTF-8 encoding
  void setText(core.String text) {
    _PlacemarkMapObject_setText(ptr, to_native.toNativeString(text));
  }

  /// Sets the text with the given style for the placemark
  ///
  /// [text] is a string in UTF-8 encoding
  void setTextWithStyle(
    mapkit_map_text_style.TextStyle style, {
    required core.String text,
  }) {
    _PlacemarkMapObject_setTextWithStyle(
      ptr,
      to_native.toNativeString(text),
      mapkit_map_text_style.TextStyle.toNative(style),
    );
  }

  /// Changes the text style.
  void setTextStyle(mapkit_map_text_style.TextStyle style) {
    _PlacemarkMapObject_setTextStyle(
        ptr, mapkit_map_text_style.TextStyle.toNative(style));
  }
}

final _PlacemarkMapObject_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkMapObject_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _PlacemarkMapObject_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkMapObject_check')
    .asFunction(isLeaf: true);

final mapkit_geometry_point.PointNative Function(ffi.Pointer<ffi.Void>)
    _PlacemarkMapObject_get_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_point.PointNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_get_geometry')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)
    _PlacemarkMapObject_set_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_set_geometry')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _PlacemarkMapObject_get_direction = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_get_direction')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _PlacemarkMapObject_set_direction = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_set_direction')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>)
    _PlacemarkMapObject_get_opacity = lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_get_opacity')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _PlacemarkMapObject_set_opacity = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_set_opacity')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PlacemarkMapObject_setIcon = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_setIcon')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative)
    _PlacemarkMapObject_setIconWithStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_setIconWithStyle')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PlacemarkMapObject_setIconWithCallback = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_setIconWithCallback')
        .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    mapkit_map_icon_style.IconStyleNative,
    ffi.Pointer<
        ffi.Void>) _PlacemarkMapObject_setIconWithStyleAndCallback = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>,
                    ffi.Pointer<ffi.Void>,
                    mapkit_map_icon_style.IconStyleNative,
                    ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkMapObject_setIconWithStyleAndCallback')
    .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_map_icon_style.IconStyleNative)
    _PlacemarkMapObject_setIconStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_setIconStyle')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _PlacemarkMapObject_useCompositeIcon = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_useCompositeIcon')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _PlacemarkMapObject_useAnimation = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_useAnimation')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PlacemarkMapObject_setView = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_setView')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative)
    _PlacemarkMapObject_setViewWithStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_setViewWithStyle')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PlacemarkMapObject_setViewWithCallback = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_setViewWithCallback')
        .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    mapkit_map_icon_style.IconStyleNative,
    ffi.Pointer<
        ffi.Void>) _PlacemarkMapObject_setViewWithStyleAndCallback = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>,
                    ffi.Pointer<ffi.Void>,
                    mapkit_map_icon_style.IconStyleNative,
                    ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkMapObject_setViewWithStyleAndCallback')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PlacemarkMapObject_setScaleFunction = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_setScaleFunction')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _PlacemarkMapObject_setText = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_setText')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString,
        mapkit_map_text_style.TextStyleNative)
    _PlacemarkMapObject_setTextWithStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        native_types.NativeString,
                        mapkit_map_text_style.TextStyleNative)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_setTextWithStyle')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_map_text_style.TextStyleNative)
    _PlacemarkMapObject_setTextStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_map_text_style.TextStyleNative)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_setTextStyle')
        .asFunction();
