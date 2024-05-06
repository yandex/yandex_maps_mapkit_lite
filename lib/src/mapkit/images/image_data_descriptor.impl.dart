part of 'image_data_descriptor.dart';

final class ImagesImageDataDescriptorNative extends ffi.Struct {
  external native_types.NativeString imageId;
  external ffi.Pointer<ffi.Void> primaryColor;
  external ffi.Pointer<ffi.Void> secondaryColor;
  external ffi.Pointer<ffi.Void> tertiaryColor;
}

final ImagesImageDataDescriptorNative Function(native_types.NativeString,
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _ImagesImageDataDescriptorNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    ImagesImageDataDescriptorNative Function(
                        native_types.NativeString,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_images_ImagesImageDataDescriptor_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ImagesImageDataDescriptorImpl.toPointer',
    toPlatform:
        '(val) => ImagesImageDataDescriptorImpl.fromPointer(val, needFree: false)',
    platformType: 'ImagesImageDataDescriptor')
extension ImagesImageDataDescriptorImpl on ImagesImageDataDescriptor {
  static ImagesImageDataDescriptor fromNative(
      ImagesImageDataDescriptorNative native) {
    return ImagesImageDataDescriptor(
        imageId: to_platform.toPlatformString(native.imageId),
        primaryColor:
            to_platform.toPlatformFromPointerColor(native.primaryColor),
        secondaryColor:
            to_platform.toPlatformFromPointerColor(native.secondaryColor),
        tertiaryColor:
            to_platform.toPlatformFromPointerColor(native.tertiaryColor));
  }

  static ImagesImageDataDescriptorNative toNative(
      ImagesImageDataDescriptor obj) {
    return _ImagesImageDataDescriptorNativeInit(
        to_native.toNativeString(obj.imageId),
        to_native.toNativePtrColor(obj.primaryColor),
        to_native.toNativePtrColor(obj.secondaryColor),
        to_native.toNativePtrColor(obj.tertiaryColor));
  }

  static ImagesImageDataDescriptor? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = ImagesImageDataDescriptorImpl.fromNative(
        ptr.cast<ImagesImageDataDescriptorNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(ImagesImageDataDescriptor? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ImagesImageDataDescriptorNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
