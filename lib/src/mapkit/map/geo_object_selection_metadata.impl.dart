part of 'geo_object_selection_metadata.dart';

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectSelectionMetadataImpl.getNativePtr',
    toPlatform:
        '(val) => GeoObjectSelectionMetadataImpl.fromPointer(val, needFree: false)',
    platformType: 'GeoObjectSelectionMetadata')
final class GeoObjectSelectionMetadataImpl
    implements GeoObjectSelectionMetadata {
  GeoObjectSelectionMetadataImpl(core.String objectId,
      core.String dataSourceName, core.String layerId, core.int? groupId)
      : this.fromNativePtr(_GeoObjectSelectionMetadata_init(
            to_native.toNativeString(objectId),
            to_native.toNativeString(dataSourceName),
            to_native.toNativeString(layerId),
            to_native.toNativePtrInt64(groupId)));

  @core.override
  late final objectId = to_platform
      .toPlatformString(_GeoObjectSelectionMetadata_get_objectId(_ptr));
  @core.override
  late final dataSourceName = to_platform
      .toPlatformString(_GeoObjectSelectionMetadata_get_dataSourceName(_ptr));
  @core.override
  late final layerId = to_platform
      .toPlatformString(_GeoObjectSelectionMetadata_get_layerId(_ptr));
  @core.override
  late final groupId = to_platform.toPlatformFromPointerInt64(
      _GeoObjectSelectionMetadata_get_groupId(_ptr));

  @core.override
  final _GeoObjectSelectionMetadataFactory runtimeFactory =
      const _GeoObjectSelectionMetadataFactory();

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_GeoObjectSelectionMetadata_free.cast());

  GeoObjectSelectionMetadataImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectSelectionMetadata? obj) {
    return (obj as GeoObjectSelectionMetadataImpl?)?._ptr ?? ffi.nullptr;
  }

  static GeoObjectSelectionMetadata? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr
        ? null
        : GeoObjectSelectionMetadataImpl.fromNativePtr(ptr);
  }

  static GeoObjectSelectionMetadata? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = GeoObjectSelectionMetadataImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

class _GeoObjectSelectionMetadataFactory
    extends struct_factory.StructFactory<GeoObjectSelectionMetadata> {
  const _GeoObjectSelectionMetadataFactory();

  @core.override
  GeoObjectSelectionMetadata create(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectSelectionMetadataImpl.fromNativePtr(ptr);
  }

  @core.override
  GeoObjectSelectionMetadata fromParent(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectSelectionMetadataImpl.fromNativePtr(
        _GeoObjectSelectionMetadata_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(GeoObjectSelectionMetadata obj) {
    return _GeoObjectSelectionMetadata_upcast(
        GeoObjectSelectionMetadataImpl.getNativePtr(obj));
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
