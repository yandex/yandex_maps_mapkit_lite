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

part 'image.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'Image.toPointer',
    toPlatform: '(val) => Image.fromPointer(val, needFree: false)')
class Image implements ffi.Finalizable {
  late final urlTemplate =
      to_platform.toPlatformString(_Image_get_urlTemplate(_ptr));
  late final sizes =
      ImageImageSizeContainerExtension.toPlatformVector(_Image_get_sizes(_ptr));
  late final tags = to_platform.toVectorString(_Image_get_tags(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_Image_free.cast());

  Image(core.String urlTemplate, core.List<ImageImageSize> sizes,
      core.List<core.String> tags)
      : this.fromNativePtr(_Image_init(
            to_native.toNativeString(urlTemplate),
            ImageImageSizeContainerExtension.toNativeVector(sizes),
            to_native.toNativeVectorString(tags)));

  /// @nodoc
  @internal
  Image.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(Image? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static Image? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return Image.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static Image? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Image.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Image? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _Image_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _Image_clone = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Pointer<ffi.Void> Function(
                ffi.Pointer<ffi.Void>)>>('yandex_flutter_mapkit_Image_clone')
    .asFunction(isLeaf: true);

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

/// @nodoc
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
    toNative: 'ImageImageSize.toPointer',
    toPlatform: '(val) => ImageImageSize.fromPointer(val, needFree: false)')
class ImageImageSize {
  final core.String size;
  final core.int? width;
  final core.int? height;

  const ImageImageSize({
    required this.size,
    this.width,
    this.height,
  });

  /// @nodoc
  @internal
  ImageImageSize.fromNative(ImageImageSizeNative native)
      : this(
            size: to_platform.toPlatformString(native.size),
            width: to_platform.toPlatformFromPointerUint32(native.width),
            height: to_platform.toPlatformFromPointerUint32(native.height));

  /// @nodoc
  @internal
  static ImageImageSizeNative toNative(ImageImageSize c) {
    return _ImageImageSizeNativeInit(
        to_native.toNativeString(c.size),
        to_native.toNativePtrUint32(c.width),
        to_native.toNativePtrUint32(c.height));
  }

  /// @nodoc
  @internal
  static ImageImageSize? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        ImageImageSize.fromNative(ptr.cast<ImageImageSizeNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(ImageImageSize? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ImageImageSizeNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
