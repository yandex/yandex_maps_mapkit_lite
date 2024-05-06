part of 'composite_icon.dart';

@bindings_annotations.WeakInterface('mapkit.map.CompositeIcon')
@bindings_annotations.ContainerData(
    toNative: 'CompositeIconImpl.getNativePtr',
    toPlatform:
        '(val) => CompositeIconImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'CompositeIcon')
class CompositeIconImpl implements CompositeIcon, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_CompositeIcon_free.cast());

  /// @nodoc
  CompositeIconImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  CompositeIconImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory CompositeIconImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(CompositeIcon? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as CompositeIconImpl).ptr;
  }

  core.bool isValid() {
    return _CompositeIcon_check(ptr);
  }

  @internal

  /// @nodoc
  static CompositeIcon? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return CompositeIconImpl.fromNativePtr(ptr);
  }

  void setIcon(
    image_provider.ImageProvider image,
    mapkit_map_icon_style.IconStyle style, {
    required core.String name,
  }) {
    _CompositeIcon_setIcon(
      ptr,
      to_native.toNativeString(name),
      to_native.toNativeImageProvider(image),
      mapkit_map_icon_style.IconStyleImpl.toNative(style),
    );
  }

  void setIconWithCallback(
    image_provider.ImageProvider image,
    mapkit_map_icon_style.IconStyle style,
    mapkit_map_callback.Callback onFinished, {
    required core.String name,
  }) {
    _CompositeIcon_setIconWithCallback(
      ptr,
      to_native.toNativeString(name),
      to_native.toNativeImageProvider(image),
      mapkit_map_icon_style.IconStyleImpl.toNative(style),
      mapkit_map_callback.CallbackImpl.getNativePtr(onFinished),
    );
  }

  void setIconStyle(
    mapkit_map_icon_style.IconStyle style, {
    required core.String name,
  }) {
    _CompositeIcon_setIconStyle(
      ptr,
      to_native.toNativeString(name),
      mapkit_map_icon_style.IconStyleImpl.toNative(style),
    );
  }

  void removeIcon(core.String name) {
    _CompositeIcon_removeIcon(ptr, to_native.toNativeString(name));
  }

  void removeAll() {
    _CompositeIcon_removeAll(ptr);
  }
}

final _CompositeIcon_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CompositeIcon_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _CompositeIcon_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CompositeIcon_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString,
        ffi.Pointer<ffi.Void>, mapkit_map_icon_style.IconStyleNative)
    _CompositeIcon_setIcon = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        native_types.NativeString,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_CompositeIcon_setIcon')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>,
        native_types.NativeString,
        ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative,
        ffi.Pointer<ffi.Void>) _CompositeIcon_setIconWithCallback =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        native_types.NativeString,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CompositeIcon_setIconWithCallback')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString,
        mapkit_map_icon_style.IconStyleNative) _CompositeIcon_setIconStyle =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        native_types.NativeString,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_CompositeIcon_setIconStyle')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _CompositeIcon_removeIcon = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_map_CompositeIcon_removeIcon')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _CompositeIcon_removeAll = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CompositeIcon_removeAll')
    .asFunction();
