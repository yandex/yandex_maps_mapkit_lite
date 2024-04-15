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
import 'package:yandex_maps_mapkit_lite/src/mapkit/base_metadata.dart'
    as mapkit_base_metadata;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geo_object.dart'
    as mapkit_geo_object;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geometry.dart'
    as mapkit_geometry_geometry;

part 'geo_object_collection.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectCollection.toPointer',
    toPlatform:
        '(val) => GeoObjectCollection.fromPointer(val, needFree: false)')
class GeoObjectCollection implements ffi.Finalizable {
  late final boundingBox = mapkit_geometry_geometry.BoundingBox.fromPointer(
      _GeoObjectCollection_get_boundingBox(_ptr));
  late final metadataContainer = to_platform.toPlatformTypeDictionary(
      _GeoObjectCollection_get_metadataContainer(_ptr));
  late final children =
      GeoObjectCollectionItemContainerExtension.toPlatformVector(
          _GeoObjectCollection_get_children(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_GeoObjectCollection_free.cast());

  GeoObjectCollection(
      mapkit_geometry_geometry.BoundingBox? boundingBox,
      type_dictionary.TypeDictionaryBase<mapkit_base_metadata.BaseMetadata>
          metadataContainer,
      core.List<GeoObjectCollectionItem> children)
      : this.fromNativePtr(_GeoObjectCollection_init(
            mapkit_geometry_geometry.BoundingBox.toPointer(boundingBox),
            to_native.toNativeTypeDictionary(metadataContainer),
            GeoObjectCollectionItemContainerExtension.toNativeVector(
                children)));

  /// @nodoc
  @internal
  GeoObjectCollection.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectCollection? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static GeoObjectCollection? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return GeoObjectCollection.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static GeoObjectCollection? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = GeoObjectCollection.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(GeoObjectCollection? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _GeoObjectCollection_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectCollection_clone = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObjectCollection_clone')
        .asFunction(isLeaf: true);

final _GeoObjectCollection_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_GeoObjectCollection_free');

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _GeoObjectCollection_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObjectCollection_init')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectCollection_get_boundingBox = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObjectCollection_get_boundingBox')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectCollection_get_metadataContainer = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObjectCollection_get_metadataContainer')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectCollection_get_children = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObjectCollection_get_children')
        .asFunction(isLeaf: true);

/// @nodoc
@internal
final class GeoObjectCollectionItemNativeData extends ffi.Union {
  external ffi.Pointer<ffi.Void> obj;
  external ffi.Pointer<ffi.Void> collection;
}

/// @nodoc
@internal
final class GeoObjectCollectionItemNative extends ffi.Struct {
  @ffi.Int()
  external core.int tag;
  external GeoObjectCollectionItemNativeData data;
}

/// The geo objects in the collection.
@bindings_annotations.ContainerData(
    toNative: 'GeoObjectCollectionItem.toPointer',
    toPlatform:
        '(val) => GeoObjectCollectionItem.fromPointer(val, needFree: false)')
class GeoObjectCollectionItem {
  const GeoObjectCollectionItem.fromGeoObject(mapkit_geo_object.GeoObject obj)
      : _value = obj;

  const GeoObjectCollectionItem.fromGeoObjectCollection(
      GeoObjectCollection collection)
      : _value = collection;

  /// @nodoc
  @internal
  static GeoObjectCollectionItem toPlatform(GeoObjectCollectionItemNative obj) {
    switch (obj.tag) {
      case 0:
        return GeoObjectCollectionItem.fromGeoObject(
            mapkit_geo_object.GeoObject.fromNativePtr(obj.data.obj));
      case 1:
        return GeoObjectCollectionItem.fromGeoObjectCollection(
            GeoObjectCollection.fromNativePtr(obj.data.collection));
    }
    throw core.TypeError();
  }

  /// @nodoc
  @internal
  static GeoObjectCollectionItemNative toNative(GeoObjectCollectionItem obj) {
    if (obj._value is mapkit_geo_object.GeoObject) {
      return _GeoObjectCollection_ItemNative_GeoObject_init(
          mapkit_geo_object.GeoObject.getNativePtr(obj._value));
    }
    if (obj._value is GeoObjectCollection) {
      return _GeoObjectCollection_ItemNative_GeoObjectCollection_init(
          GeoObjectCollection.getNativePtr(obj._value));
    }
    throw core.TypeError();
  }

  mapkit_geo_object.GeoObject? asGeoObject() {
    if (_value is mapkit_geo_object.GeoObject) {
      return _value;
    }
    return null;
  }

  GeoObjectCollection? asGeoObjectCollection() {
    if (_value is GeoObjectCollection) {
      return _value;
    }
    return null;
  }

  /// Applies the passed function to the variant value.
  void when({
    required void Function(mapkit_geo_object.GeoObject value) onGeoObject,
    required void Function(GeoObjectCollection value) onGeoObjectCollection,
  }) {
    if (_value is mapkit_geo_object.GeoObject) {
      return onGeoObject(_value as mapkit_geo_object.GeoObject);
    }
    if (_value is GeoObjectCollection) {
      return onGeoObjectCollection(_value as GeoObjectCollection);
    }
    assert(false);
  }

  /// @nodoc
  @internal
  static GeoObjectCollectionItem? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = toPlatform(ptr.cast<GeoObjectCollectionItemNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(GeoObjectCollectionItem? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<GeoObjectCollectionItemNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }

  final core.dynamic _value;
}

final GeoObjectCollectionItemNative Function(
    ffi
        .Pointer<ffi.Void>) _GeoObjectCollection_ItemNative_GeoObject_init = lib
    .library
    .lookup<
            ffi.NativeFunction<
                GeoObjectCollectionItemNative Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_GeoObjectCollection_GeoObjectCollectionItem_GeoObject_init')
    .asFunction(isLeaf: true);
final GeoObjectCollectionItemNative Function(
    ffi.Pointer<
        ffi
        .Void>) _GeoObjectCollection_ItemNative_GeoObjectCollection_init = lib
    .library
    .lookup<
            ffi.NativeFunction<
                GeoObjectCollectionItemNative Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_GeoObjectCollection_GeoObjectCollectionItem_GeoObjectCollection_init')
    .asFunction(isLeaf: true);
