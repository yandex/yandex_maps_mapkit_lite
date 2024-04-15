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
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart'
    as image_provider;
import 'package:yandex_maps_mapkit_lite/src/bindings/ui_view/view_provider.dart'
    as view_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/base_map_object_collection.dart'
    as mapkit_map_base_map_object_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/icon_style.dart'
    as mapkit_map_icon_style;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;

part 'clusterized_placemark_collection.containers.dart';

/// A collection that displays large groups of placemarks efficiently.
/// Placemarks that are too close to each other with current zoom are
/// rendered as a single cluster. Placemarks and clusters are not shown
/// until clusterPlacemarks method is called explicitly.
@bindings_annotations.WeakInterface('mapkit.map.ClusterizedPlacemarkCollection')
@bindings_annotations.ContainerData(
    toNative: 'ClusterizedPlacemarkCollection.getNativePtr',
    toPlatform:
        '(val) => ClusterizedPlacemarkCollection.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class ClusterizedPlacemarkCollection
    extends mapkit_map_base_map_object_collection.BaseMapObjectCollection
    implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_ClusterizedPlacemarkCollection_free.cast());

  /// @nodoc
  ClusterizedPlacemarkCollection.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  ClusterizedPlacemarkCollection.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory ClusterizedPlacemarkCollection.fromNativePtr(
          ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(
      ClusterizedPlacemarkCollection? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _ClusterizedPlacemarkCollection_check(ptr);
  }

  @internal

  /// @nodoc
  static ClusterizedPlacemarkCollection? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return ClusterizedPlacemarkCollection.fromNativePtr(ptr);
  }

  /// Creates a new empty placemark and adds it to the current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemark() {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemark(ptr));
  }

  /// Creates a new empty placemark and adds it to the current collection.
  /// Callback can be used to setup placemark style and position Callback
  /// will be called before MapObjectCollectionListener#onMapObjectAdded
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithCallback(
      mapkit_map_base_map_object_collection.PlacemarkCreatedCallback
          placemarkCreatedCallback) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithCallback(
            ptr,
            mapkit_map_base_map_object_collection.PlacemarkCreatedCallback
                .getNativePtr(placemarkCreatedCallback)));
  }

  /// Creates a new empty placemark and adds it to the current collection.
  /// Hint: to add a large amount of empty placemarks use
  /// addEmptyPlacemarks method.
  mapkit_map_placemark.PlacemarkMapObject addEmptyPlacemark(
      mapkit_geometry_point.Point point) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _ClusterizedPlacemarkCollection_addEmptyPlacemark(
            ptr, mapkit_geometry_point.Point.toNative(point)));
  }

  /// Creates new empty placemarks and adds them to the current collection.
  ///
  /// Relevant for Android: this method provides better performance for
  /// adding a large number of empty placemarks than multiple calls of
  /// addEmptyPlacemark.
  core.List<mapkit_map_placemark.PlacemarkMapObject> addEmptyPlacemarks(
      core.List<mapkit_geometry_point.Point> points) {
    return mapkit_map_placemark.PlacemarkMapObjectContainerExtension
        .toPlatformVector(_ClusterizedPlacemarkCollection_addEmptyPlacemarks(
            ptr,
            mapkit_geometry_point.PointContainerExtension.toNativeVector(
                points)));
  }

  /// Creates a new placemark with the default icon and style, and adds it
  /// to the current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithPoint(
      mapkit_geometry_point.Point point) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithPoint(
            ptr, mapkit_geometry_point.Point.toNative(point)));
  }

  /// Creates a new placemark with the default style and adds it to the
  /// current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithImage(
      mapkit_geometry_point.Point point, image_provider.ImageProvider image) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithImage(
            ptr,
            mapkit_geometry_point.Point.toNative(point),
            to_native.toNativeImageProvider(image)));
  }

  /// Creates a new placemark and adds it to the current collection. Hint:
  /// to add a large amount of placemarks use addPlacemarks method.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithStyle(
      mapkit_geometry_point.Point point,
      image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithStyle(
            ptr,
            mapkit_geometry_point.Point.toNative(point),
            to_native.toNativeImageProvider(image),
            mapkit_map_icon_style.IconStyle.toNative(style)));
  }

  /// Creates a new view placemark with default style and adds it to the
  /// current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithView(
      mapkit_geometry_point.Point point, view_provider.ViewProvider view) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithView(
            ptr,
            mapkit_geometry_point.Point.toNative(point),
            to_native.toNativeViewProvider(view)));
  }

  /// Creates a new view placemark and adds it to the current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithViewStyle(
      mapkit_geometry_point.Point point,
      view_provider.ViewProvider view,
      mapkit_map_icon_style.IconStyle style) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithViewStyle(
            ptr,
            mapkit_geometry_point.Point.toNative(point),
            to_native.toNativeViewProvider(view),
            mapkit_map_icon_style.IconStyle.toNative(style)));
  }

  /// Creates a new placemark with animated icon and adds it to the current
  /// collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithAnimatedImageStyle(
      mapkit_geometry_point.Point point,
      animated_image_provider.AnimatedImageProvider animatedImage,
      mapkit_map_icon_style.IconStyle style) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithAnimatedImageStyle(
            ptr,
            mapkit_geometry_point.Point.toNative(point),
            to_native.toNativeAnimatedImageProvider(animatedImage),
            mapkit_map_icon_style.IconStyle.toNative(style)));
  }

  /// Creates new placemarks and adds them to the current collection.
  /// Relevant for Android: this method provides better performance for
  /// adding a large number of placemarks than multiple calls of
  /// addPlacemark.
  core.List<mapkit_map_placemark.PlacemarkMapObject> addPlacemarkWithImageStyle(
    image_provider.ImageProvider image,
    mapkit_map_icon_style.IconStyle style, {
    required core.List<mapkit_geometry_point.Point> points,
  }) {
    return mapkit_map_placemark.PlacemarkMapObjectContainerExtension
        .toPlatformVector(
            _ClusterizedPlacemarkCollection_addPlacemarkWithImageStyle(
      ptr,
      mapkit_geometry_point.PointContainerExtension.toNativeVector(points),
      to_native.toNativeImageProvider(image),
      mapkit_map_icon_style.IconStyle.toNative(style),
    ));
  }

  /// Updates clustered representations of placemark groups. This method
  /// must be called explicitly to render placemarks and clusters when
  /// collection is created and update them after collection change.
  ///
  /// [clusterRadius] Minimal distance in units between objects that remain
  /// separate. The size of the unit is equal to the size of a pixel when
  /// the camera position's tilt is equal to 0 and the scale factor is
  /// equal to 1.
  /// [minZoom] Minimal zoom level that displays clusters. All placemarks
  /// will be rendered separately at more detailed zoom levels. The value
  /// will be clipped between 0 and 19 (most detailed zoom).
  void clusterPlacemarks({
    required core.double clusterRadius,
    required core.int minZoom,
  }) {
    _ClusterizedPlacemarkCollection_clusterPlacemarks(
        ptr, clusterRadius, minZoom);
  }
}

