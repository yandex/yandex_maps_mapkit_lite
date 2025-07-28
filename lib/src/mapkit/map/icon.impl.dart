part of 'icon.dart';

@bindings_annotations.WeakInterface('mapkit.map.Icon')
@bindings_annotations.ContainerData(
    toNative: 'IconImpl.getNativePtr',
    toPlatform:
        '(val) => IconImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Icon')
class IconImpl extends mapkit_map_placemark_presentation
    .PlacemarkPresentationImpl implements Icon, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_Icon_free.cast());

  /// @nodoc
  IconImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  IconImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory IconImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Icon? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as IconImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _Icon_check(ptr);
  }

  @internal

  /// @nodoc
  static Icon? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return IconImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_map_icon_style.IconStyle get style {
    final result = _Icon_get_style(ptr);
    exception.checkCallResult();
    return mapkit_map_icon_style.IconStyleImpl.fromNative(result);
  }

  @core.override
  set style(mapkit_map_icon_style.IconStyle val) {
    _Icon_set_style(ptr, mapkit_map_icon_style.IconStyleImpl.toNative(val));
    exception.checkCallResult();
  }

  void setImage(image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style) {
    _Icon_setImage(ptr, to_native.toNativeImageProvider(image),
        mapkit_map_icon_style.IconStyleImpl.toNative(style));
    exception.checkCallResult();
  }

  void setImageWithCallback(
      image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished) {
    _Icon_setImageWithCallback(
        ptr,
        to_native.toNativeImageProvider(image),
        mapkit_map_icon_style.IconStyleImpl.toNative(style),
        mapkit_map_callback.CallbackImpl.getNativePtr(onFinished));
    exception.checkCallResult();
  }
}

final _Icon_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Icon_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Icon_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Icon_check')
    .asFunction(isLeaf: true);

final mapkit_map_icon_style.IconStyleNative Function(ffi.Pointer<ffi.Void>)
    _Icon_get_style = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_icon_style.IconStyleNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Icon_get_style')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_map_icon_style.IconStyleNative)
    _Icon_set_style = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_Icon_set_style')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative) _Icon_setImage =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_Icon_setImage')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative, ffi.Pointer<ffi.Void>)
    _Icon_setImageWithCallback = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Icon_setImageWithCallback')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _Icon_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_Icon_set_')
    .asFunction(isLeaf: true);
