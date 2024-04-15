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
import 'package:yandex_maps_mapkit_lite/src/runtime/local_error.dart'
    as runtime_local_error;

part 'errors.containers.dart';

/// Cache path doesn't exist or there no read permissions.
@bindings_annotations.WeakInterface('mapkit.offline_cache.CachePathUnavailable')
@bindings_annotations.ContainerData(
    toNative: 'CachePathUnavailable.getNativePtr',
    toPlatform:
        '(val) => CachePathUnavailable.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class CachePathUnavailable extends runtime_local_error.LocalError
    implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_CachePathUnavailable_free.cast());

  /// @nodoc
  CachePathUnavailable.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  CachePathUnavailable.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory CachePathUnavailable.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(CachePathUnavailable? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _CachePathUnavailable_check(ptr);
  }

  @internal

  /// @nodoc
  static CachePathUnavailable? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return CachePathUnavailable.fromNativePtr(ptr);
  }
}

final _CachePathUnavailable_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_offline_cache_CachePathUnavailable_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _CachePathUnavailable_check =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_offline_cache_CachePathUnavailable_check')
        .asFunction(isLeaf: true);
