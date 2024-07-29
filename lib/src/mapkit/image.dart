import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
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
part 'image.impl.dart';

abstract final class Image implements ffi.Finalizable {
  factory Image(core.String urlTemplate, core.List<ImageImageSize> sizes,
          core.List<core.String> tags) =>
      ImageImpl(urlTemplate, sizes, tags);

  /// urlTemplate for the image.
  core.String get urlTemplate;

  /// Image sizes.
  core.List<ImageImageSize> get sizes;

  /// Image tags.
  core.List<core.String> get tags;

  @core.override
  core.int get hashCode => core.Object.hashAll([urlTemplate, sizes, tags]);

  @core.override
  core.bool operator ==(covariant Image other) {
    if (core.identical(this, other)) {
      return true;
    }
    return urlTemplate == other.urlTemplate &&
        sizes == other.sizes &&
        tags == other.tags;
  }

  @core.override
  core.String toString() {
    return "Image(urlTemplate: $urlTemplate, sizes: $sizes, tags: $tags)";
  }
}

final class ImageImageSize {
  final core.String size;
  final core.int? width;
  final core.int? height;

  const ImageImageSize({
    required this.size,
    this.width,
    this.height,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([size, width, height]);

  @core.override
  core.bool operator ==(covariant ImageImageSize other) {
    if (core.identical(this, other)) {
      return true;
    }
    return size == other.size && width == other.width && height == other.height;
  }

  @core.override
  core.String toString() {
    return "ImageImageSize(size: $size, width: $width, height: $height)";
  }
}
