import 'dart:ffi';
import 'dart:typed_data';

import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/image/raw_image.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart'
    as provider;

import 'package:flutter/material.dart';

class ImageWrapper implements Finalizable {
  Pointer<Void> _ptr;
  late ImageProvider imageProvider = _extractImageProvider();

  static final _finalizer = NativeFinalizer(_freeNativeData);

  ImageWrapper._(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  Image get image => Image(image: imageProvider);

  ImageProvider _extractImageProvider() {
    final image = _getNativeBitmap(_ptr);

    if (image.isRaw) {
      return RawImageProvider(this);
    }

    final pixels = Uint8List(image.dataSize);
    pixels.setAll(0, image.data.asTypedList(image.dataSize));

    return MemoryImage(pixels);
  }
}

extension ImageWrapperPrivate on ImageWrapper {
  static ImageWrapper newImageWrapper(Pointer<Void> nativeObject) {
    return ImageWrapper._(nativeObject);
  }

  provider.ImageProvider toImageProvider() {
    return provider.NativeImageProviderWrapper(_getImageProvider(_ptr));
  }

  NativeBitmap get nativeImage => _getNativeBitmap(_ptr);

  int get address => _ptr.address;
}

final NativeBitmap Function(Pointer<Void>) _getNativeBitmap = library
    .lookup<NativeFunction<NativeBitmap Function(Pointer<Void>)>>(
        'yandex_maps_flutter_platform_bitmap_get_native_bitmap')
    .asFunction(isLeaf: true);

final Pointer<Void> Function(Pointer<Void>) _getImageProvider = library
    .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
        'yandex_maps_flutter_platform_bitmap_get_image_provider')
    .asFunction(isLeaf: true);

final _freeNativeData =
    library.lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_platform_bitmap_free');
