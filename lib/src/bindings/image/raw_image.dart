import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart';

@internal
class RawImageProvider extends ImageProvider<RawImageProvider> {
  RawImageProvider(this.id, this.image, this.pixels);

  @override
  ImageStreamCompleter loadImage(
      RawImageProvider key, ImageDecoderCallback callback) {
    return OneFrameImageStreamCompleter(extractInfo(key));
  }

  @override
  Future<RawImageProvider> obtainKey(ImageConfiguration _) {
    return SynchronousFuture(this);
  }

  Future<ImageInfo> extractInfo(RawImageProvider key) async {
    assert(identical(key, this));
    final buffer = await pixels;

    try {
      final codec = await ui.ImageDescriptor.raw(
        buffer,
        width: image.width,
        height: image.height,
        pixelFormat: ui.PixelFormat.rgba8888,
      ).instantiateCodec();

      final frameInfo = await codec.getNextFrame();

      return ImageInfo(image: frameInfo.image);
    } finally {
      buffer.dispose();
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is RawImageProvider && other.pixels == pixels;
  }

  @override
  int get hashCode => id;

  final NativeBitmap image;
  final Future<ui.ImmutableBuffer> pixels;
  final int id;
}
