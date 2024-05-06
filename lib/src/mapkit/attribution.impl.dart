part of 'attribution.dart';

final class AttributionNative extends ffi.Struct {
  external ffi.Pointer<ffi.Void> author;
  external ffi.Pointer<ffi.Void> link;
}

final AttributionNative Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _AttributionNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    AttributionNative Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_Attribution_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'AttributionImpl.toPointer',
    toPlatform: '(val) => AttributionImpl.fromPointer(val, needFree: false)',
    platformType: 'Attribution')
extension AttributionImpl on Attribution {
  static Attribution fromNative(AttributionNative native) {
    return Attribution(
        author: AttributionAuthorImpl.fromPointer(native.author),
        link: AttributionLinkImpl.fromPointer(native.link));
  }

  static AttributionNative toNative(Attribution obj) {
    return _AttributionNativeInit(AttributionAuthorImpl.toPointer(obj.author),
        AttributionLinkImpl.toPointer(obj.link));
  }

  static Attribution? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        AttributionImpl.fromNative(ptr.cast<AttributionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(Attribution? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<AttributionNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

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
