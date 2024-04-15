import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/rect.dart'
    as mapkit_map_rect;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/rotation_type.dart'
    as mapkit_map_rotation_type;

part 'icon_style.containers.dart';

/// @nodoc
final class IconStyleNative extends ffi.Struct {
  external ffi.Pointer<ffi.Void> anchor;
  external ffi.Pointer<ffi.Void> rotationType;
  external ffi.Pointer<ffi.Void> zIndex;
  external ffi.Pointer<ffi.Void> flat;
  external ffi.Pointer<ffi.Void> visible;
  external ffi.Pointer<ffi.Void> scale;
  external ffi.Pointer<ffi.Void> tappableArea;
}

final IconStyleNative Function(
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>,
        ffi.Pointer<ffi.Void>) _IconStyleNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    IconStyleNative Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_IconStyle_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'IconStyle.toPointer',
    toPlatform: '(val) => IconStyle.fromPointer(val, needFree: false)')
class IconStyle {
  final math.Point<core.double>? anchor;
  final mapkit_map_rotation_type.RotationType? rotationType;
  final core.double? zIndex;
  final core.bool? flat;
  final core.bool? visible;
  final core.double? scale;
  final mapkit_map_rect.Rect? tappableArea;

  const IconStyle({
    this.anchor,
    this.rotationType,
    this.zIndex,
    this.flat,
    this.visible,
    this.scale,
    this.tappableArea,
  });

  /// @nodoc
  @internal
  IconStyle.fromNative(IconStyleNative native)
      : this(
            anchor: to_platform.toPlatformFromPointerPoint(native.anchor),
            rotationType: mapkit_map_rotation_type.RotationType.fromPointer(
                native.rotationType),
            zIndex: to_platform.toPlatformFromPointerFloat(native.zIndex),
            flat: to_platform.toPlatformFromPointerBool(native.flat),
            visible: to_platform.toPlatformFromPointerBool(native.visible),
            scale: to_platform.toPlatformFromPointerFloat(native.scale),
            tappableArea:
                mapkit_map_rect.Rect.fromPointer(native.tappableArea));

  /// @nodoc
  @internal
  static IconStyleNative toNative(IconStyle c) {
    return _IconStyleNativeInit(
        to_native.toNativePtrPoint(c.anchor),
        mapkit_map_rotation_type.RotationType.toPointer(c.rotationType),
        to_native.toNativePtrFloat(c.zIndex),
        to_native.toNativePtrBool(c.flat),
        to_native.toNativePtrBool(c.visible),
        to_native.toNativePtrFloat(c.scale),
        mapkit_map_rect.Rect.toPointer(c.tappableArea));
  }

  /// @nodoc
  @internal
  static IconStyle? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = IconStyle.fromNative(ptr.cast<IconStyleNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(IconStyle? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<IconStyleNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
