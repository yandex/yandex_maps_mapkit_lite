part of 'placemark.dart';

@bindings_annotations.WeakInterface('mapkit.map.PlacemarkMapObject')
@bindings_annotations.ContainerData(
    toNative: 'PlacemarkMapObjectImpl.getNativePtr',
    toPlatform:
        '(val) => PlacemarkMapObjectImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'PlacemarkMapObject')
class PlacemarkMapObjectImpl extends mapkit_map_map_object.MapObjectImpl
    implements PlacemarkMapObject, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_PlacemarkMapObject_free.cast());

  /// @nodoc
  PlacemarkMapObjectImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  PlacemarkMapObjectImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PlacemarkMapObjectImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PlacemarkMapObject? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as PlacemarkMapObjectImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _PlacemarkMapObject_check(ptr);
  }

  @internal

  /// @nodoc
  static PlacemarkMapObject? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PlacemarkMapObjectImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_geometry_point.Point get geometry {
    return mapkit_geometry_point.PointImpl.fromNative(
        _PlacemarkMapObject_get_geometry(ptr));
  }

  @core.override
  set geometry(mapkit_geometry_point.Point val) {
    _PlacemarkMapObject_set_geometry(
        ptr, mapkit_geometry_point.PointImpl.toNative(val));
  }

  @core.override
  core.double get direction {
    return _PlacemarkMapObject_get_direction(ptr);
  }

  @core.override
  set direction(core.double val) {
    _PlacemarkMapObject_set_direction(ptr, val);
  }

  @core.override
  core.double get opacity {
    return _PlacemarkMapObject_get_opacity(ptr);
  }

  @core.override
  set opacity(core.double val) {
    _PlacemarkMapObject_set_opacity(ptr, val);
  }

  void setIcon(image_provider.ImageProvider image) {
    _PlacemarkMapObject_setIcon(ptr, to_native.toNativeImageProvider(image));
  }

  void setIconWithStyle(image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style) {
    _PlacemarkMapObject_setIconWithStyle(
        ptr,
        to_native.toNativeImageProvider(image),
        mapkit_map_icon_style.IconStyleImpl.toNative(style));
  }

  void setIconWithCallback(image_provider.ImageProvider image,
      mapkit_map_callback.Callback onFinished) {
    _PlacemarkMapObject_setIconWithCallback(
        ptr,
        to_native.toNativeImageProvider(image),
        mapkit_map_callback.CallbackImpl.getNativePtr(onFinished));
  }

  void setIconWithStyleAndCallback(
      image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished) {
    _PlacemarkMapObject_setIconWithStyleAndCallback(
        ptr,
        to_native.toNativeImageProvider(image),
        mapkit_map_icon_style.IconStyleImpl.toNative(style),
        mapkit_map_callback.CallbackImpl.getNativePtr(onFinished));
  }

  void setIconStyle(mapkit_map_icon_style.IconStyle style) {
    _PlacemarkMapObject_setIconStyle(
        ptr, mapkit_map_icon_style.IconStyleImpl.toNative(style));
  }

  mapkit_map_composite_icon.CompositeIcon useCompositeIcon() {
    return mapkit_map_composite_icon.CompositeIconImpl.fromNativePtr(
        _PlacemarkMapObject_useCompositeIcon(ptr));
  }

  mapkit_map_placemark_animation.PlacemarkAnimation useAnimation() {
    return mapkit_map_placemark_animation.PlacemarkAnimationImpl.fromNativePtr(
        _PlacemarkMapObject_useAnimation(ptr));
  }

  void setView(view_provider.ViewProvider view) {
    _PlacemarkMapObject_setView(ptr, to_native.toNativeViewProvider(view));
  }

  void setViewWithStyle(
      view_provider.ViewProvider view, mapkit_map_icon_style.IconStyle style) {
    _PlacemarkMapObject_setViewWithStyle(
        ptr,
        to_native.toNativeViewProvider(view),
        mapkit_map_icon_style.IconStyleImpl.toNative(style));
  }

  void setViewWithCallback(view_provider.ViewProvider view,
      mapkit_map_callback.Callback onFinished) {
    _PlacemarkMapObject_setViewWithCallback(
        ptr,
        to_native.toNativeViewProvider(view),
        mapkit_map_callback.CallbackImpl.getNativePtr(onFinished));
  }

  void setViewWithStyleAndCallback(
      view_provider.ViewProvider view,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished) {
    _PlacemarkMapObject_setViewWithStyleAndCallback(
        ptr,
        to_native.toNativeViewProvider(view),
        mapkit_map_icon_style.IconStyleImpl.toNative(style),
        mapkit_map_callback.CallbackImpl.getNativePtr(onFinished));
  }

  void setScaleFunction(core.List<math.Point<core.double>> points) {
    _PlacemarkMapObject_setScaleFunction(
        ptr, to_native.toNativeVectorPoint(points));
  }

  void setText(core.String text) {
    _PlacemarkMapObject_setText(ptr, to_native.toNativeString(text));
  }

  void setTextWithStyle(
    mapkit_map_text_style.TextStyle style, {
    required core.String text,
  }) {
    _PlacemarkMapObject_setTextWithStyle(
      ptr,
      to_native.toNativeString(text),
      mapkit_map_text_style.TextStyleImpl.toNative(style),
    );
  }

  void setTextStyle(mapkit_map_text_style.TextStyle style) {
    _PlacemarkMapObject_setTextStyle(
        ptr, mapkit_map_text_style.TextStyleImpl.toNative(style));
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
final void Function(ffi.Pointer<ffi.Void>, core.int) _PlacemarkMapObject_set =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_PlacemarkMapObject_set_')
        .asFunction(isLeaf: true);
