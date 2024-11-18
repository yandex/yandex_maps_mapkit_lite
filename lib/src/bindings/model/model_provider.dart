import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:uuid/uuid.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart';

class ModelProvider {
  final ImageProvider texture;
  final Future<ByteData> Function() onModelRequest;
  final String modelId;
  final AsyncErrorHandler _errorHandler;

  static final _heap = _ModelProviderHeap();

  ModelProvider(this.texture,
      {required this.onModelRequest, String? modelId, Function? onError})
      : modelId = modelId ?? Uuid().v4(),
        _errorHandler = AsyncErrorHandler(onError);
}

extension ModelProviderNative on ModelProvider {
  static _ModelProviderHeap get heap => ModelProvider._heap;
  static Pointer<Void> get getTextureNative => _getTextureNative;
}

class _ModelProviderHeap extends AsyncDispatcherHeap<ModelProvider> {
  static Future<ByteData> _getModel(ModelProvider object) {
    return object.onModelRequest();
  }

  @override
  void requestData(ModelProvider object, Pointer<Void> nativeData) {
    _getModel(object)
        .then((value) =>
            _onModelComplete(nativeData, toNativeBytes(value.buffer)))
        .catchError((e, stackTrace) =>
            onHandlerException(object, nativeData, e, stackTrace));
  }

  @override
  void onHandlerException(ModelProvider? object, Pointer<Void> nativeData,
      Object e, StackTrace stackTrace) {
    _onModelComplete(nativeData, newNativeBytes(nullptr, 0));
    if (object != null) {
      object._errorHandler.onError(e, stackTrace);
    } else {
      throw e;
    }
  }
}

final void Function(Pointer<Void>, NativeBytes) _onModelComplete = library
    .lookup<NativeFunction<Void Function(Pointer<Void>, NativeBytes)>>(
        'yandex_maps_flutter_model_provider_on_complete_model')
    .asFunction(isLeaf: true);

Pointer<Void> _getTexture(Pointer<Void> nativeObject) {
  return toNativeImageProvider(
      ModelProvider._heap.findObject(nativeObject).texture);
}

final Pointer<Void> _getTextureNative =
    Pointer.fromFunction<Pointer<Void> Function(Pointer<Void>)>(_getTexture)
        .cast();
