import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart'
    as image_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/callback.dart'
    as mapkit_map_callback;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/icon_style.dart'
    as mapkit_map_icon_style;

part 'composite_icon.containers.dart';

/// Combines multiple icons into one.
@bindings_annotations.WeakInterface('mapkit.map.CompositeIcon')
@bindings_annotations.ContainerData(
    toNative: 'CompositeIcon.getNativePtr',
    toPlatform:
        '(val) => CompositeIcon.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class CompositeIcon implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_CompositeIcon_free.cast());

  /// @nodoc
  CompositeIcon.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  CompositeIcon.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory CompositeIcon.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(CompositeIcon? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _CompositeIcon_check(ptr);
  }

  @internal

  /// @nodoc
  static CompositeIcon? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return CompositeIcon.fromNativePtr(ptr);
  }

  /// Creates or resets a named layer with an icon and its style.
  void setIcon(
    image_provider.ImageProvider image,
    mapkit_map_icon_style.IconStyle style, {
    required core.String name,
  }) {
    _CompositeIcon_setIcon(
      ptr,
      to_native.toNativeString(name),
      to_native.toNativeImageProvider(image),
      mapkit_map_icon_style.IconStyle.toNative(style),
    );
  }

  /// Creates or resets a named layer that contains an icon and its style.
  ///
  /// [onFinished] Called when an icon is loaded.
  void setIconWithCallback(
    image_provider.ImageProvider image,
    mapkit_map_icon_style.IconStyle style,
    mapkit_map_callback.Callback onFinished, {
    required core.String name,
  }) {
    _CompositeIcon_setIconWithCallback(
      ptr,
      to_native.toNativeString(name),
      to_native.toNativeImageProvider(image),
      mapkit_map_icon_style.IconStyle.toNative(style),
      mapkit_map_callback.Callback.getNativePtr(onFinished),
    );
  }

  /// Changes the icon style for a specific layer.
  void setIconStyle(
    mapkit_map_icon_style.IconStyle style, {
    required core.String name,
  }) {
    _CompositeIcon_setIconStyle(
      ptr,
      to_native.toNativeString(name),
      mapkit_map_icon_style.IconStyle.toNative(style),
    );
  }

  /// Removes the named layer.
  void removeIcon(core.String name) {
    _CompositeIcon_removeIcon(ptr, to_native.toNativeString(name));
  }

  /// Removes all layers.
  void removeAll() {
    _CompositeIcon_removeAll(ptr);
  }
}

final _CompositeIcon_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CompositeIcon_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _CompositeIcon_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CompositeIcon_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString,
        ffi.Pointer<ffi.Void>, mapkit_map_icon_style.IconStyleNative)
    _CompositeIcon_setIcon = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        native_types.NativeString,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_CompositeIcon_setIcon')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>,
        native_types.NativeString,
        ffi.Pointer<ffi.Void>,
        mapkit_map_icon_style.IconStyleNative,
        ffi.Pointer<ffi.Void>) _CompositeIcon_setIconWithCallback =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        native_types.NativeString,
                        ffi.Pointer<ffi.Void>,
                        mapkit_map_icon_style.IconStyleNative,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_CompositeIcon_setIconWithCallback')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString,
        mapkit_map_icon_style.IconStyleNative) _CompositeIcon_setIconStyle =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        native_types.NativeString,
                        mapkit_map_icon_style.IconStyleNative)>>(
            'yandex_flutter_mapkit_map_CompositeIcon_setIconStyle')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _CompositeIcon_removeIcon = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_map_CompositeIcon_removeIcon')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _CompositeIcon_removeAll = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_CompositeIcon_removeAll')
    .asFunction();
