part of 'placemark_view.dart';

@bindings_annotations.WeakInterface('mapkit.map.PlacemarkView')
@bindings_annotations.ContainerData(
    toNative: 'PlacemarkViewImpl.getNativePtr',
    toPlatform:
        '(val) => PlacemarkViewImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'PlacemarkView')
class PlacemarkViewImpl extends mapkit_map_placemark_presentation
    .PlacemarkPresentationImpl implements PlacemarkView, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_PlacemarkView_free.cast());

  /// @nodoc
  PlacemarkViewImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  PlacemarkViewImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PlacemarkViewImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PlacemarkView? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as PlacemarkViewImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _PlacemarkView_check(ptr);
  }

  @internal

  /// @nodoc
  static PlacemarkView? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PlacemarkViewImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_map_icon_style.IconStyle get style {
    final result = _PlacemarkView_get_style(ptr);
    exception.checkCallResult();
    return mapkit_map_icon_style.IconStyleImpl.fromNative(result);
  }

  @core.override
  set style(mapkit_map_icon_style.IconStyle val) {
    _PlacemarkView_set_style(
        ptr, mapkit_map_icon_style.IconStyleImpl.toNative(val));
    exception.checkCallResult();
  }

  void setView(
      view_provider.ViewProvider image, mapkit_map_icon_style.IconStyle style) {
    _PlacemarkView_setView(ptr, to_native.toNativeViewProvider(image),
        mapkit_map_icon_style.IconStyleImpl.toNative(style));
    exception.checkCallResult();
  }

  void setViewWithCallback(
      view_provider.ViewProvider image,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished) {
    _PlacemarkView_setViewWithCallback(
        ptr,
        to_native.toNativeViewProvider(image),
        mapkit_map_icon_style.IconStyleImpl.toNative(style),
        mapkit_map_callback.CallbackImpl.getNativePtr(onFinished));
    exception.checkCallResult();
  }
}

final _PlacemarkView_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkView_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _PlacemarkView_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkView_check')
    .asFunction(isLeaf: true);

final mapkit_map_icon_style.IconStyleNative Function(ffi.Pointer<ffi.Void>)
    _PlacemarkView_get_style = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_icon_style.IconStyleNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkView_get_style')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_map_icon_style.IconStyleNative)
    _PlacemarkView_set_style = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_PlacemarkView_set_style')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative) _PlacemarkView_setView =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_PlacemarkView_setView')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative, ffi.Pointer<ffi.Void>)
    _PlacemarkView_setViewWithCallback = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkView_setViewWithCallback')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _PlacemarkView_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_PlacemarkView_set_')
    .asFunction(isLeaf: true);
