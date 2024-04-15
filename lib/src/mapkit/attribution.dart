import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'attribution.containers.dart';

/// @nodoc
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
    toNative: 'Attribution.toPointer',
    toPlatform: '(val) => Attribution.fromPointer(val, needFree: false)')
class Attribution {
  final AttributionAuthor? author;
  final AttributionLink? link;

  const Attribution({
    this.author,
    this.link,
  });

  /// @nodoc
  @internal
  Attribution.fromNative(AttributionNative native)
      : this(
            author: AttributionAuthor.fromPointer(native.author),
            link: AttributionLink.fromPointer(native.link));

  /// @nodoc
  @internal
  static AttributionNative toNative(Attribution c) {
    return _AttributionNativeInit(AttributionAuthor.toPointer(c.author),
        AttributionLink.toPointer(c.link));
  }

  /// @nodoc
  @internal
  static Attribution? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Attribution.fromNative(ptr.cast<AttributionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Attribution? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<AttributionNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

/// @nodoc
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
    toNative: 'AttributionAuthor.toPointer',
    toPlatform: '(val) => AttributionAuthor.fromPointer(val, needFree: false)')
class AttributionAuthor {
  final core.String name;
  final core.String? uri;
  final core.String? email;

  const AttributionAuthor({
    required this.name,
    this.uri,
    this.email,
  });

  /// @nodoc
  @internal
  AttributionAuthor.fromNative(AttributionAuthorNative native)
      : this(
            name: to_platform.toPlatformString(native.name),
            uri: to_platform.toPlatformFromPointerString(native.uri),
            email: to_platform.toPlatformFromPointerString(native.email));

  /// @nodoc
  @internal
  static AttributionAuthorNative toNative(AttributionAuthor c) {
    return _AttributionAuthorNativeInit(
        to_native.toNativeString(c.name),
        to_native.toNativePtrString(c.uri),
        to_native.toNativePtrString(c.email));
  }

  /// @nodoc
  @internal
  static AttributionAuthor? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        AttributionAuthor.fromNative(ptr.cast<AttributionAuthorNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(AttributionAuthor? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<AttributionAuthorNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

/// @nodoc
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
    toNative: 'AttributionLink.toPointer',
    toPlatform: '(val) => AttributionLink.fromPointer(val, needFree: false)')
class AttributionLink {
  final core.String href;

  const AttributionLink({
    required this.href,
  });

  /// @nodoc
  @internal
  AttributionLink.fromNative(AttributionLinkNative native)
      : this(href: to_platform.toPlatformString(native.href));

  /// @nodoc
  @internal
  static AttributionLinkNative toNative(AttributionLink c) {
    return _AttributionLinkNativeInit(to_native.toNativeString(c.href));
  }

  /// @nodoc
  @internal
  static AttributionLink? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        AttributionLink.fromNative(ptr.cast<AttributionLinkNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(AttributionLink? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<AttributionLinkNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
