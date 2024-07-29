part of 'geo_object_collection.dart';

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectCollectionImpl.getNativePtr',
    toPlatform:
        '(val) => GeoObjectCollectionImpl.fromPointer(val, needFree: false)',
    platformType: 'GeoObjectCollection')
final class GeoObjectCollectionImpl implements GeoObjectCollection {
  GeoObjectCollectionImpl(
      mapkit_geometry_geometry.BoundingBox? boundingBox,
      type_dictionary.TypeDictionaryBase<mapkit_base_metadata.BaseMetadata>
          metadataContainer,
      core.List<GeoObjectCollectionItem> children)
      : this.fromNativePtr(_GeoObjectCollection_init(
            mapkit_geometry_geometry.BoundingBoxImpl.toPointer(boundingBox),
            to_native.toNativeTypeDictionary(metadataContainer),
            GeoObjectCollectionItemContainerExtension.toNativeVector(
                children)));

  @core.override
  late final boundingBox = mapkit_geometry_geometry.BoundingBoxImpl.fromPointer(
      _GeoObjectCollection_get_boundingBox(_ptr));
  @core.override
  late final metadataContainer = to_platform.toPlatformTypeDictionary(
      _GeoObjectCollection_get_metadataContainer(_ptr));
  @core.override
  late final children =
      GeoObjectCollectionItemContainerExtension.toPlatformVector(
          _GeoObjectCollection_get_children(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_GeoObjectCollection_free.cast());

  GeoObjectCollectionImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectCollection? obj) {
    return (obj as GeoObjectCollectionImpl?)?._ptr ?? ffi.nullptr;
  }

  static GeoObjectCollection? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr
        ? null
        : GeoObjectCollectionImpl.fromNativePtr(ptr);
  }

  static GeoObjectCollection? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = GeoObjectCollectionImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

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

final class _GeoObjectCollectionItemNativeData extends ffi.Union {
  external ffi.Pointer<ffi.Void> obj;
  external ffi.Pointer<ffi.Void> collection;
}

final class GeoObjectCollectionItemNative extends ffi.Struct {
  @ffi.Int()
  external core.int tag;
  external _GeoObjectCollectionItemNativeData data;
}

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectCollectionItemImpl.toPointer',
    toPlatform:
        '(val) => GeoObjectCollectionItemImpl.fromPointer(val, needFree: false)',
    platformType: 'GeoObjectCollectionItem')
extension GeoObjectCollectionItemImpl on GeoObjectCollectionItem {
  static GeoObjectCollectionItemNative toNative(GeoObjectCollectionItem obj) {
    if (obj._value is mapkit_geo_object.GeoObject) {
      return _GeoObjectCollection_ItemNative_GeoObject_init(
          mapkit_geo_object.GeoObjectImpl.getNativePtr(obj._value));
    }
    if (obj._value is GeoObjectCollection) {
      return _GeoObjectCollection_ItemNative_GeoObjectCollection_init(
          GeoObjectCollectionImpl.getNativePtr(obj._value));
    }
    throw core.TypeError();
  }

  static GeoObjectCollectionItem toPlatform(GeoObjectCollectionItemNative obj) {
    switch (obj.tag) {
      case 0:
        return GeoObjectCollectionItem.fromGeoObject(
            mapkit_geo_object.GeoObjectImpl.fromNativePtr(obj.data.obj));
      case 1:
        return GeoObjectCollectionItem.fromGeoObjectCollection(
            GeoObjectCollectionImpl.fromNativePtr(obj.data.collection));
    }
    throw core.TypeError();
  }

  static GeoObjectCollectionItem? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = toPlatform(ptr.cast<GeoObjectCollectionItemNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(GeoObjectCollectionItem? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<GeoObjectCollectionItemNative>();
    result.ref = toNative(val);

    return result.cast();
  }
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
