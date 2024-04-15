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
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;

part 'local_error.containers.dart';

/// Local error has occurred.
@bindings_annotations.WeakInterface('runtime.LocalError')
@bindings_annotations.ContainerData(
    toNative: 'LocalError.getNativePtr',
    toPlatform:
        '(val) => LocalError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class LocalError extends runtime_error.Error implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_LocalError_free.cast());

  /// @nodoc
  LocalError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  LocalError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory LocalError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(LocalError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _LocalError_check(ptr);
  }

  @internal

  /// @nodoc
  static LocalError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LocalError.fromNativePtr(ptr);
  }
}

final _LocalError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_LocalError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _LocalError_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_LocalError_check')
    .asFunction(isLeaf: true);

/// Disk is full.
@bindings_annotations.WeakInterface('runtime.DiskFullError')
@bindings_annotations.ContainerData(
    toNative: 'DiskFullError.getNativePtr',
    toPlatform:
        '(val) => DiskFullError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class DiskFullError extends LocalError implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_DiskFullError_free.cast());

  /// @nodoc
  DiskFullError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  DiskFullError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory DiskFullError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DiskFullError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _DiskFullError_check(ptr);
  }

  @internal

  /// @nodoc
  static DiskFullError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DiskFullError.fromNativePtr(ptr);
  }
}

final _DiskFullError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DiskFullError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _DiskFullError_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DiskFullError_check')
    .asFunction(isLeaf: true);

/// Disk is corrupted.
@bindings_annotations.WeakInterface('runtime.DiskCorruptError')
@bindings_annotations.ContainerData(
    toNative: 'DiskCorruptError.getNativePtr',
    toPlatform:
        '(val) => DiskCorruptError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class DiskCorruptError extends LocalError implements ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_DiskCorruptError_free.cast());

  /// @nodoc
  DiskCorruptError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  DiskCorruptError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory DiskCorruptError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DiskCorruptError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _DiskCorruptError_check(ptr);
  }

  @internal

  /// @nodoc
  static DiskCorruptError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DiskCorruptError.fromNativePtr(ptr);
  }
}

final _DiskCorruptError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DiskCorruptError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _DiskCorruptError_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DiskCorruptError_check')
    .asFunction(isLeaf: true);

/// The application does not have the required write permissions.
@bindings_annotations.WeakInterface('runtime.DiskWriteAccessError')
@bindings_annotations.ContainerData(
    toNative: 'DiskWriteAccessError.getNativePtr',
    toPlatform:
        '(val) => DiskWriteAccessError.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class DiskWriteAccessError extends DiskCorruptError implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_DiskWriteAccessError_free.cast());

  /// @nodoc
  DiskWriteAccessError.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  DiskWriteAccessError.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory DiskWriteAccessError.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DiskWriteAccessError? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _DiskWriteAccessError_check(ptr);
  }

  @internal

  /// @nodoc
  static DiskWriteAccessError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DiskWriteAccessError.fromNativePtr(ptr);
  }
}

final _DiskWriteAccessError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DiskWriteAccessError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _DiskWriteAccessError_check =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_DiskWriteAccessError_check')
        .asFunction(isLeaf: true);
