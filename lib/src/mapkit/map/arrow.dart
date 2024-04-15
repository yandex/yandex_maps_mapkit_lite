import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:ui' as ui;
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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;

part 'arrow.containers.dart';

/// The arrow element.
@bindings_annotations.WeakInterface('mapkit.map.Arrow')
@bindings_annotations.ContainerData(
    toNative: 'Arrow.getNativePtr',
    toPlatform:
        '(val) => Arrow.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class Arrow implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Arrow_free.cast());

  /// @nodoc
  Arrow.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  Arrow.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory Arrow.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Arrow? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _Arrow_check(ptr);
  }

  @internal

  /// @nodoc
  static Arrow? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return Arrow.fromNativePtr(ptr);
  }

  /// Arrow center.
  mapkit_geometry_geometry.PolylinePosition get position {
    return mapkit_geometry_geometry.PolylinePosition.fromNative(
        _Arrow_get_position(ptr));
  }

  /// Arrow fill color.
  ui.Color get fillColor {
    return to_platform.toPlatformColor(_Arrow_get_fillColor(ptr));
  }

  set fillColor(ui.Color val) {
    return _Arrow_set_fillColor(ptr, to_native.toNativeColor(val));
  }

  /// Color of the arrow's outline. Default: white.
  ui.Color get outlineColor {
    return to_platform.toPlatformColor(_Arrow_get_outlineColor(ptr));
  }

  set outlineColor(ui.Color val) {
    return _Arrow_set_outlineColor(ptr, to_native.toNativeColor(val));
  }

  /// The width of the outline in units. Default: 2.
  core.double get outlineWidth {
    return _Arrow_get_outlineWidth(ptr);
  }

  set outlineWidth(core.double val) {
    return _Arrow_set_outlineWidth(ptr, val);
  }

  /// The overall length of the arrow (including the tip) in units. The
  /// size of a unit is equal to the size of a pixel at the current zoom
  /// level when the camera tilt is equal to 0 and the scale factor is
  /// equal to 1.
  core.double get length {
    return _Arrow_get_length(ptr);
  }

  set length(core.double val) {
    return _Arrow_set_length(ptr, val);
  }

  /// Arrow visibility. Default: true.
  core.bool get visible {
    return _Arrow_get_visible(ptr);
  }

  set visible(core.bool val) {
    return _Arrow_set_visible(ptr, val);
  }

  /// Describes height of the arrowhead in units. Default: 0.2 * length.
  core.double get triangleHeight {
    return _Arrow_get_triangleHeight(ptr);
  }

  set triangleHeight(core.double val) {
    return _Arrow_set_triangleHeight(ptr, val);
  }
}

final _Arrow_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Arrow_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Arrow_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Arrow_check')
    .asFunction(isLeaf: true);

final mapkit_geometry_geometry.PolylinePositionNative Function(
        ffi.Pointer<ffi.Void>) _Arrow_get_position =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geometry.PolylinePositionNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Arrow_get_position')
        .asFunction();

final native_types.NativeColor Function(ffi.Pointer<ffi.Void>)
    _Arrow_get_fillColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Arrow_get_fillColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _Arrow_set_fillColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_Arrow_set_fillColor')
        .asFunction();

final native_types.NativeColor Function(ffi.Pointer<ffi.Void>)
    _Arrow_get_outlineColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Arrow_get_outlineColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _Arrow_set_outlineColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_Arrow_set_outlineColor')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _Arrow_get_outlineWidth = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Arrow_get_outlineWidth')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _Arrow_set_outlineWidth = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_Arrow_set_outlineWidth')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _Arrow_get_length = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Arrow_get_length')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double) _Arrow_set_length = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Float)>>('yandex_flutter_mapkit_map_Arrow_set_length')
    .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _Arrow_get_visible = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Arrow_get_visible')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool) _Arrow_set_visible = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Bool)>>('yandex_flutter_mapkit_map_Arrow_set_visible')
    .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _Arrow_get_triangleHeight =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Arrow_get_triangleHeight')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _Arrow_set_triangleHeight = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_Arrow_set_triangleHeight')
        .asFunction();
