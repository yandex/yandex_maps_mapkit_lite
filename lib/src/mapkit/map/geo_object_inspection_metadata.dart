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

part 'geo_object_inspection_metadata.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectInspectionMetadata.toPointer',
    toPlatform:
        '(val) => GeoObjectInspectionMetadata.fromPointer(val, needFree: false)')
class GeoObjectInspectionMetadata extends mapkit_base_metadata.BaseMetadata
    implements ffi.Finalizable {
  late final layerId = to_platform
      .toPlatformString(_GeoObjectInspectionMetadata_get_layerId(_ptr));
  late final objectType = GeoObjectInspectionMetadataObjectType.fromInt(
      _GeoObjectInspectionMetadata_get_objectType(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_GeoObjectInspectionMetadata_free.cast());

  GeoObjectInspectionMetadata(
      core.String layerId, GeoObjectInspectionMetadataObjectType objectType)
      : this.fromNativePtr(_GeoObjectInspectionMetadata_init(
            to_native.toNativeString(layerId),
            GeoObjectInspectionMetadataObjectType.toInt(objectType)));

  /// @nodoc
  @internal
  GeoObjectInspectionMetadata.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectInspectionMetadata? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static GeoObjectInspectionMetadata? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return GeoObjectInspectionMetadata.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static GeoObjectInspectionMetadata? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = GeoObjectInspectionMetadata.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(GeoObjectInspectionMetadata? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _GeoObjectInspectionMetadata_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }

  static _GeoObjectInspectionMetadataFactory get factory =>
      const _GeoObjectInspectionMetadataFactory();

  /// @nodoc
  @core.override
  _GeoObjectInspectionMetadataFactory get runtimeFactory =>
      const _GeoObjectInspectionMetadataFactory();
}

/// @nodoc
class _GeoObjectInspectionMetadataFactory
    extends struct_factory.StructFactory<GeoObjectInspectionMetadata> {
  const _GeoObjectInspectionMetadataFactory();

  @core.override
  GeoObjectInspectionMetadata create(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectInspectionMetadata.fromNativePtr(ptr);
  }

  @core.override
  GeoObjectInspectionMetadata fromParent(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectInspectionMetadata.fromNativePtr(
        _GeoObjectInspectionMetadata_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(GeoObjectInspectionMetadata obj) {
    return _GeoObjectInspectionMetadata_upcast(
        GeoObjectInspectionMetadata.getNativePtr(obj));
  }

  @core.override
  native_types.NativeString typeName() {
    return _GeoObjectInspectionMetadata_name();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectInspectionMetadata_downcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectInspectionMetadata_downcast')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectInspectionMetadata_upcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectInspectionMetadata_upcast')
        .asFunction(isLeaf: true);

final native_types.NativeString Function() _GeoObjectInspectionMetadata_name =
    lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_map_GeoObjectInspectionMetadata_name')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectInspectionMetadata_clone = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectInspectionMetadata_clone')
        .asFunction(isLeaf: true);

final _GeoObjectInspectionMetadata_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_map_GeoObjectInspectionMetadata_free');

final ffi.Pointer<ffi.Void> Function(native_types.NativeString, core.int)
    _GeoObjectInspectionMetadata_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        native_types.NativeString, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_GeoObjectInspectionMetadata_init')
        .asFunction(isLeaf: true);

final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _GeoObjectInspectionMetadata_get_layerId = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectInspectionMetadata_get_layerId')
        .asFunction(isLeaf: true);
final core.int Function(
    ffi
        .Pointer<ffi.Void>) _GeoObjectInspectionMetadata_get_objectType = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_GeoObjectInspectionMetadata_get_objectType')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectInspectionMetadataObjectType.toPointer',
    toPlatform:
        '(val) => GeoObjectInspectionMetadataObjectType.fromPointer(val, needFree: false)')
enum GeoObjectInspectionMetadataObjectType {
  Point,
  Polyline,
  Polygon,
  Circle,
  ;

  /// @nodoc
  @internal
  static GeoObjectInspectionMetadataObjectType fromInt(core.int val) {
    return GeoObjectInspectionMetadataObjectType.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(GeoObjectInspectionMetadataObjectType e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static GeoObjectInspectionMetadataObjectType? fromPointer(
      ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(
      GeoObjectInspectionMetadataObjectType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
