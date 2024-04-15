import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/type_dictionary.dart'
    as type_dictionary;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/attribution.dart'
    as mapkit_attribution;
import 'package:yandex_maps_mapkit_lite/src/mapkit/base_metadata.dart'
    as mapkit_base_metadata;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;

part 'geo_object.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'GeoObject.toPointer',
    toPlatform: '(val) => GeoObject.fromPointer(val, needFree: false)')
class GeoObject implements ffi.Finalizable {
  late final name =
      to_platform.toPlatformFromPointerString(_GeoObject_get_name(_ptr));
  late final descriptionText = to_platform
      .toPlatformFromPointerString(_GeoObject_get_descriptionText(_ptr));
  late final geometry =
      mapkit_geometry_geometry.GeometryContainerExtension.toPlatformVector(
          _GeoObject_get_geometry(_ptr));
  late final boundingBox = mapkit_geometry_geometry.BoundingBox.fromPointer(
      _GeoObject_get_boundingBox(_ptr));
  late final attributionMap =
      mapkit_attribution.AttributionContainerExtension.toPlatformMap(
          _GeoObject_get_attributionMap(_ptr));
  late final metadataContainer = to_platform
      .toPlatformTypeDictionary(_GeoObject_get_metadataContainer(_ptr));
  late final aref = to_platform.toVectorString(_GeoObject_get_aref(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_GeoObject_free.cast());

  GeoObject(
      core.String? name,
      core.String? descriptionText,
      core.List<mapkit_geometry_geometry.Geometry> geometry,
      mapkit_geometry_geometry.BoundingBox? boundingBox,
      core.Map<core.String, mapkit_attribution.Attribution> attributionMap,
      type_dictionary.TypeDictionaryBase<mapkit_base_metadata.BaseMetadata>
          metadataContainer,
      core.List<core.String> aref)
      : this.fromNativePtr(_GeoObject_init(
            to_native.toNativePtrString(name),
            to_native.toNativePtrString(descriptionText),
            mapkit_geometry_geometry.GeometryContainerExtension.toNativeVector(
                geometry),
            mapkit_geometry_geometry.BoundingBox.toPointer(boundingBox),
            mapkit_attribution.AttributionContainerExtension.toNativeMap(
                attributionMap),
            to_native.toNativeTypeDictionary(metadataContainer),
            to_native.toNativeVectorString(aref)));

  /// @nodoc
  @internal
  GeoObject.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(GeoObject? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static GeoObject? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return GeoObject.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static GeoObject? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        GeoObject.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(GeoObject? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _GeoObject_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _GeoObject_clone =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_clone')
        .asFunction(isLeaf: true);

final _GeoObject_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_GeoObject_free');

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _GeoObject_init = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Pointer<ffi.Void> Function(
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>)>>('yandex_flutter_mapkit_GeoObject_init')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_name = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_name')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_descriptionText = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_descriptionText')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_geometry')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_boundingBox = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_boundingBox')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_attributionMap = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_attributionMap')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_metadataContainer = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_metadataContainer')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_aref = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_aref')
        .asFunction(isLeaf: true);
