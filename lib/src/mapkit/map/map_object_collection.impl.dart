part of 'map_object_collection.dart';

@bindings_annotations.WeakInterface('mapkit.map.MapObjectCollection')
@bindings_annotations.ContainerData(
    toNative: 'MapObjectCollectionImpl.getNativePtr',
    toPlatform:
        '(val) => MapObjectCollectionImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'MapObjectCollection')
class MapObjectCollectionImpl
    extends mapkit_map_base_map_object_collection.BaseMapObjectCollectionImpl
    implements MapObjectCollection, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_MapObjectCollection_free.cast());

  /// @nodoc
  MapObjectCollectionImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  MapObjectCollectionImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory MapObjectCollectionImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(MapObjectCollection? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as MapObjectCollectionImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _MapObjectCollection_check(ptr);
  }

  @internal

  /// @nodoc
  static MapObjectCollection? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return MapObjectCollectionImpl.fromNativePtr(ptr);
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemark() {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addPlacemark(ptr));
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithCallback(
      mapkit_map_base_map_object_collection.PlacemarkCreatedCallback
          placemarkCreatedCallback) {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addPlacemarkWithCallback(
            ptr,
            mapkit_map_base_map_object_collection.PlacemarkCreatedCallbackImpl
                .getNativePtr(placemarkCreatedCallback)));
  }

  mapkit_map_placemark.PlacemarkMapObject addEmptyPlacemark(
      mapkit_geometry_point.Point point) {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addEmptyPlacemark(
            ptr, mapkit_geometry_point.PointImpl.toNative(point)));
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithPoint(
      mapkit_geometry_point.Point point) {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addPlacemarkWithPoint(
            ptr, mapkit_geometry_point.PointImpl.toNative(point)));
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithImage(
      mapkit_geometry_point.Point point, image_provider.ImageProvider image) {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addPlacemarkWithImage(
            ptr,
            mapkit_geometry_point.PointImpl.toNative(point),
            to_native.toNativeImageProvider(image)));
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithImageStyle(
      mapkit_geometry_point.Point point,
      image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style) {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addPlacemarkWithImageStyle(
            ptr,
            mapkit_geometry_point.PointImpl.toNative(point),
            to_native.toNativeImageProvider(image),
            mapkit_map_icon_style.IconStyleImpl.toNative(style)));
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithView(
      mapkit_geometry_point.Point point, view_provider.ViewProvider view) {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addPlacemarkWithView(
            ptr,
            mapkit_geometry_point.PointImpl.toNative(point),
            to_native.toNativeViewProvider(view)));
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithViewStyle(
      mapkit_geometry_point.Point point,
      view_provider.ViewProvider view,
      mapkit_map_icon_style.IconStyle style) {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addPlacemarkWithViewStyle(
            ptr,
            mapkit_geometry_point.PointImpl.toNative(point),
            to_native.toNativeViewProvider(view),
            mapkit_map_icon_style.IconStyleImpl.toNative(style)));
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithAnimatedImageStyle(
      mapkit_geometry_point.Point point,
      animated_image_provider.AnimatedImageProvider animatedImage,
      mapkit_map_icon_style.IconStyle style) {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addPlacemarkWithAnimatedImageStyle(
            ptr,
            mapkit_geometry_point.PointImpl.toNative(point),
            to_native.toNativeAnimatedImageProvider(animatedImage),
            mapkit_map_icon_style.IconStyleImpl.toNative(style)));
  }

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
      mapkit_map_icon_style.IconStyleImpl.toNative(style),
    ));
  }

  core.List<mapkit_map_placemark.PlacemarkMapObject> addEmptyPlacemarks(
      core.List<mapkit_geometry_point.Point> points) {
    return mapkit_map_placemark.PlacemarkMapObjectContainerExtension
        .toPlatformVector(_MapObjectCollection_addEmptyPlacemarks(
            ptr,
            mapkit_geometry_point.PointContainerExtension.toNativeVector(
                points)));
  }

  mapkit_map_polyline.PolylineMapObject addPolylineWithGeometry(
      mapkit_geometry_geometry.Polyline polyline) {
    return mapkit_map_polyline.PolylineMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addPolylineWithGeometry(
            ptr, mapkit_geometry_geometry.PolylineImpl.getNativePtr(polyline)));
  }

  mapkit_map_polyline.PolylineMapObject addPolyline() {
    return mapkit_map_polyline.PolylineMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addPolyline(ptr));
  }

  mapkit_map_polygon.PolygonMapObject addPolygon(
      mapkit_geometry_geometry.Polygon polygon) {
    return mapkit_map_polygon.PolygonMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addPolygon(
            ptr, mapkit_geometry_geometry.PolygonImpl.getNativePtr(polygon)));
  }

  mapkit_map_circle.CircleMapObject addCircle(
      mapkit_geometry_geometry.Circle circle) {
    return mapkit_map_circle.CircleMapObjectImpl.fromNativePtr(
        _MapObjectCollection_addCircle(
            ptr, mapkit_geometry_geometry.CircleImpl.toNative(circle)));
  }

  MapObjectCollection addCollection() {
    return MapObjectCollectionImpl.fromNativePtr(
        _MapObjectCollection_addCollection(ptr));
  }

  mapkit_map_clusterized_placemark_collection.ClusterizedPlacemarkCollection
      addClusterizedPlacemarkCollection(
          mapkit_map_cluster_listener.ClusterListener clusterListener) {
    return mapkit_map_clusterized_placemark_collection
            .ClusterizedPlacemarkCollectionImpl
        .fromNativePtr(_MapObjectCollection_addClusterizedPlacemarkCollection(
            ptr,
            mapkit_map_cluster_listener.ClusterListenerImpl.getNativePtr(
                clusterListener)));
  }

  mapkit_map_placemarks_styler.PlacemarksStyler placemarksStyler() {
    return mapkit_map_placemarks_styler.PlacemarksStylerImpl.fromNativePtr(
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
final void Function(ffi.Pointer<ffi.Void>, core.int) _MapObjectCollection_set =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapObjectCollection_set_')
        .asFunction(isLeaf: true);
