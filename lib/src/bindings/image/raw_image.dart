import 'dart:ffi';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'image_wrapper.dart';

@internal
class RawImageProvider extends ImageProvider<RawImageProvider> {
  RawImageProvider(this._imageWrapper);

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
    final image = _imageWrapper.nativeImage;
    final buffer = await ui.ImmutableBuffer.fromUint8List(
        image.data.asTypedList(image.dataSize));

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
    return other is RawImageProvider &&
        _imageWrapper.address == other._imageWrapper.address;
  }

  @override
  int get hashCode => _imageWrapper.address;

  ImageWrapper _imageWrapper;
}
