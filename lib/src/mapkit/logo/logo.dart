import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/logo/alignment.dart'
    as mapkit_logo_alignment;
import 'package:yandex_maps_mapkit_lite/src/mapkit/logo/padding.dart'
    as mapkit_logo_padding;

part 'logo.containers.dart';

/// The object that allows to control logo display properties.
@bindings_annotations.WeakInterface('mapkit.logo.Logo')
@bindings_annotations.ContainerData(
    toNative: 'Logo.getNativePtr',
    toPlatform:
        '(val) => Logo.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class Logo implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Logo_free.cast());

  /// @nodoc
  Logo.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  Logo.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory Logo.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Logo? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _Logo_check(ptr);
  }

  @internal

  /// @nodoc
  static Logo? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return Logo.fromNativePtr(ptr);
  }

  /// Set logo alignment in the container.
  void setAlignment(mapkit_logo_alignment.LogoAlignment alignment) {
    _Logo_setAlignment(
        ptr, mapkit_logo_alignment.LogoAlignment.toNative(alignment));
  }

  /// Set logo padding relative to the left/right and top/bottom edges.
  /// Values must be positive.
  void setPadding(mapkit_logo_padding.LogoPadding padding) {
    _Logo_setPadding(ptr, mapkit_logo_padding.LogoPadding.toNative(padding));
  }
}

final _Logo_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_logo_Logo_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Logo_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_logo_Logo_check')
    .asFunction(isLeaf: true);

final void Function(
        ffi.Pointer<ffi.Void>, mapkit_logo_alignment.LogoAlignmentNative)
    _Logo_setAlignment = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_logo_alignment.LogoAlignmentNative)>>(
            'yandex_flutter_mapkit_logo_Logo_setAlignment')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_logo_padding.LogoPaddingNative)
    _Logo_setPadding = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_logo_padding.LogoPaddingNative)>>(
            'yandex_flutter_mapkit_logo_Logo_setPadding')
        .asFunction();
