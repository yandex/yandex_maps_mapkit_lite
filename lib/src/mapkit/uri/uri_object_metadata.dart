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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/struct_factory.dart'
    as struct_factory;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/base_metadata.dart'
    as mapkit_base_metadata;

part 'uri_object_metadata.containers.dart';

/// @nodoc
final class UriNative extends ffi.Struct {
  external native_types.NativeString value;
}

final UriNative Function(native_types.NativeString) _UriNativeInit = lib.library
    .lookup<ffi.NativeFunction<UriNative Function(native_types.NativeString)>>(
        'yandex_flutter_mapkit_uri_Uri_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Uri.toPointer',
    toPlatform: '(val) => Uri.fromPointer(val, needFree: false)')
class Uri {
  final core.String value;

  const Uri({
    required this.value,
  });

  /// @nodoc
  @internal
  Uri.fromNative(UriNative native)
      : this(value: to_platform.toPlatformString(native.value));

  /// @nodoc
  @internal
  static UriNative toNative(Uri c) {
    return _UriNativeInit(to_native.toNativeString(c.value));
  }

  /// @nodoc
  @internal
  static Uri? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Uri.fromNative(ptr.cast<UriNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Uri? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<UriNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'UriObjectMetadata.toPointer',
    toPlatform: '(val) => UriObjectMetadata.fromPointer(val, needFree: false)')
class UriObjectMetadata extends mapkit_base_metadata.BaseMetadata
    implements ffi.Finalizable {
  late final uris =
      UriContainerExtension.toPlatformVector(_UriObjectMetadata_get_uris(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_UriObjectMetadata_free.cast());

  UriObjectMetadata(core.List<Uri> uris)
      : this.fromNativePtr(_UriObjectMetadata_init(
            UriContainerExtension.toNativeVector(uris)));

  /// @nodoc
  @internal
  UriObjectMetadata.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(UriObjectMetadata? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static UriObjectMetadata? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UriObjectMetadata.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static UriObjectMetadata? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = UriObjectMetadata.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(UriObjectMetadata? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _UriObjectMetadata_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }

  static _UriObjectMetadataFactory get factory =>
      const _UriObjectMetadataFactory();

  /// @nodoc
  @core.override
  _UriObjectMetadataFactory get runtimeFactory =>
      const _UriObjectMetadataFactory();
}

/// @nodoc
class _UriObjectMetadataFactory
    extends struct_factory.StructFactory<UriObjectMetadata> {
  const _UriObjectMetadataFactory();

  @core.override
  UriObjectMetadata create(ffi.Pointer<ffi.Void> ptr) {
    return UriObjectMetadata.fromNativePtr(ptr);
  }

  @core.override
  UriObjectMetadata fromParent(ffi.Pointer<ffi.Void> ptr) {
    return UriObjectMetadata.fromNativePtr(_UriObjectMetadata_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(UriObjectMetadata obj) {
    return _UriObjectMetadata_upcast(UriObjectMetadata.getNativePtr(obj));
  }

  @core.override
  native_types.NativeString typeName() {
    return _UriObjectMetadata_name();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _UriObjectMetadata_downcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_uri_UriObjectMetadata_downcast')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _UriObjectMetadata_upcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_uri_UriObjectMetadata_upcast')
        .asFunction(isLeaf: true);

final native_types.NativeString Function() _UriObjectMetadata_name = lib.library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_uri_UriObjectMetadata_name')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _UriObjectMetadata_clone = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_uri_UriObjectMetadata_clone')
        .asFunction(isLeaf: true);

final _UriObjectMetadata_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_uri_UriObjectMetadata_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _UriObjectMetadata_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_uri_UriObjectMetadata_init')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _UriObjectMetadata_get_uris = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_uri_UriObjectMetadata_get_uris')
        .asFunction(isLeaf: true);
