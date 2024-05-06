import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:ui' as ui;
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

part 'image_data_descriptor.containers.dart';
part 'image_data_descriptor.impl.dart';

final class ImagesImageDataDescriptor {
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

  @core.override
  core.int get hashCode => core.Object.hashAll(
      [imageId, primaryColor, secondaryColor, tertiaryColor]);

  @core.override
  core.bool operator ==(covariant ImagesImageDataDescriptor other) {
    if (core.identical(this, other)) {
      return true;
    }
    return imageId == other.imageId &&
        primaryColor == other.primaryColor &&
        secondaryColor == other.secondaryColor &&
        tertiaryColor == other.tertiaryColor;
  }

  @core.override
  core.String toString() {
    return "ImagesImageDataDescriptor(imageId: $imageId, primaryColor: $primaryColor, secondaryColor: $secondaryColor, tertiaryColor: $tertiaryColor)";
  }
}
