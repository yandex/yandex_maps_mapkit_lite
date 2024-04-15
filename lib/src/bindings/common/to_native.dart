import 'dart:ffi';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'dart:ui';

import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:yandex_maps_mapkit_lite/src/bindings/view/platform_view.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/ui_view/view_provider.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/image/animated_image_provider.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/model/animated_model_provider.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/model/model_provider.dart';

import 'type_dictionary.dart';
import 'vector.dart';
import 'string_map.dart';
import 'native_types.dart';
import 'dispatcher.dart';

part 'gen/to_native.g.dart';

@internal
NativeString toNativeString(String str) {
  final units = utf8.encode(str);
  final Pointer<Uint8> result = malloc<Uint8>(units.length);
  final Uint8List nativeString = result.asTypedList(units.length);
  nativeString.setAll(0, units);

  return newNativeString(result.cast(), units.length);
}

@internal
NativeBytes toNativeBytes(ByteBuffer buf) {
  final result = malloc<Uint8>(buf.lengthInBytes);
  final data = buf.asInt8List();

  result.asTypedList(buf.lengthInBytes).setAll(0, data);

  return newNativeBytes(result.cast(), buf.lengthInBytes);
}

@internal
NativePoint toNativePoint(Point<double> p) {
  return newNativePoint(p.x, p.y);
}

@internal
NativeColor toNativeColor(Color c) {
  return newNativeColor(c.red, c.green, c.blue, c.alpha);
}

@internal
NativeInterval toNativeTimeInterval(Duration t) {
  return newNativeInterval(t.inMilliseconds);
}

@internal
NativeAbsTimestamp toNativeAbsTimestamp(DateTime t) {
  return newNativeAbsTsp(t.millisecondsSinceEpoch);
}

@internal
NativeRelTimestamp toNativeRelTimestamp(DateTime t) {
  return newNativeRelTsp(t.millisecondsSinceEpoch);
}

@internal
Pointer<Void> toNativeImageProvider(ImageProvider provider) {
  if (provider is NativeImageProviderWrapper) {
    return provider.rawPointer;
  }

  final heap = GetImageProviderData.heap;
  final sendPort = heap.sendPort;
  final nativeObject = newImageProvider(
      provider.cacheable, sendPort, toNativeString(provider.id));
  heap.insertObject(nativeObject, provider);

  return nativeObject;
}

@internal
Pointer<Void> toNativePtrImageProvider(ImageProvider? provider) {
  if (provider == null) return nullptr;

  return toNativeImageProvider(provider);
}

@internal
Pointer<Void> toNativeAnimatedImageProvider(AnimatedImageProvider provider) {
  final data = provider.getData();

  if (data is FramesData) {
    final framesSize = data.frames.length;
    final frames = malloc<NativeFrame>(framesSize);

    for (int i = 0; i < framesSize; i++) {
      final platformFrame = data.frames[i];
      final frame = frames[i];
      frame.image = toNativeImageProvider(platformFrame.image);
      frame.milliseconds = platformFrame.milliseconds;
    }

    return newAnimatedImageProviderFromFrames(
        frames, framesSize, data.loopCount, toNativeString(provider.id));
  } else if (data is RawData) {
    final heap = GetAnimatedImageData.heap;
    final sendPort = heap.sendPort;
    final nativeObject =
        newAnimatedImageProviderFromApng(sendPort, toNativeString(provider.id));

    heap.insertObject(nativeObject, data);

    return nativeObject;
  }

  assert(false);
  return nullptr;
}

@internal
Pointer<Void> toNativePtrAnimatedImageProvider(
    AnimatedImageProvider? provider) {
  if (provider == null) return nullptr;

  return toNativeAnimatedImageProvider(provider);
}

@internal
Pointer<Void> toNativeViewProvider(ViewProvider provider) {
  final heap = ViewProviderNative.heap;
  final sendPort = createExecutePort();
  final result = newViewProvider(sendPort, ViewProviderNative.getOnRequestPtr(),
      ViewProviderNative.getOnDestructionPtr());
  heap[result] = provider;
  return result;
}

@internal
Pointer<Void> toNativeModelProvider(ModelProvider provider) {
  final heap = ModelProviderNative.heap;
  final sendPort = heap.sendPort;
  final nativeObject = newModelProvider(sendPort, createExecutePort(),
      toNativeString(provider.modelId), ModelProviderNative.getTextureNative);

  heap.insertObject(nativeObject, provider);

  return nativeObject;
}

@internal
Pointer<Void> toNativeAnimatedModelProvider(AnimatedModelProvider provider) {
  final heap = AnimatedModelProviderNative.heap;
  final sendPort = heap.sendPort;
  final nativeObject =
      newAnimatedModelProvider(toNativeString(provider.modelId), sendPort);

  heap.insertObject(nativeObject, provider);

  return nativeObject;
}

@internal
Pointer<Void> toNativePtrAny(Pointer<Void>? ptr) {
  return ptr ?? nullptr;
}

@internal
Pointer<Void> toNativeTypeDictionary<T>(TypeDictionaryBase<T> dict) {
  return dict.getNativePtr();
}

@internal
Pointer<Void> toNativePlatformView(PlatformView view) {
  return view.nativePtr;
}
