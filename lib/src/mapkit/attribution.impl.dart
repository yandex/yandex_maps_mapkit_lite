part of 'attribution.dart';

@bindings_annotations.ContainerData(
    toNative: 'AttributionImpl.getNativePtr',
    toPlatform: '(val) => AttributionImpl.fromPointer(val, needFree: false)',
    platformType: 'Attribution')
final class AttributionImpl implements Attribution {
  AttributionImpl(AttributionAuthor? author, AttributionLink? link,
      mapkit_image.Image? avatarImage)
      : this.fromNativePtr(_Attribution_init(
            AttributionAuthorImpl.toPointer(author),
            AttributionLinkImpl.toPointer(link),
            mapkit_image.ImageImpl.getNativePtr(avatarImage)));

  @core.override
  late final author =
      AttributionAuthorImpl.fromPointer(_Attribution_get_author(_ptr));
  @core.override
  late final link =
      AttributionLinkImpl.fromPointer(_Attribution_get_link(_ptr));
  @core.override
  late final avatarImage = mapkit_image.ImageImpl.fromOptionalPtr(
      _Attribution_get_avatarImage(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_Attribution_free.cast());

  AttributionImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(Attribution? obj) {
    return (obj as AttributionImpl?)?._ptr ?? ffi.nullptr;
  }

  static Attribution? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : AttributionImpl.fromNativePtr(ptr);
  }

  static Attribution? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        AttributionImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

final _Attribution_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_Attribution_free');

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Attribution_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_Attribution_init')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _Attribution_get_author = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_Attribution_get_author')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _Attribution_get_link = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_Attribution_get_link')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _Attribution_get_avatarImage = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_Attribution_get_avatarImage')
        .asFunction(isLeaf: true);

final class AttributionAuthorNative extends ffi.Struct {
  external native_types.NativeString name;
  external ffi.Pointer<ffi.Void> uri;
  external ffi.Pointer<ffi.Void> email;
}

final AttributionAuthorNative Function(
        native_types.NativeString, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _AttributionAuthorNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    AttributionAuthorNative Function(native_types.NativeString,
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_Attribution_AttributionAuthor_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'AttributionAuthorImpl.toPointer',
    toPlatform:
        '(val) => AttributionAuthorImpl.fromPointer(val, needFree: false)',
    platformType: 'AttributionAuthor')
extension AttributionAuthorImpl on AttributionAuthor {
  static AttributionAuthor fromNative(AttributionAuthorNative native) {
    return AttributionAuthor(
        name: to_platform.toPlatformString(native.name),
        uri: to_platform.toPlatformFromPointerString(native.uri),
        email: to_platform.toPlatformFromPointerString(native.email));
  }

  static AttributionAuthorNative toNative(AttributionAuthor obj) {
    return _AttributionAuthorNativeInit(
        to_native.toNativeString(obj.name),
        to_native.toNativePtrString(obj.uri),
        to_native.toNativePtrString(obj.email));
  }

  static AttributionAuthor? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = AttributionAuthorImpl.fromNative(
        ptr.cast<AttributionAuthorNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(AttributionAuthor? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<AttributionAuthorNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

final class AttributionLinkNative extends ffi.Struct {
  external native_types.NativeString href;
}

final AttributionLinkNative Function(native_types.NativeString)
    _AttributionLinkNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    AttributionLinkNative Function(native_types.NativeString)>>(
            'yandex_flutter_mapkit_Attribution_AttributionLink_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'AttributionLinkImpl.toPointer',
    toPlatform:
        '(val) => AttributionLinkImpl.fromPointer(val, needFree: false)',
    platformType: 'AttributionLink')
extension AttributionLinkImpl on AttributionLink {
  static AttributionLink fromNative(AttributionLinkNative native) {
    return AttributionLink(href: to_platform.toPlatformString(native.href));
  }

  static AttributionLinkNative toNative(AttributionLink obj) {
    return _AttributionLinkNativeInit(to_native.toNativeString(obj.href));
  }

  static AttributionLink? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        AttributionLinkImpl.fromNative(ptr.cast<AttributionLinkNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(AttributionLink? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<AttributionLinkNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