final _ClusterizedPlacemarkCollection_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_free');
final core.bool Function(ffi.Pointer<ffi.Void>)
    _ClusterizedPlacemarkCollection_check = lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_check')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _ClusterizedPlacemarkCollection_addPlacemark = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_addPlacemark')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<
        ffi
        .Void>) _ClusterizedPlacemarkCollection_addPlacemarkWithCallback = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_addPlacemarkWithCallback')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point
        .PointNative) _ClusterizedPlacemarkCollection_addEmptyPlacemark = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)>>(
        'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_addEmptyPlacemark')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<
        ffi.Void>) _ClusterizedPlacemarkCollection_addEmptyPlacemarks = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_addEmptyPlacemarks')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point
        .PointNative) _ClusterizedPlacemarkCollection_addPlacemarkWithPoint = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)>>(
        'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_addPlacemarkWithPoint')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point.PointNative,
    ffi.Pointer<
        ffi.Void>) _ClusterizedPlacemarkCollection_addPlacemarkWithImage = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_addPlacemarkWithImage')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_point.PointNative,
        ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative)
    _ClusterizedPlacemarkCollection_addPlacemarkWithStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_point.PointNative,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_addPlacemarkWithStyle')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point.PointNative,
    ffi.Pointer<
        ffi.Void>) _ClusterizedPlacemarkCollection_addPlacemarkWithView = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_addPlacemarkWithView')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_point.PointNative,
        ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative)
    _ClusterizedPlacemarkCollection_addPlacemarkWithViewStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_point.PointNative,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_addPlacemarkWithViewStyle')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_point.PointNative,
        ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative)
    _ClusterizedPlacemarkCollection_addPlacemarkWithAnimatedImageStyle = lib
        .library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_point.PointNative,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_addPlacemarkWithAnimatedImageStyle')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative)
    _ClusterizedPlacemarkCollection_addPlacemarkWithImageStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_addPlacemarkWithImageStyle')
        .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core.double,
    core
        .int) _ClusterizedPlacemarkCollection_clusterPlacemarks = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Double, ffi.Uint32)>>(
        'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_clusterPlacemarks')
    .asFunction();
