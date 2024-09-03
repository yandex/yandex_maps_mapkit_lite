import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:uuid/uuid.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/model/model_provider.dart';

class AnimatedModelFrame {
  final ModelProvider model;
  final int milliseconds;

  AnimatedModelFrame(this.model, this.milliseconds);
}

class AnimatedModel {
  final List<AnimatedModelFrame> frames;
  final int loopNum;

  AnimatedModel(this.frames, {this.loopNum = 0});
}

class AnimatedModelProvider {
  final AnimatedModel model;
  final String modelId;
  final AsyncErrorHandler _errorHandler;

  static _AnimatedModelProviderHeap _heap = _AnimatedModelProviderHeap();

  AnimatedModelProvider(this.model, {String? modelId, Function? onError})
      : modelId = modelId ?? Uuid().v4(),
        _errorHandler = AsyncErrorHandler(onError);
}

extension AnimatedModelProviderNative on AnimatedModelProvider {
  static _AnimatedModelProviderHeap get heap => AnimatedModelProvider._heap;
}

class _AnimatedModelProviderHeap
    extends AsyncDispatcherHeap<AnimatedModelProvider> {
  @override
  void requestData(AnimatedModelProvider object, Pointer<Void> nativeData) {
    _onCompleteModel(nativeData, object.model.toNative());
  }

  @override
  void onHandlerException(AnimatedModelProvider? object,
      Pointer<Void> nativeData, Object e, StackTrace stackTrace) {
    if (object != null) {
      object._errorHandler.onError(e, stackTrace);
    }
    _onCompleteModel(nativeData, _newAnimatedModel(nullptr, 0, 0));
  }
}

final class _NativeAnimatedModelFrame extends Struct {
  external Pointer<Void> provider;
  @Int64()
  external int milliseconds;
}

final class _NativeAnimatedModel extends Struct {
  external Pointer<_NativeAnimatedModelFrame> frames;
  @Size()
  external int size;
  @Size()
  external int loopNum;
}

extension on AnimatedModel {
  _NativeAnimatedModel toNative() {
    final ptr = malloc.call<_NativeAnimatedModelFrame>(frames.length);

    for (int i = 0; i < frames.length; i++) {
      final ref = ptr.elementAt(i).ref;
      ref.provider = toNativeModelProvider(frames[i].model);
      ref.milliseconds = frames[i].milliseconds;
    }

    return _newAnimatedModel(ptr, frames.length, loopNum);
  }
}

final _NativeAnimatedModel Function(
        Pointer<_NativeAnimatedModelFrame>, int, int) _newAnimatedModel =
    library
        .lookup<
            NativeFunction<
                _NativeAnimatedModel Function(
                    Pointer<_NativeAnimatedModelFrame>,
                    Size,
                    Size)>>('yandex_maps_flutter_new_animated_model')
        .asFunction(isLeaf: true);

final void Function(Pointer<Void>, _NativeAnimatedModel) _onCompleteModel =
    library
        .lookup<
                NativeFunction<
                    Void Function(Pointer<Void>, _NativeAnimatedModel)>>(
            'yandex_maps_flutter_animated_model_provider_on_complete_model')
        .asFunction(isLeaf: true);
