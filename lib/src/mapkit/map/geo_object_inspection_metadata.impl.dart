part of 'geo_object_inspection_metadata.dart';

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectInspectionMetadataImpl.toPointer',
    toPlatform:
        '(val) => GeoObjectInspectionMetadataImpl.fromPointer(val, needFree: false)',
    platformType: 'GeoObjectInspectionMetadata')
final class GeoObjectInspectionMetadataImpl
    implements GeoObjectInspectionMetadata {
  GeoObjectInspectionMetadataImpl(
      core.String layerId, GeoObjectInspectionMetadataObjectType objectType)
      : this.fromNativePtr(_GeoObjectInspectionMetadata_init(
            to_native.toNativeString(layerId),
            GeoObjectInspectionMetadataObjectTypeImpl.toInt(objectType)));

  @core.override
  late final layerId = to_platform
      .toPlatformString(_GeoObjectInspectionMetadata_get_layerId(_ptr));
  @core.override
  late final objectType = GeoObjectInspectionMetadataObjectTypeImpl.fromInt(
      _GeoObjectInspectionMetadata_get_objectType(_ptr));

  @core.override
  final _GeoObjectInspectionMetadataFactory runtimeFactory =
      const _GeoObjectInspectionMetadataFactory();

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_GeoObjectInspectionMetadata_free.cast());

  GeoObjectInspectionMetadataImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectInspectionMetadata? obj) {
    return (obj as GeoObjectInspectionMetadataImpl?)?._ptr ?? ffi.nullptr;
  }

  static GeoObjectInspectionMetadata? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr
        ? null
        : GeoObjectInspectionMetadataImpl.fromNativePtr(ptr);
  }

  static GeoObjectInspectionMetadata? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = GeoObjectInspectionMetadataImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(GeoObjectInspectionMetadata? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _GeoObjectInspectionMetadata_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

class _GeoObjectInspectionMetadataFactory
    extends struct_factory.StructFactory<GeoObjectInspectionMetadata> {
  const _GeoObjectInspectionMetadataFactory();

  @core.override
  GeoObjectInspectionMetadata create(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectInspectionMetadataImpl.fromNativePtr(ptr);
  }

  @core.override
  GeoObjectInspectionMetadata fromParent(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectInspectionMetadataImpl.fromNativePtr(
        _GeoObjectInspectionMetadata_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(GeoObjectInspectionMetadata obj) {
    return _GeoObjectInspectionMetadata_upcast(
        GeoObjectInspectionMetadataImpl.getNativePtr(obj));
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
    toNative: 'GeoObjectInspectionMetadataObjectTypeImpl.toPointer',
    toPlatform:
        '(val) => GeoObjectInspectionMetadataObjectTypeImpl.fromPointer(val, needFree: false)',
    platformType: 'GeoObjectInspectionMetadataObjectType')
extension GeoObjectInspectionMetadataObjectTypeImpl
    on GeoObjectInspectionMetadataObjectType {
  static core.int toInt(GeoObjectInspectionMetadataObjectType e) {
    return e.index;
  }

  static GeoObjectInspectionMetadataObjectType fromInt(core.int val) {
    return GeoObjectInspectionMetadataObjectType.values[val];
  }

  static GeoObjectInspectionMetadataObjectType? fromPointer(
      ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(
      GeoObjectInspectionMetadataObjectType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
