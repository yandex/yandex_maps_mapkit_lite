part of 'uri_object_metadata.dart';

final class UriNative extends ffi.Struct {
  external native_types.NativeString value;
}

final UriNative Function(native_types.NativeString) _UriNativeInit = lib.library
    .lookup<ffi.NativeFunction<UriNative Function(native_types.NativeString)>>(
        'yandex_flutter_mapkit_uri_Uri_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'UriImpl.toPointer',
    toPlatform: '(val) => UriImpl.fromPointer(val, needFree: false)',
    platformType: 'Uri')
extension UriImpl on Uri {
  static Uri fromNative(UriNative native) {
    return Uri(value: to_platform.toPlatformString(native.value));
  }

  static UriNative toNative(Uri obj) {
    return _UriNativeInit(to_native.toNativeString(obj.value));
  }

  static Uri? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = UriImpl.fromNative(ptr.cast<UriNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Uri? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<UriNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'UriObjectMetadataImpl.getNativePtr',
    toPlatform:
        '(val) => UriObjectMetadataImpl.fromPointer(val, needFree: false)',
    platformType: 'UriObjectMetadata')
final class UriObjectMetadataImpl extends UriObjectMetadata {
  UriObjectMetadataImpl(core.List<Uri> uris)
      : this.fromNativePtr(_UriObjectMetadata_init(
            UriContainerExtension.toNativeVector(uris)));

  @core.override
  late final uris =
      UriContainerExtension.toPlatformVector(_UriObjectMetadata_get_uris(_ptr));

  @core.override
  final _UriObjectMetadataFactory runtimeFactory =
      const _UriObjectMetadataFactory();

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_UriObjectMetadata_free.cast());

  UriObjectMetadataImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(UriObjectMetadata? obj) {
    return (obj as UriObjectMetadataImpl?)?._ptr ?? ffi.nullptr;
  }

  static UriObjectMetadata? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : UriObjectMetadataImpl.fromNativePtr(ptr);
  }

  static UriObjectMetadata? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = UriObjectMetadataImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

class _UriObjectMetadataFactory
    extends struct_factory.StructFactory<UriObjectMetadata> {
  const _UriObjectMetadataFactory();

  @core.override
  UriObjectMetadata create(ffi.Pointer<ffi.Void> ptr) {
    return UriObjectMetadataImpl.fromNativePtr(ptr);
  }

  @core.override
  UriObjectMetadata fromParent(ffi.Pointer<ffi.Void> ptr) {
    return UriObjectMetadataImpl.fromNativePtr(
        _UriObjectMetadata_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(UriObjectMetadata obj) {
    return _UriObjectMetadata_upcast(UriObjectMetadataImpl.getNativePtr(obj));
  }

  @core.override
  native_types.NativeString typeName() {
    return _UriObjectMetadata_name();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _UriObjectMetadata_downcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_uri_UriObjectMetadata_downcast')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _UriObjectMetadata_upcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_uri_UriObjectMetadata_upcast')
        .asFunction(isLeaf: true);

final native_types.NativeString Function() _UriObjectMetadata_name = lib.library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_uri_UriObjectMetadata_name')
    .asFunction(isLeaf: true);

final _UriObjectMetadata_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_uri_UriObjectMetadata_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _UriObjectMetadata_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_uri_UriObjectMetadata_init')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _UriObjectMetadata_get_uris = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_uri_UriObjectMetadata_get_uris')
        .asFunction(isLeaf: true);
