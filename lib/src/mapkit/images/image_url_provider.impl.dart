part of 'image_url_provider.dart';

final class _ImagesImageUrlProviderWrapper implements ffi.Finalizable {
  _ImagesImageUrlProviderWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_ImagesImageUrlProvider_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension ImagesImageUrlProviderImpl on ImagesImageUrlProvider {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<ImagesImageUrlProvider>>{};
  static final _listenerToPointer = weak_map.WeakMap<ImagesImageUrlProvider,
      _ImagesImageUrlProviderWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(ImagesImageUrlProvider obj) {
    final ptr = _ImagesImageUrlProvider_new(ffi.Pointer.fromFunction<
            native_types.NativeString Function(
                ffi.Pointer<ffi.Void>,
                mapkit_images_image_data_descriptor
                    .ImagesImageDataDescriptorNative)>(
        _ImagesImageUrlProvider_formatUrl));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _ImagesImageUrlProviderWrapper(ptr);
    _ImagesImageUrlProvidersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(ImagesImageUrlProvider? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _ImagesImageUrlProvidersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_images_ImagesImageUrlProvider_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                native_types.NativeString Function(
                    ffi.Pointer<ffi.Void>,
                    mapkit_images_image_data_descriptor
                        .ImagesImageDataDescriptorNative)>>)
    _ImagesImageUrlProvider_new = lib.library
        .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.NativeFunction<native_types.NativeString Function(ffi.Pointer<ffi.Void>, mapkit_images_image_data_descriptor.ImagesImageDataDescriptorNative)>>)>>(
            'yandex_flutter_mapkit_images_ImagesImageUrlProvider_new')
        .asFunction(isLeaf: true);

final _ImagesImageUrlProvider_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_images_ImagesImageUrlProvider_free');
native_types.NativeString _ImagesImageUrlProvider_formatUrl(
    ffi.Pointer<ffi.Void> _ptr,
    mapkit_images_image_data_descriptor.ImagesImageDataDescriptorNative
        descriptor) {
  final listener = ImagesImageUrlProviderImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return to_native.toNativeString(listener.formatUrl(
        mapkit_images_image_data_descriptor.ImagesImageDataDescriptorImpl
            .fromNative(descriptor)));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
