import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'spannable_string.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'SpannableString.toPointer',
    toPlatform: '(val) => SpannableString.fromPointer(val, needFree: false)')
class SpannableString implements ffi.Finalizable {
  late final text =
      to_platform.toPlatformString(_SpannableString_get_text(_ptr));
  late final spans = SpannableStringSpanContainerExtension.toPlatformVector(
      _SpannableString_get_spans(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_SpannableString_free.cast());

  SpannableString(core.String text, core.List<SpannableStringSpan> spans)
      : this.fromNativePtr(_SpannableString_init(to_native.toNativeString(text),
            SpannableStringSpanContainerExtension.toNativeVector(spans)));

  /// @nodoc
  @internal
  SpannableString.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(SpannableString? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static SpannableString? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return SpannableString.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static SpannableString? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        SpannableString.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(SpannableString? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _SpannableString_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _SpannableString_clone = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_SpannableString_clone')
        .asFunction(isLeaf: true);

final _SpannableString_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_SpannableString_free');

final ffi.Pointer<ffi.Void> Function(
        native_types.NativeString, ffi.Pointer<ffi.Void>)
    _SpannableString_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        native_types.NativeString, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_SpannableString_init')
        .asFunction(isLeaf: true);

final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _SpannableString_get_text = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_SpannableString_get_text')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _SpannableString_get_spans = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_SpannableString_get_spans')
        .asFunction(isLeaf: true);

/// @nodoc
final class SpannableStringSpanNative extends ffi.Struct {
  @ffi.Int()
  external core.int begin;
  @ffi.Int()
  external core.int end;
}

final SpannableStringSpanNative Function(core.int, core.int)
    _SpannableStringSpanNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    SpannableStringSpanNative Function(ffi.Int, ffi.Int)>>(
            'yandex_flutter_mapkit_SpannableString_SpannableStringSpan_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'SpannableStringSpan.toPointer',
    toPlatform:
        '(val) => SpannableStringSpan.fromPointer(val, needFree: false)')
class SpannableStringSpan {
  final core.int begin;
  final core.int end;

  const SpannableStringSpan({
    required this.begin,
    required this.end,
  });

  /// @nodoc
  @internal
  SpannableStringSpan.fromNative(SpannableStringSpanNative native)
      : this(begin: native.begin, end: native.end);

  /// @nodoc
  @internal
  static SpannableStringSpanNative toNative(SpannableStringSpan c) {
    return _SpannableStringSpanNativeInit(c.begin, c.end);
  }

  /// @nodoc
  @internal
  static SpannableStringSpan? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = SpannableStringSpan.fromNative(
        ptr.cast<SpannableStringSpanNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(SpannableStringSpan? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<SpannableStringSpanNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
