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

part 'error.containers.dart';

/// An error has occurred.
@bindings_annotations.WeakInterface('runtime.Error')
@bindings_annotations.ContainerData(
    toNative: 'Error.getNativePtr',
    toPlatform:
        '(val) => Error.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class Error implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Error_free.cast());

  /// @nodoc
  Error.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  Error.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory Error.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Error? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _Error_check(ptr);
  }

  @internal

  /// @nodoc
  static Error? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return Error.fromNativePtr(ptr);
  }
}

final _Error_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_Error_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Error_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_Error_check')
    .asFunction(isLeaf: true);
