part of 'clusterized_placemark_collection.dart';

@bindings_annotations.WeakInterface('mapkit.map.ClusterizedPlacemarkCollection')
@bindings_annotations.ContainerData(
    toNative: 'ClusterizedPlacemarkCollectionImpl.getNativePtr',
    toPlatform:
        '(val) => ClusterizedPlacemarkCollectionImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'ClusterizedPlacemarkCollection')
class ClusterizedPlacemarkCollectionImpl
    extends mapkit_map_base_map_object_collection.BaseMapObjectCollectionImpl
    implements ClusterizedPlacemarkCollection, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_ClusterizedPlacemarkCollection_free.cast());

  /// @nodoc
  ClusterizedPlacemarkCollectionImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  ClusterizedPlacemarkCollectionImpl.fromNativePtrImpl(
      ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory ClusterizedPlacemarkCollectionImpl.fromNativePtr(
          ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(
      ClusterizedPlacemarkCollection? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as ClusterizedPlacemarkCollectionImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _ClusterizedPlacemarkCollection_check(ptr);
  }

  @internal

  /// @nodoc
  static ClusterizedPlacemarkCollection? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return ClusterizedPlacemarkCollectionImpl.fromNativePtr(ptr);
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemark() {
    final result = mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemark(ptr));
    exception.checkCallResult();
    return result;
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithCallback(
      mapkit_map_base_map_object_collection.PlacemarkCreatedCallback
          placemarkCreatedCallback) {
    final result = mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithCallback(
            ptr,
            mapkit_map_base_map_object_collection.PlacemarkCreatedCallbackImpl
                .getNativePtr(placemarkCreatedCallback)));
    exception.checkCallResult();
    return result;
  }

  mapkit_map_placemark.PlacemarkMapObject addEmptyPlacemark(
      mapkit_geometry_point.Point point) {
    final result = mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _ClusterizedPlacemarkCollection_addEmptyPlacemark(
            ptr, mapkit_geometry_point.PointImpl.toNative(point)));
    exception.checkCallResult();
    return result;
  }

  core.List<mapkit_map_placemark.PlacemarkMapObject> addEmptyPlacemarks(
      core.List<mapkit_geometry_point.Point> points) {
    final result = mapkit_map_placemark.PlacemarkMapObjectContainerExtension
        .toPlatformVector(_ClusterizedPlacemarkCollection_addEmptyPlacemarks(
            ptr,
            mapkit_geometry_point.PointContainerExtension.toNativeVector(
                points)));
    exception.checkCallResult();
    return result;
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithPoint(
      mapkit_geometry_point.Point point) {
    final result = mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithPoint(
            ptr, mapkit_geometry_point.PointImpl.toNative(point)));
    exception.checkCallResult();
    return result;
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithImage(
      mapkit_geometry_point.Point point, image_provider.ImageProvider image) {
    final result = mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithImage(
            ptr,
            mapkit_geometry_point.PointImpl.toNative(point),
            to_native.toNativeImageProvider(image)));
    exception.checkCallResult();
    return result;
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithStyle(
      mapkit_geometry_point.Point point,
      image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style) {
    final result = mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithStyle(
            ptr,
            mapkit_geometry_point.PointImpl.toNative(point),
            to_native.toNativeImageProvider(image),
            mapkit_map_icon_style.IconStyleImpl.toNative(style)));
    exception.checkCallResult();
    return result;
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithView(
      mapkit_geometry_point.Point point, view_provider.ViewProvider view) {
    final result = mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithView(
            ptr,
            mapkit_geometry_point.PointImpl.toNative(point),
            to_native.toNativeViewProvider(view)));
    exception.checkCallResult();
    return result;
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithViewStyle(
      mapkit_geometry_point.Point point,
      view_provider.ViewProvider view,
      mapkit_map_icon_style.IconStyle style) {
    final result = mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithViewStyle(
            ptr,
            mapkit_geometry_point.PointImpl.toNative(point),
            to_native.toNativeViewProvider(view),
            mapkit_map_icon_style.IconStyleImpl.toNative(style)));
    exception.checkCallResult();
    return result;
  }

  mapkit_map_placemark.PlacemarkMapObject addPlacemarkWithAnimatedImageStyle(
      mapkit_geometry_point.Point point,
      animated_image_provider.AnimatedImageProvider animatedImage,
      mapkit_map_icon_style.IconStyle style) {
    final result = mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _ClusterizedPlacemarkCollection_addPlacemarkWithAnimatedImageStyle(
            ptr,
            mapkit_geometry_point.PointImpl.toNative(point),
            to_native.toNativeAnimatedImageProvider(animatedImage),
            mapkit_map_icon_style.IconStyleImpl.toNative(style)));
    exception.checkCallResult();
    return result;
  }

  core.List<mapkit_map_placemark.PlacemarkMapObject> addPlacemarkWithImageStyle(
    image_provider.ImageProvider image,
    mapkit_map_icon_style.IconStyle style, {
    required core.List<mapkit_geometry_point.Point> points,
  }) {
    final result = mapkit_map_placemark.PlacemarkMapObjectContainerExtension
        .toPlatformVector(
            _ClusterizedPlacemarkCollection_addPlacemarkWithImageStyle(
      ptr,
      mapkit_geometry_point.PointContainerExtension.toNativeVector(points),
      to_native.toNativeImageProvider(image),
      mapkit_map_icon_style.IconStyleImpl.toNative(style),
    ));
    exception.checkCallResult();
    return result;
  }

  void clusterPlacemarks({
    required core.double clusterRadius,
    required core.int minZoom,
  }) {
    _ClusterizedPlacemarkCollection_clusterPlacemarks(
        ptr, clusterRadius, minZoom);
    exception.checkCallResult();
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
final void Function(ffi.Pointer<ffi.Void>, core.int)
    _ClusterizedPlacemarkCollection_set = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_ClusterizedPlacemarkCollection_set_')
        .asFunction(isLeaf: true);
