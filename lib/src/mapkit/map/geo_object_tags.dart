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

part 'geo_object_tags.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectTags.toPointer',
    toPlatform: '(val) => GeoObjectTags.fromPointer(val, needFree: false)')
class GeoObjectTags extends mapkit_base_metadata.BaseMetadata
    implements ffi.Finalizable {
  late final tags = to_platform.toVectorString(_GeoObjectTags_get_tags(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_GeoObjectTags_free.cast());

  GeoObjectTags(core.List<core.String> tags)
      : this.fromNativePtr(
            _GeoObjectTags_init(to_native.toNativeVectorString(tags)));

  /// @nodoc
  @internal
  GeoObjectTags.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectTags? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static GeoObjectTags? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return GeoObjectTags.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static GeoObjectTags? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        GeoObjectTags.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(GeoObjectTags? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _GeoObjectTags_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }

  static _GeoObjectTagsFactory get factory => const _GeoObjectTagsFactory();

  /// @nodoc
  @core.override
  _GeoObjectTagsFactory get runtimeFactory => const _GeoObjectTagsFactory();
}

/// @nodoc
class _GeoObjectTagsFactory
    extends struct_factory.StructFactory<GeoObjectTags> {
  const _GeoObjectTagsFactory();

  @core.override
  GeoObjectTags create(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectTags.fromNativePtr(ptr);
  }

  @core.override
  GeoObjectTags fromParent(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectTags.fromNativePtr(_GeoObjectTags_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(GeoObjectTags obj) {
    return _GeoObjectTags_upcast(GeoObjectTags.getNativePtr(obj));
  }

  @core.override
  native_types.NativeString typeName() {
    return _GeoObjectTags_name();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectTags_downcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectTags_downcast')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectTags_upcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectTags_upcast')
        .asFunction(isLeaf: true);

final native_types.NativeString Function() _GeoObjectTags_name = lib.library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_GeoObjectTags_name')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectTags_clone = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectTags_clone')
        .asFunction(isLeaf: true);

final _GeoObjectTags_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_map_GeoObjectTags_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectTags_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectTags_init')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectTags_get_tags = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectTags_get_tags')
        .asFunction(isLeaf: true);
