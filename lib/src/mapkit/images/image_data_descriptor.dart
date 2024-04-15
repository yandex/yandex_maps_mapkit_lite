import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:ui' as ui;
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

part 'image_data_descriptor.containers.dart';

/// @nodoc
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
    toNative: 'ImagesImageDataDescriptor.toPointer',
    toPlatform:
        '(val) => ImagesImageDataDescriptor.fromPointer(val, needFree: false)')
class ImagesImageDataDescriptor {
  final core.String imageId;
  final ui.Color? primaryColor;
  final ui.Color? secondaryColor;
  final ui.Color? tertiaryColor;

  const ImagesImageDataDescriptor({
    required this.imageId,
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
  });

  /// @nodoc
  @internal
  ImagesImageDataDescriptor.fromNative(ImagesImageDataDescriptorNative native)
      : this(
            imageId: to_platform.toPlatformString(native.imageId),
            primaryColor:
                to_platform.toPlatformFromPointerColor(native.primaryColor),
            secondaryColor:
                to_platform.toPlatformFromPointerColor(native.secondaryColor),
            tertiaryColor:
                to_platform.toPlatformFromPointerColor(native.tertiaryColor));

  /// @nodoc
  @internal
  static ImagesImageDataDescriptorNative toNative(ImagesImageDataDescriptor c) {
    return _ImagesImageDataDescriptorNativeInit(
        to_native.toNativeString(c.imageId),
        to_native.toNativePtrColor(c.primaryColor),
        to_native.toNativePtrColor(c.secondaryColor),
        to_native.toNativePtrColor(c.tertiaryColor));
  }

  /// @nodoc
  @internal
  static ImagesImageDataDescriptor? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = ImagesImageDataDescriptor.fromNative(
        ptr.cast<ImagesImageDataDescriptorNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(ImagesImageDataDescriptor? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ImagesImageDataDescriptorNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
