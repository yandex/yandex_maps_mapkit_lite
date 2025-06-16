part of 'overlay.dart';

@bindings_annotations.WeakInterface('mapkit.ui.Overlay')
@bindings_annotations.ContainerData(
    toNative: 'OverlayImpl.getNativePtr',
    toPlatform:
        '(val) => OverlayImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Overlay')
class OverlayImpl implements Overlay, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Overlay_free.cast());

  /// @nodoc
  OverlayImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  OverlayImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory OverlayImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Overlay? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as OverlayImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _Overlay_check(ptr);
  }

  @internal

  /// @nodoc
  static Overlay? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return OverlayImpl.fromNativePtr(ptr);
  }

  void setImage(
      image_provider.ImageProvider image, mapkit_screen_types.ScreenRect rect) {
    _Overlay_setImage(ptr, to_native.toNativeImageProvider(image),
        mapkit_screen_types.ScreenRectImpl.toNative(rect));
    exception.checkCallResult();
  }

  void setView(
      view_provider.ViewProvider view, mapkit_screen_types.ScreenRect rect) {
    _Overlay_setView(ptr, to_native.toNativeViewProvider(view),
        mapkit_screen_types.ScreenRectImpl.toNative(rect));
    exception.checkCallResult();
  }

  void remove() {
    _Overlay_remove(ptr);
    exception.checkCallResult();
  }
}

final _Overlay_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_ui_Overlay_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Overlay_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_ui_Overlay_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
        mapkit_screen_types.ScreenRectNative) _Overlay_setImage =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_screen_types.ScreenRectNative)>>(
            'yandex_flutter_mapkit_ui_Overlay_setImage')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
        mapkit_screen_types.ScreenRectNative) _Overlay_setView =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        mapkit_screen_types.ScreenRectNative)>>(
            'yandex_flutter_mapkit_ui_Overlay_setView')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _Overlay_remove = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_ui_Overlay_remove')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _Overlay_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_ui_Overlay_set_')
    .asFunction(isLeaf: true);
