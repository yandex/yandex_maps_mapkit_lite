import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:ui' as ui;
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
import 'package:yandex_maps_mapkit_lite/src/mapkit/navigation/jam_segment.dart'
    as mapkit_navigation_jam_segment;

part 'jam_style.containers.dart';

/// @nodoc
final class JamTypeColorNative extends ffi.Struct {
  @ffi.Int64()
  external core.int jamType;
  external native_types.NativeColor jamColor;
}

final JamTypeColorNative Function(core.int, native_types.NativeColor)
    _JamTypeColorNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    JamTypeColorNative Function(
                        ffi.Int64, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_navigation_JamTypeColor_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'JamTypeColor.toPointer',
    toPlatform: '(val) => JamTypeColor.fromPointer(val, needFree: false)')
class JamTypeColor {
  final mapkit_navigation_jam_segment.JamType jamType;
  final ui.Color jamColor;

  const JamTypeColor(this.jamType, this.jamColor);

  /// @nodoc
  @internal
  JamTypeColor.fromNative(JamTypeColorNative native)
      : this(mapkit_navigation_jam_segment.JamType.fromInt(native.jamType),
            to_platform.toPlatformColor(native.jamColor));

  /// @nodoc
  @internal
  static JamTypeColorNative toNative(JamTypeColor c) {
    return _JamTypeColorNativeInit(
        mapkit_navigation_jam_segment.JamType.toInt(c.jamType),
        to_native.toNativeColor(c.jamColor));
  }

  /// @nodoc
  @internal
  static JamTypeColor? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = JamTypeColor.fromNative(ptr.cast<JamTypeColorNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(JamTypeColor? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<JamTypeColorNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'JamStyle.toPointer',
    toPlatform: '(val) => JamStyle.fromPointer(val, needFree: false)')
class JamStyle implements ffi.Finalizable {
  late final colors = JamTypeColorContainerExtension.toPlatformVector(
      _JamStyle_get_colors(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_JamStyle_free.cast());

  JamStyle(core.List<JamTypeColor> colors)
      : this.fromNativePtr(_JamStyle_init(
            JamTypeColorContainerExtension.toNativeVector(colors)));

  /// @nodoc
  @internal
  JamStyle.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(JamStyle? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static JamStyle? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return JamStyle.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static JamStyle? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        JamStyle.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(JamStyle? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _JamStyle_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _JamStyle_clone =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_navigation_JamStyle_clone')
        .asFunction(isLeaf: true);

final _JamStyle_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_navigation_JamStyle_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _JamStyle_init = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_navigation_JamStyle_init')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _JamStyle_get_colors = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_navigation_JamStyle_get_colors')
        .asFunction(isLeaf: true);
