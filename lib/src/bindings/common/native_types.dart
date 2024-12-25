import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'library.dart';

@internal
final NativeString Function(Pointer<Utf8>, int) newNativeString = library
    .lookup<NativeFunction<NativeString Function(Pointer<Utf8>, Size)>>(
        'maps_flutter_new_native_string')
    .asFunction(isLeaf: true);

@internal
final NativePoint Function(double, double) newNativePoint = library
    .lookup<NativeFunction<NativePoint Function(Float, Float)>>(
        'maps_flutter_new_native_point')
    .asFunction(isLeaf: true);

@internal
final NativeColor Function(int, int, int, int) newNativeColor = library
    .lookup<NativeFunction<NativeColor Function(Uint8, Uint8, Uint8, Uint8)>>(
        'maps_flutter_new_native_color')
    .asFunction(isLeaf: true);

@internal
final NativeBytes Function(Pointer<Uint8>, int) newNativeBytes = library
    .lookup<NativeFunction<NativeBytes Function(Pointer<Uint8>, Size)>>(
        'maps_flutter_new_native_bytes')
    .asFunction(isLeaf: true);

@internal
NativeImageProvider Function(int, int) newNativeImageProvider = library
    .lookup<NativeFunction<NativeImageProvider Function(Uint32, Uint32)>>(
        'maps_flutter_new_native_image_provider')
    .asFunction(isLeaf: true);

@internal
Pointer<Void> Function(bool, int, NativeString) newImageProvider = library
    .lookup<NativeFunction<Pointer<Void> Function(Bool, Int64, NativeString)>>(
        'yandex_maps_flutter_new_image_provider')
    .asFunction(isLeaf: true);

@internal
Pointer<Void> Function(Pointer<NativeFrame>, int, int, NativeString)
    newAnimatedImageProviderFromFrames = library
        .lookup<
                NativeFunction<
                    Pointer<Void> Function(
                        Pointer<NativeFrame>, Size, Size, NativeString)>>(
            'yandex_maps_flutter_new_animated_image_provider_from_frames')
        .asFunction(isLeaf: true);

@internal
Pointer<Void> Function(int, NativeString) newAnimatedImageProviderFromApng =
    library
        .lookup<NativeFunction<Pointer<Void> Function(Int64, NativeString)>>(
            'yandex_maps_flutter_new_animated_image_provider_from_apng')
        .asFunction(isLeaf: true);

@internal
Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>) newViewProvider =
    library
        .lookup<
            NativeFunction<
                Pointer<Void> Function(Int64, Pointer<Void>,
                    Pointer<Void>)>>('yandex_maps_flutter_new_view_provider')
        .asFunction(isLeaf: true);

@internal
Pointer<Void> Function(int, int, NativeString, Pointer<Void>) newModelProvider =
    library
        .lookup<
            NativeFunction<
                Pointer<Void> Function(Int64, Int64, NativeString,
                    Pointer<Void>)>>('yandex_maps_flutter_new_model_provider')
        .asFunction(isLeaf: true);

@internal
Pointer<Void> Function(NativeString, int) newAnimatedModelProvider = library
    .lookup<NativeFunction<Pointer<Void> Function(NativeString, Int64)>>(
        'yandex_maps_flutter_new_animated_model_provider')
    .asFunction(isLeaf: true);

@internal
NativeInterval Function(int) newNativeInterval = library
    .lookup<NativeFunction<NativeInterval Function(Uint64)>>(
        'maps_flutter_new_native_interval')
    .asFunction(isLeaf: true);

@internal
NativeAbsTimestamp Function(int) newNativeAbsTsp = library
    .lookup<NativeFunction<NativeAbsTimestamp Function(Uint64)>>(
        'maps_flutter_new_native_abs_tsp')
    .asFunction(isLeaf: true);

@internal
NativeRelTimestamp Function(int) newNativeRelTsp = library
    .lookup<NativeFunction<NativeRelTimestamp Function(Uint64)>>(
        'maps_flutter_new_native_rel_tsp')
    .asFunction(isLeaf: true);

@internal
final class NativeString extends Struct {
  external Pointer<Utf8> str;

  @Size()
  external int size;
}

@internal
final class NativeBitmap extends Struct {
  @Bool()
  external bool isRaw;
  external Pointer<Uint8> data;
  @Size()
  external int dataSize;
  @Uint32()
  external int width;
  @Uint32()
  external int height;
  external Pointer<Void> originalData;
}

@internal
final class NativePoint extends Struct {
  @Float()
  external double x;
  @Float()
  external double y;
}

@internal
final class NativeColor extends Struct {
  @Uint8()
  external int r;
  @Uint8()
  external int g;
  @Uint8()
  external int b;
  @Uint8()
  external int a;
}

@internal
final class NativeBytes extends Struct {
  external Pointer<Uint8> ptr;
  @Size()
  external int size;
}

@internal
final class NativeImageProvider extends Struct {
  external Pointer<Void> p;
  external Pointer<Uint8> imageData;
}

@internal
final class NativeFrame extends Struct {
  external Pointer<Void> image;
  @Size()
  external int milliseconds;
}

@internal
final class NativeInterval extends Struct {
  @Uint64()
  external int val;
}

@internal
final class NativeAbsTimestamp extends Struct {
  @Uint64()
  external int val;
}

@internal
final class NativeRelTimestamp extends Struct {
  @Uint64()
  external int val;
}
