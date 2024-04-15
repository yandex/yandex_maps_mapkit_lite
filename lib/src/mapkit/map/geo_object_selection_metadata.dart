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

part 'geo_object_selection_metadata.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectSelectionMetadata.toPointer',
    toPlatform:
        '(val) => GeoObjectSelectionMetadata.fromPointer(val, needFree: false)')
class GeoObjectSelectionMetadata extends mapkit_base_metadata.BaseMetadata
    implements ffi.Finalizable {
  late final objectId = to_platform
      .toPlatformString(_GeoObjectSelectionMetadata_get_objectId(_ptr));
  late final dataSourceName = to_platform
      .toPlatformString(_GeoObjectSelectionMetadata_get_dataSourceName(_ptr));
  late final layerId = to_platform
      .toPlatformString(_GeoObjectSelectionMetadata_get_layerId(_ptr));
  late final groupId = to_platform.toPlatformFromPointerInt64(
      _GeoObjectSelectionMetadata_get_groupId(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_GeoObjectSelectionMetadata_free.cast());

  GeoObjectSelectionMetadata(core.String objectId, core.String dataSourceName,
      core.String layerId, core.int? groupId)
      : this.fromNativePtr(_GeoObjectSelectionMetadata_init(
            to_native.toNativeString(objectId),
            to_native.toNativeString(dataSourceName),
            to_native.toNativeString(layerId),
            to_native.toNativePtrInt64(groupId)));

  /// @nodoc
  @internal
  GeoObjectSelectionMetadata.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectSelectionMetadata? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static GeoObjectSelectionMetadata? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return GeoObjectSelectionMetadata.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static GeoObjectSelectionMetadata? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = GeoObjectSelectionMetadata.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(GeoObjectSelectionMetadata? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _GeoObjectSelectionMetadata_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }

  static _GeoObjectSelectionMetadataFactory get factory =>
      const _GeoObjectSelectionMetadataFactory();

  /// @nodoc
  @core.override
  _GeoObjectSelectionMetadataFactory get runtimeFactory =>
      const _GeoObjectSelectionMetadataFactory();
}

/// @nodoc
class _GeoObjectSelectionMetadataFactory
    extends struct_factory.StructFactory<GeoObjectSelectionMetadata> {
  const _GeoObjectSelectionMetadataFactory();

  @core.override
  GeoObjectSelectionMetadata create(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectSelectionMetadata.fromNativePtr(ptr);
  }

  @core.override
  GeoObjectSelectionMetadata fromParent(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectSelectionMetadata.fromNativePtr(
        _GeoObjectSelectionMetadata_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(GeoObjectSelectionMetadata obj) {
    return _GeoObjectSelectionMetadata_upcast(
        GeoObjectSelectionMetadata.getNativePtr(obj));
  }

  @core.override
  native_types.NativeString typeName() {
    return _GeoObjectSelectionMetadata_name();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectSelectionMetadata_downcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectSelectionMetadata_downcast')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectSelectionMetadata_upcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectSelectionMetadata_upcast')
        .asFunction(isLeaf: true);

final native_types.NativeString Function() _GeoObjectSelectionMetadata_name =
    lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_GeoObjectSelectionMetadata_name')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectSelectionMetadata_clone = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectSelectionMetadata_clone')
        .asFunction(isLeaf: true);

final _GeoObjectSelectionMetadata_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_map_GeoObjectSelectionMetadata_free');

final ffi.Pointer<ffi.Void> Function(
        native_types.NativeString,
        native_types.NativeString,
        native_types.NativeString,
        ffi.Pointer<ffi.Void>) _GeoObjectSelectionMetadata_init =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        native_types.NativeString,
                        native_types.NativeString,
                        native_types.NativeString,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectSelectionMetadata_init')
        .asFunction(isLeaf: true);

final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _GeoObjectSelectionMetadata_get_objectId = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectSelectionMetadata_get_objectId')
        .asFunction(isLeaf: true);
final native_types.NativeString Function(
    ffi
        .Pointer<ffi.Void>) _GeoObjectSelectionMetadata_get_dataSourceName = lib
    .library
    .lookup<
            ffi.NativeFunction<
                native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_GeoObjectSelectionMetadata_get_dataSourceName')
    .asFunction(isLeaf: true);
final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _GeoObjectSelectionMetadata_get_layerId = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectSelectionMetadata_get_layerId')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectSelectionMetadata_get_groupId = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectSelectionMetadata_get_groupId')
        .asFunction(isLeaf: true);
