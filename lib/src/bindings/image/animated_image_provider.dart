import 'image_provider.dart';

import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart';

import 'package:uuid/uuid.dart';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/services.dart' show AssetBundle, rootBundle;

class AnimatedImageProvider {
  AnimatedImageProvider.fromFrames(List<Frame> frames,
      {int loopCount = 1, String? id})
      : _data = FramesData(frames, loopCount),
        id = id ?? _generateId();

  AnimatedImageProvider.fromRawData(Future<ByteData> Function() onDataRequest,
      {String? id, Function? onError})
      : _data = RawData(onDataRequest, AsyncErrorHandler(onError)),
        id = id ?? _generateId();

  AnimatedImageProvider.fromAsset(String name,
      {AssetBundle? bundle, String? package, String? id, Function? onError})
      : this.fromRawData(
            () => (bundle ?? rootBundle)
                .load(package == null ? name : 'packages/$package/$name'),
            id: id,
            onError: onError);

  static String _generateId() {
    return const Uuid().v4();
  }

  static final _heap = AnimatedImageProviderHeap();

  final AnimatedImageProviderData _data;
  final String id;
}

class Frame {
  Frame(this.image, this.milliseconds);

  final ImageProvider image;
  final int milliseconds;
}

extension GetAnimatedImageData on AnimatedImageProvider {
  static AnimatedImageProviderHeap get heap => AnimatedImageProvider._heap;

  AnimatedImageProviderData getData() {
    return _data;
  }
}

abstract class AnimatedImageProviderData {}

class FramesData extends AnimatedImageProviderData {
  FramesData(this.frames, this.loopCount);

  final List<Frame> frames;
  final int loopCount;
}

class RawData extends AnimatedImageProviderData {
  RawData(this.onDataRequest, this.errorHandler);

  final Future<ByteData> Function() onDataRequest;
  AsyncErrorHandler errorHandler;
}

class AnimatedImageProviderHeap extends AsyncDispatcherHeap<RawData> {
  @override
  void requestData(RawData object, Pointer<Void> nativeData) {
    object
        .onDataRequest()
        .then((value) => _onAnimatedImageProviderComplete(
            nativeData, toNativeBytes(value.buffer)))
        .catchError((e, stackTrace) =>
            onHandlerException(object, nativeData, e, stackTrace));
  }

  @override
  void onHandlerException(RawData? object, Pointer<Void> nativeData, Object e,
      StackTrace stackTrace) {
    if (object != null) {
      object.errorHandler.onError(e, stackTrace);
    }
    _onAnimatedImageProviderComplete(nativeData, newNativeBytes(nullptr, 0));
  }
}

final void Function(Pointer<Void>, NativeBytes)
    _onAnimatedImageProviderComplete = library
        .lookup<NativeFunction<Void Function(Pointer<Void>, NativeBytes)>>(
            'yandex_maps_flutter_on_animated_image_provider_complete')
        .asFunction(isLeaf: true);
