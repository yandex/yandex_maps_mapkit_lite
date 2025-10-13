// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart';

@internal
int? toPlatformFromPointerInt(Pointer<Void> ptr, {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = ptr.cast<Int>().value;
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<int> toMapInt(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerInt(val, needFree: false));
}

@internal
Vector<int> toVectorInt(Pointer<Void> ptr) {
  return Vector(ptr, (val) => toPlatformFromPointerInt(val, needFree: false));
}

@internal
Vector<Vector<int>> toVectorVectorInt(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toVectorInt(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<int>> toVectorDictionaryInt(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toMapInt(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<int>> toMapDictionaryInt(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toMapInt(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<int>> toMapVectorInt(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toVectorInt(val.cast<Pointer<Void>>().value));
}

@internal
int? toPlatformFromPointerInt32(Pointer<Void> ptr, {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = ptr.cast<Int32>().value;
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<int> toMapInt32(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerInt32(val, needFree: false));
}

@internal
Vector<int> toVectorInt32(Pointer<Void> ptr) {
  return Vector(ptr, (val) => toPlatformFromPointerInt32(val, needFree: false));
}

@internal
Vector<Vector<int>> toVectorVectorInt32(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorInt32(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<int>> toVectorDictionaryInt32(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toMapInt32(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<int>> toMapDictionaryInt32(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toMapInt32(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<int>> toMapVectorInt32(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorInt32(val.cast<Pointer<Void>>().value));
}

@internal
int? toPlatformFromPointerInt64(Pointer<Void> ptr, {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = ptr.cast<Int64>().value;
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<int> toMapInt64(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerInt64(val, needFree: false));
}

@internal
Vector<int> toVectorInt64(Pointer<Void> ptr) {
  return Vector(ptr, (val) => toPlatformFromPointerInt64(val, needFree: false));
}

@internal
Vector<Vector<int>> toVectorVectorInt64(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorInt64(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<int>> toVectorDictionaryInt64(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toMapInt64(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<int>> toMapDictionaryInt64(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toMapInt64(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<int>> toMapVectorInt64(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorInt64(val.cast<Pointer<Void>>().value));
}

@internal
int? toPlatformFromPointerUint32(Pointer<Void> ptr, {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = ptr.cast<Uint32>().value;
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<int> toMapUint32(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerUint32(val, needFree: false));
}

@internal
Vector<int> toVectorUint32(Pointer<Void> ptr) {
  return Vector(
      ptr, (val) => toPlatformFromPointerUint32(val, needFree: false));
}

@internal
Vector<Vector<int>> toVectorVectorUint32(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorUint32(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<int>> toVectorDictionaryUint32(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toMapUint32(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<int>> toMapDictionaryUint32(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toMapUint32(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<int>> toMapVectorUint32(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorUint32(val.cast<Pointer<Void>>().value));
}

@internal
double? toPlatformFromPointerFloat(Pointer<Void> ptr, {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = ptr.cast<Float>().value;
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<double> toMapFloat(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerFloat(val, needFree: false));
}

@internal
Vector<double> toVectorFloat(Pointer<Void> ptr) {
  return Vector(ptr, (val) => toPlatformFromPointerFloat(val, needFree: false));
}

@internal
Vector<Vector<double>> toVectorVectorFloat(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorFloat(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<double>> toVectorDictionaryFloat(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toMapFloat(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<double>> toMapDictionaryFloat(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toMapFloat(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<double>> toMapVectorFloat(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorFloat(val.cast<Pointer<Void>>().value));
}

@internal
double? toPlatformFromPointerDouble(Pointer<Void> ptr, {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = ptr.cast<Double>().value;
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<double> toMapDouble(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerDouble(val, needFree: false));
}

@internal
Vector<double> toVectorDouble(Pointer<Void> ptr) {
  return Vector(
      ptr, (val) => toPlatformFromPointerDouble(val, needFree: false));
}

@internal
Vector<Vector<double>> toVectorVectorDouble(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorDouble(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<double>> toVectorDictionaryDouble(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toMapDouble(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<double>> toMapDictionaryDouble(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toMapDouble(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<double>> toMapVectorDouble(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorDouble(val.cast<Pointer<Void>>().value));
}

@internal
bool? toPlatformFromPointerBool(Pointer<Void> ptr, {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = ptr.cast<Bool>().value;
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<bool> toMapBool(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerBool(val, needFree: false));
}

@internal
Vector<bool> toVectorBool(Pointer<Void> ptr) {
  return Vector(ptr, (val) => toPlatformFromPointerBool(val, needFree: false));
}

@internal
Vector<Vector<bool>> toVectorVectorBool(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorBool(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<bool>> toVectorDictionaryBool(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toMapBool(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<bool>> toMapDictionaryBool(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toMapBool(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<bool>> toMapVectorBool(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorBool(val.cast<Pointer<Void>>().value));
}

@internal
String? toPlatformFromPointerString(Pointer<Void> ptr, {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = toPlatformString(ptr.cast<NativeString>().ref);
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<String> toMapString(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerString(val, needFree: false));
}

@internal
Vector<String> toVectorString(Pointer<Void> ptr) {
  return Vector(
      ptr, (val) => toPlatformFromPointerString(val, needFree: false));
}

@internal
Vector<Vector<String>> toVectorVectorString(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorString(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<String>> toVectorDictionaryString(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toMapString(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<String>> toMapDictionaryString(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toMapString(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<String>> toMapVectorString(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorString(val.cast<Pointer<Void>>().value));
}

@internal
ByteBuffer? toPlatformFromPointerBytes(Pointer<Void> ptr,
    {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = toPlatformBytes(ptr.cast<NativeBytes>().ref);
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<ByteBuffer> toMapBytes(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerBytes(val, needFree: false));
}

@internal
Vector<ByteBuffer> toVectorBytes(Pointer<Void> ptr) {
  return Vector(ptr, (val) => toPlatformFromPointerBytes(val, needFree: false));
}

@internal
Vector<Vector<ByteBuffer>> toVectorVectorBytes(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorBytes(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<ByteBuffer>> toVectorDictionaryBytes(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toMapBytes(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<ByteBuffer>> toMapDictionaryBytes(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toMapBytes(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<ByteBuffer>> toMapVectorBytes(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorBytes(val.cast<Pointer<Void>>().value));
}

@internal
Point<double>? toPlatformFromPointerPoint(Pointer<Void> ptr,
    {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = toPlatformPoint(ptr.cast<NativePoint>().ref);
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<Point<double>> toMapPoint(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerPoint(val, needFree: false));
}

@internal
Vector<Point<double>> toVectorPoint(Pointer<Void> ptr) {
  return Vector(ptr, (val) => toPlatformFromPointerPoint(val, needFree: false));
}

@internal
Vector<Vector<Point<double>>> toVectorVectorPoint(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorPoint(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<Point<double>>> toVectorDictionaryPoint(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toMapPoint(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<Point<double>>> toMapDictionaryPoint(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toMapPoint(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<Point<double>>> toMapVectorPoint(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorPoint(val.cast<Pointer<Void>>().value));
}

@internal
Color? toPlatformFromPointerColor(Pointer<Void> ptr, {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = toPlatformColor(ptr.cast<NativeColor>().ref);
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<Color> toMapColor(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerColor(val, needFree: false));
}

@internal
Vector<Color> toVectorColor(Pointer<Void> ptr) {
  return Vector(ptr, (val) => toPlatformFromPointerColor(val, needFree: false));
}

@internal
Vector<Vector<Color>> toVectorVectorColor(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorColor(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<Color>> toVectorDictionaryColor(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) =>
          val == nullptr ? null : toMapColor(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<Color>> toMapDictionaryColor(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) =>
          val == nullptr ? null : toMapColor(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<Color>> toMapVectorColor(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorColor(val.cast<Pointer<Void>>().value));
}

@internal
Duration? toPlatformFromPointerTimeInterval(Pointer<Void> ptr,
    {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = toPlatformTimeInterval(ptr.cast<NativeInterval>().ref);
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<Duration> toMapTimeInterval(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerTimeInterval(val, needFree: false));
}

@internal
Vector<Duration> toVectorTimeInterval(Pointer<Void> ptr) {
  return Vector(
      ptr, (val) => toPlatformFromPointerTimeInterval(val, needFree: false));
}

@internal
Vector<Vector<Duration>> toVectorVectorTimeInterval(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorTimeInterval(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<Duration>> toVectorDictionaryTimeInterval(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toMapTimeInterval(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<Duration>> toMapDictionaryTimeInterval(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toMapTimeInterval(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<Duration>> toMapVectorTimeInterval(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorTimeInterval(val.cast<Pointer<Void>>().value));
}

@internal
DateTime? toPlatformFromPointerAbsTimestamp(Pointer<Void> ptr,
    {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = toPlatformAbsTimestamp(ptr.cast<NativeAbsTimestamp>().ref);
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<DateTime> toMapAbsTimestamp(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerAbsTimestamp(val, needFree: false));
}

@internal
Vector<DateTime> toVectorAbsTimestamp(Pointer<Void> ptr) {
  return Vector(
      ptr, (val) => toPlatformFromPointerAbsTimestamp(val, needFree: false));
}

@internal
Vector<Vector<DateTime>> toVectorVectorAbsTimestamp(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorAbsTimestamp(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<DateTime>> toVectorDictionaryAbsTimestamp(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toMapAbsTimestamp(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<DateTime>> toMapDictionaryAbsTimestamp(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toMapAbsTimestamp(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<DateTime>> toMapVectorAbsTimestamp(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorAbsTimestamp(val.cast<Pointer<Void>>().value));
}

@internal
DateTime? toPlatformFromPointerRelTimestamp(Pointer<Void> ptr,
    {bool needFree = true}) {
  if (ptr == nullptr) {
    return null;
  }
  final result = toPlatformRelTimestamp(ptr.cast<NativeRelTimestamp>().ref);
  if (needFree) {
    malloc.free(ptr);
  }
  return result;
}

@internal
StringMap<DateTime> toMapRelTimestamp(Pointer<Void> ptr) {
  return StringMap(
      ptr, (val) => toPlatformFromPointerRelTimestamp(val, needFree: false));
}

@internal
Vector<DateTime> toVectorRelTimestamp(Pointer<Void> ptr) {
  return Vector(
      ptr, (val) => toPlatformFromPointerRelTimestamp(val, needFree: false));
}

@internal
Vector<Vector<DateTime>> toVectorVectorRelTimestamp(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorRelTimestamp(val.cast<Pointer<Void>>().value));
}

@internal
Vector<StringMap<DateTime>> toVectorDictionaryRelTimestamp(Pointer<Void> ptr) {
  return Vector(
      ptr,
      (val) => val == nullptr
          ? null
          : toMapRelTimestamp(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<StringMap<DateTime>> toMapDictionaryRelTimestamp(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toMapRelTimestamp(val.cast<Pointer<Void>>().value));
}

@internal
StringMap<Vector<DateTime>> toMapVectorRelTimestamp(Pointer<Void> ptr) {
  return StringMap(
      ptr,
      (val) => val == nullptr
          ? null
          : toVectorRelTimestamp(val.cast<Pointer<Void>>().value));
}
