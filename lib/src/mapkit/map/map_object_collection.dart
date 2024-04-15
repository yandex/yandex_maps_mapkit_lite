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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/base_map_object_collection.dart'
    as mapkit_map_base_map_object_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/circle.dart'
    as mapkit_map_circle;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/cluster_listener.dart'
    as mapkit_map_cluster_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/clusterized_placemark_collection.dart'
    as mapkit_map_clusterized_placemark_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/icon_style.dart'
    as mapkit_map_icon_style;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemarks_styler.dart'
    as mapkit_map_placemarks_styler;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polygon.dart'
    as mapkit_map_polygon;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polyline.dart'
    as mapkit_map_polyline;

part 'map_object_collection.containers.dart';

/// A collection of map objects that can hold any set of MapObject items,
/// including nested collections.
@bindings_annotations.WeakInterface('mapkit.map.MapObjectCollection')
@bindings_annotations.ContainerData(
    toNative: 'MapObjectCollection.getNativePtr',
    toPlatform:
        '(val) => MapObjectCollection.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class MapObjectCollection extends mapkit_map_base_map_object_collection
    .BaseMapObjectCollection implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_MapObjectCollection_free.cast());

  /// @nodoc
  MapObjectCollection.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  MapObjectCollection.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory MapObjectCollection.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(MapObjectCollection? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _MapObjectCollection_check(ptr);
  }

  @internal

  /// @nodoc
  static MapObjectCollection? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return MapObjectCollection.fromNativePtr(ptr);
  }

  /// Creates a new empty placemark and adds it to the current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemark() {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _MapObjectCollection_addPlacemark(ptr));
  }

  /// Creates a new empty placemark and adds it to the current collection.
  /// Callback can be used to setup placemark style and position Callback
  /// will be called before MapObjectCollectionListener#onMapObjectAdded
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithCallback(
      mapkit_map_base_map_object_collection.PlacemarkCreatedCallback
          placemarkCreatedCallback) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _MapObjectCollection_addPlacemarkWithCallback(
            ptr,
            mapkit_map_base_map_object_collection.PlacemarkCreatedCallback
                .getNativePtr(placemarkCreatedCallback)));
  }

  /// Creates a new empty placemark and adds it to the current collection.
  mapkit_map_placemark.PlacemarkMapObject addEmptyPlacemark(
      mapkit_geometry_point.Point point) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _MapObjectCollection_addEmptyPlacemark(
            ptr, mapkit_geometry_point.Point.toNative(point)));
  }

  /// Creates a new placemark with the default icon and style, and adds it
  /// to the current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithPoint(
      mapkit_geometry_point.Point point) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _MapObjectCollection_addPlacemarkWithPoint(
            ptr, mapkit_geometry_point.Point.toNative(point)));
  }

  /// Creates a new placemark with the default style and adds it to the
  /// current collection.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithImage(
      mapkit_geometry_point.Point point, image_provider.ImageProvider image) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _MapObjectCollection_addPlacemarkWithImage(
            ptr,
            mapkit_geometry_point.Point.toNative(point),
            to_native.toNativeImageProvider(image)));
  }

  /// Creates a new placemark and adds it to the current collection. Hint:
  /// to add a large amount of placemarks use addPlacemarks method.
  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithImageStyle(
      mapkit_geometry_point.Point point,
      image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style) {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _MapObjectCollection_addPlacemarkWithImageStyle(
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
        _MapObjectCollection_addPlacemarkWithView(
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
        _MapObjectCollection_addPlacemarkWithViewStyle(
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
        _MapObjectCollection_addPlacemarkWithAnimatedImageStyle(
            ptr,
            mapkit_geometry_point.Point.toNative(point),
            to_native.toNativeAnimatedImageProvider(animatedImage),
            mapkit_map_icon_style.IconStyle.toNative(style)));
  }

  /// Creates new placemarks and adds them to the current collection.
  /// Relevant for Android: this method provides better performance for
  /// adding a large number of placemarks than multiple calls of
  /// addPlacemark.
  core.List<mapkit_map_placemark.PlacemarkMapObject> addPlacemarks(
    image_provider.ImageProvider image,
    mapkit_map_icon_style.IconStyle style, {
    required core.List<mapkit_geometry_point.Point> points,
  }) {
    return mapkit_map_placemark.PlacemarkMapObjectContainerExtension
        .toPlatformVector(_MapObjectCollection_addPlacemarks(
      ptr,
      mapkit_geometry_point.PointContainerExtension.toNativeVector(points),
      to_native.toNativeImageProvider(image),
      mapkit_map_icon_style.IconStyle.toNative(style),
    ));
  }

  /// Creates new empty placemarks and adds them to the current collection.
  ///
  /// Relevant for Android: this method provides better performance for
  /// adding a large number of empty placemarks than multiple calls of
  /// addEmptyPlacemark.
  core.List<mapkit_map_placemark.PlacemarkMapObject> addEmptyPlacemarks(
      core.List<mapkit_geometry_point.Point> points) {
    return mapkit_map_placemark.PlacemarkMapObjectContainerExtension
        .toPlatformVector(_MapObjectCollection_addEmptyPlacemarks(
            ptr,
            mapkit_geometry_point.PointContainerExtension.toNativeVector(
                points)));
  }

  /// Creates a new polyline and adds it to the current collection.
  mapkit_map_polyline.PolylineMapObject addPolylineWithGeometry(
      mapkit_geometry_geometry.Polyline polyline) {
    return mapkit_map_polyline.PolylineMapObject.fromNativePtr(
        _MapObjectCollection_addPolylineWithGeometry(
            ptr, mapkit_geometry_geometry.Polyline.getNativePtr(polyline)));
  }

  /// Creates a new polyline with an empty geometry and adds it to the
  /// current collection.
  mapkit_map_polyline.PolylineMapObject addPolyline() {
    return mapkit_map_polyline.PolylineMapObject.fromNativePtr(
        _MapObjectCollection_addPolyline(ptr));
  }

  /// Creates a new polygon and adds it to the current collection.
  mapkit_map_polygon.PolygonMapObject addPolygon(
      mapkit_geometry_geometry.Polygon polygon) {
    return mapkit_map_polygon.PolygonMapObject.fromNativePtr(
        _MapObjectCollection_addPolygon(
            ptr, mapkit_geometry_geometry.Polygon.getNativePtr(polygon)));
  }

  /// Creates a new circle and adds it to the current collection.
  mapkit_map_circle.CircleMapObject addCircle(
      mapkit_geometry_geometry.Circle circle) {
    return mapkit_map_circle.CircleMapObject.fromNativePtr(
        _MapObjectCollection_addCircle(
            ptr, mapkit_geometry_geometry.Circle.toNative(circle)));
  }

  /// Creates a new nested collection of map objects.
  MapObjectCollection addCollection() {
    return MapObjectCollection.fromNativePtr(
        _MapObjectCollection_addCollection(ptr));
  }

  /// Creates a new nested collection of clusterized placemarks.
  ///
  /// The class does not retain the object in the 'clusterListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  ///
  /// [clusterListener] Listener that controls cluster appearance once they
  /// are added to the map.
  mapkit_map_clusterized_placemark_collection.ClusterizedPlacemarkCollection
      addClusterizedPlacemarkCollection(
          mapkit_map_cluster_listener.ClusterListener clusterListener) {
    return mapkit_map_clusterized_placemark_collection
            .ClusterizedPlacemarkCollection
        .fromNativePtr(_MapObjectCollection_addClusterizedPlacemarkCollection(
            ptr,
            mapkit_map_cluster_listener.ClusterListener.getNativePtr(
                clusterListener)));
  }

  /// A styler for all placemarks in this collection, including placemarks
  /// in child collections.
  mapkit_map_placemarks_styler.PlacemarksStyler placemarksStyler() {
    return mapkit_map_placemarks_styler.PlacemarksStyler.fromNativePtr(
        _MapObjectCollection_placemarksStyler(ptr));
  }
}

final _MapObjectCollection_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObjectCollection_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _MapObjectCollection_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObjectCollection_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapObjectCollection_addPlacemark = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObjectCollection_addPlacemark')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _MapObjectCollection_addPlacemarkWithCallback = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObjectCollection_addPlacemarkWithCallback')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)
    _MapObjectCollection_addEmptyPlacemark = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_map_MapObjectCollection_addEmptyPlacemark')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point
        .PointNative) _MapObjectCollection_addPlacemarkWithPoint = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)>>(
        'yandex_flutter_mapkit_map_MapObjectCollection_addPlacemarkWithPoint')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point.PointNative,
    ffi
        .Pointer<ffi.Void>) _MapObjectCollection_addPlacemarkWithImage = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObjectCollection_addPlacemarkWithImage')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point.PointNative,
    ffi.Pointer<ffi.Void>,
    mapkit_map_icon_style
        .IconStyleNative) _MapObjectCollection_addPlacemarkWithImageStyle = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative,
                    ffi.Pointer<ffi.Void>,
                    mapkit_map_icon_style.IconStyleNative)>>(
        'yandex_flutter_mapkit_map_MapObjectCollection_addPlacemarkWithImageStyle')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point.PointNative,
    ffi
        .Pointer<ffi.Void>) _MapObjectCollection_addPlacemarkWithView = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObjectCollection_addPlacemarkWithView')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    mapkit_geometry_point.PointNative,
    ffi.Pointer<ffi.Void>,
    mapkit_map_icon_style
        .IconStyleNative) _MapObjectCollection_addPlacemarkWithViewStyle = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>,
                    mapkit_geometry_point.PointNative,
                    ffi.Pointer<ffi.Void>,
                    mapkit_map_icon_style.IconStyleNative)>>(
        'yandex_flutter_mapkit_map_MapObjectCollection_addPlacemarkWithViewStyle')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>,
        mapkit_geometry_point.PointNative,
        ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative)
    _MapObjectCollection_addPlacemarkWithAnimatedImageStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>,
                        mapkit_geometry_point.PointNative,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_MapObjectCollection_addPlacemarkWithAnimatedImageStyle')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative)
    _MapObjectCollection_addPlacemarks = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_MapObjectCollection_addPlacemarks')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapObjectCollection_addEmptyPlacemarks = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObjectCollection_addEmptyPlacemarks')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _MapObjectCollection_addPolylineWithGeometry = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObjectCollection_addPolylineWithGeometry')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapObjectCollection_addPolyline = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObjectCollection_addPolyline')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapObjectCollection_addPolygon = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObjectCollection_addPolygon')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, mapkit_geometry_geometry.CircleNative)
    _MapObjectCollection_addCircle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                        mapkit_geometry_geometry.CircleNative)>>(
            'yandex_flutter_mapkit_map_MapObjectCollection_addCircle')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapObjectCollection_addCollection = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObjectCollection_addCollection')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<
        ffi.Void>) _MapObjectCollection_addClusterizedPlacemarkCollection = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObjectCollection_addClusterizedPlacemarkCollection')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapObjectCollection_placemarksStyler = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObjectCollection_placemarksStyler')
        .asFunction();
