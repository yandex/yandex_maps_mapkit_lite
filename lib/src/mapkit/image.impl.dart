part of 'image.dart';

@bindings_annotations.ContainerData(
    toNative: 'ImageImpl.getNativePtr',
    toPlatform: '(val) => ImageImpl.fromPointer(val, needFree: false)',
    platformType: 'Image')
final class ImageImpl implements Image {
  ImageImpl(core.String urlTemplate, core.List<ImageImageSize> sizes,
      core.List<core.String> tags)
      : this.fromNativePtr(_Image_init(
            to_native.toNativeString(urlTemplate),
            ImageImageSizeContainerExtension.toNativeVector(sizes),
            to_native.toNativeVectorString(tags)));

  @core.override
  late final urlTemplate =
      to_platform.toPlatformString(_Image_get_urlTemplate(_ptr));
  @core.override
  late final sizes =
      ImageImageSizeContainerExtension.toPlatformVector(_Image_get_sizes(_ptr));
  @core.override
  late final tags = to_platform.toVectorString(_Image_get_tags(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_Image_free.cast());

  ImageImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(Image? obj) {
    return (obj as ImageImpl?)?._ptr ?? ffi.nullptr;
  }

  static Image? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : ImageImpl.fromNativePtr(ptr);
  }

  static Image? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        ImageImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

final _Image_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_Image_free');

final ffi.Pointer<ffi.Void> Function(
        native_types.NativeString, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Image_init = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    native_types.NativeString,
                    ffi.Pointer<ffi.Void>,
                    ffi.Pointer<ffi.Void>)>>('yandex_flutter_mapkit_Image_init')
        .asFunction(isLeaf: true);

final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _Image_get_urlTemplate = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_Image_get_urlTemplate')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _Image_get_sizes =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_Image_get_sizes')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _Image_get_tags =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_Image_get_tags')
        .asFunction(isLeaf: true);

final class ImageImageSizeNative extends ffi.Struct {
  external native_types.NativeString size;
  external ffi.Pointer<ffi.Void> width;
  external ffi.Pointer<ffi.Void> height;
}

final ImageImageSizeNative Function(
        native_types.NativeString, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _ImageImageSizeNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    ImageImageSizeNative Function(native_types.NativeString,
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_Image_ImageImageSize_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ImageImageSizeImpl.toPointer',
    toPlatform: '(val) => ImageImageSizeImpl.fromPointer(val, needFree: false)',
    platformType: 'ImageImageSize')
extension ImageImageSizeImpl on ImageImageSize {
  static ImageImageSize fromNative(ImageImageSizeNative native) {
    return ImageImageSize(
        size: to_platform.toPlatformString(native.size),
        width: to_platform.toPlatformFromPointerUint32(native.width),
        height: to_platform.toPlatformFromPointerUint32(native.height));
  }

  static ImageImageSizeNative toNative(ImageImageSize obj) {
    return _ImageImageSizeNativeInit(
        to_native.toNativeString(obj.size),
        to_native.toNativePtrUint32(obj.width),
        to_native.toNativePtrUint32(obj.height));
  }

  static ImageImageSize? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        ImageImageSizeImpl.fromNative(ptr.cast<ImageImageSizeNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(ImageImageSize? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ImageImageSizeNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
