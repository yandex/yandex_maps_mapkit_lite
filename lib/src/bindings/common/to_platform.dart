import 'dart:typed_data';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:ffi/ffi.dart';

import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_wrapper.dart';

import 'type_dictionary.dart';
import 'native_types.dart';
import 'string_map.dart';
import 'vector.dart';

part 'gen/to_platform.g.dart';

@internal
String toPlatformString(NativeString str) {
  final result = str.str.toDartString(length: str.size);
  malloc.free(str.str);
  return result;
}

@internal
ByteBuffer toPlatformBytes(NativeBytes buf) {
  final result = Uint8List(buf.size);

  result.setAll(0, buf.ptr.asTypedList(buf.size));

  malloc.free(buf.ptr);

  return result.buffer;
}

@internal
Point<double> toPlatformPoint(NativePoint p) {
  return Point(p.x, p.y);
}

@internal
Color toPlatformColor(NativeColor c) {
  return Color.fromARGB(c.a, c.r, c.g, c.b);
}

@internal
Duration toPlatformTimeInterval(NativeInterval t) {
  return Duration(milliseconds: t.val);
}

@internal
DateTime toPlatformAbsTimestamp(NativeAbsTimestamp t) {
  return DateTime.fromMillisecondsSinceEpoch(t.val);
}

@internal
DateTime toPlatformRelTimestamp(NativeRelTimestamp t) {
  return DateTime.fromMillisecondsSinceEpoch(t.val);
}

@internal
ImageWrapper toPlatformBitmap(Pointer<Void> image) {
  return ImageWrapperPrivate.newImageWrapper(image);
}

@internal
Pointer<Void> toPlatformFromPointerAny(Pointer<Void> ptr) {
  return ptr;
}

@internal
TypeDictionaryBase<T> toPlatformTypeDictionary<T>(Pointer<Void> ptr) {
  return NativeTypeDictionary(ptr);
}
