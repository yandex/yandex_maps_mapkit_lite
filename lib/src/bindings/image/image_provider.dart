import 'dart:async';
import 'dart:ui' as ui;
import 'dart:ffi';

import 'package:flutter/material.dart';
import "package:flutter/painting.dart" as painting;
import 'package:uuid/uuid.dart';

import 'image_provider_result.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart';

class ImageProvider {
  ImageProvider(this._onImageRequest,
      {this.cacheable = true, String? id, Function? onError})
      : _errorHandler = AsyncErrorHandler(onError),
        id = id ?? _generateId();

  ImageProvider.fromImageProvider(painting.ImageProvider provider,
      {bool cacheable = true, String? id, Function? onError})
      : this(() => _imageFromImageProvider(provider),
            id: id, cacheable: cacheable, onError: onError);

  static Future<ui.Image> _imageFromImageProvider(
      painting.ImageProvider provider) {
    final completer = Completer<ui.Image>();

    final configuration = ImageConfiguration(
        devicePixelRatio: WidgetsBinding.instance.window.devicePixelRatio);

    final imageStream = provider.resolve(configuration);

    final listener = ImageStreamListener(
        (image, synchronousCall) => completer.complete(image.image),
        onError: completer.completeError);

    imageStream.addListener(listener);

    return completer.future;
  }

  static String _generateId() {
    return const Uuid().v4();
  }

  static final _heap = ImageProviderHeap();

  final FutureOr<ui.Image> Function() _onImageRequest;
  final AsyncErrorHandler _errorHandler;
  final String id;
  final bool cacheable;
}

class NativeImageProviderWrapper implements ImageProvider {
  Pointer<Void> rawPointer;

  NativeImageProviderWrapper(this.rawPointer);

  @override
  FutureOr<ui.Image> Function() get _onImageRequest =>
      throw UnimplementedError();

  @override
  bool get cacheable => throw UnimplementedError();

  @override
  String get id => throw UnimplementedError();

  @override
  AsyncErrorHandler get _errorHandler => throw UnimplementedError();
}

extension GetImageProviderData on ImageProvider {
  static ImageProviderHeap get heap => ImageProvider._heap;
}

class ImageProviderHeap extends AsyncDispatcherHeap<ImageProvider> {
  Future<ImageProviderResult> _getImageProviderResult(
      ImageProvider imageProvider) async {
    final image = await imageProvider._onImageRequest();

    try {
      return await ImageProviderResult.resolve(image, imageProvider.id);
    } finally {
      image.dispose();
    }
  }

  @override
  void requestData(ImageProvider object, Pointer<Void> nativeData) {
    _getImageProviderResult(object)
        .then((value) =>
            _onImageProviderComplete(nativeData, value.imageProvider))
        .catchError((e, stackTrace) =>
            onHandlerException(object, nativeData, e, stackTrace));
  }

  @override
  void onHandlerException(ImageProvider? object, Pointer<Void> nativeData,
      Object e, StackTrace stackTrace) {
    if (object != null) {
      object._errorHandler.onError(e, stackTrace);
    }
    _onImageProviderComplete(nativeData, newNativeImageProvider(0, 0));
  }
}

final void Function(Pointer<Void>, NativeImageProvider)
    _onImageProviderComplete = library
        .lookup<
                NativeFunction<
                    Void Function(Pointer<Void>, NativeImageProvider)>>(
            'yandex_maps_flutter_image_on_image_provider_complete')
        .asFunction(isLeaf: true);
