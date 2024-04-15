import 'dart:async';
import 'dart:ffi';
import 'dart:ui' as ui;

import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart';

class ImageProviderResult {
  ImageProviderResult._(this.imageProvider);

  static Future<ImageProviderResult> resolve(ui.Image image, String id) async {
    final buffer =
        (await image.toByteData(format: ui.ImageByteFormat.rawRgba))!;
    final u8Buffer = buffer.buffer.asUint8List();
    final nativeImageProvider =
        newNativeImageProvider(image.width, image.height);

    nativeImageProvider.imageData
        .asTypedList(u8Buffer.length)
        .setAll(0, u8Buffer);

    return ImageProviderResult._(nativeImageProvider);
  }

  final NativeImageProvider imageProvider;
}
