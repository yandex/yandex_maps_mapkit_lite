part of 'personalized_poi_metadata.dart';

@bindings_annotations.ContainerData(
    toNative: 'PersonalizedPoiExtraMetadataEntryImpl.getNativePtr',
    toPlatform:
        '(val) => PersonalizedPoiExtraMetadataEntryImpl.fromPointer(val, needFree: false)',
    platformType: 'PersonalizedPoiExtraMetadataEntry')
final class PersonalizedPoiExtraMetadataEntryImpl
    implements PersonalizedPoiExtraMetadataEntry {
  PersonalizedPoiExtraMetadataEntryImpl(core.String? key, core.String? value)
      : this.fromNativePtr(_PersonalizedPoiExtraMetadataEntry_init(
            to_native.toNativePtrString(key),
            to_native.toNativePtrString(value)));

  @core.override
  late final key = to_platform.toPlatformFromPointerString(
      _PersonalizedPoiExtraMetadataEntry_get_key(_ptr));
  @core.override
  late final value = to_platform.toPlatformFromPointerString(
      _PersonalizedPoiExtraMetadataEntry_get_value(_ptr));

  @core.override
  final _PersonalizedPoiExtraMetadataEntryFactory runtimeFactory =
      const _PersonalizedPoiExtraMetadataEntryFactory();

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_PersonalizedPoiExtraMetadataEntry_free.cast());

  PersonalizedPoiExtraMetadataEntryImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(
      PersonalizedPoiExtraMetadataEntry? obj) {
    return (obj as PersonalizedPoiExtraMetadataEntryImpl?)?._ptr ?? ffi.nullptr;
  }

  static PersonalizedPoiExtraMetadataEntry? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr
        ? null
        : PersonalizedPoiExtraMetadataEntryImpl.fromNativePtr(ptr);
  }

  static PersonalizedPoiExtraMetadataEntry? fromPointer(
      ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = PersonalizedPoiExtraMetadataEntryImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

class _PersonalizedPoiExtraMetadataEntryFactory
    extends struct_factory.StructFactory<PersonalizedPoiExtraMetadataEntry> {
  const _PersonalizedPoiExtraMetadataEntryFactory();

  @core.override
  PersonalizedPoiExtraMetadataEntry create(ffi.Pointer<ffi.Void> ptr) {
    return PersonalizedPoiExtraMetadataEntryImpl.fromNativePtr(ptr);
  }

  @core.override
  PersonalizedPoiExtraMetadataEntry fromParent(ffi.Pointer<ffi.Void> ptr) {
    return PersonalizedPoiExtraMetadataEntryImpl.fromNativePtr(
        _PersonalizedPoiExtraMetadataEntry_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(PersonalizedPoiExtraMetadataEntry obj) {
    return _PersonalizedPoiExtraMetadataEntry_upcast(
        PersonalizedPoiExtraMetadataEntryImpl.getNativePtr(obj));
  }

  @core.override
  native_types.NativeString typeName() {
    return _PersonalizedPoiExtraMetadataEntry_name();
  }
}

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PersonalizedPoiExtraMetadataEntry_downcast = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadataEntry_downcast')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PersonalizedPoiExtraMetadataEntry_upcast = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadataEntry_upcast')
    .asFunction(isLeaf: true);

final native_types.NativeString Function()
    _PersonalizedPoiExtraMetadataEntry_name = lib.library
        .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
            'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadataEntry_name')
        .asFunction(isLeaf: true);

final _PersonalizedPoiExtraMetadataEntry_free = lib.library.lookup<
        ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
    'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadataEntry_free');

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _PersonalizedPoiExtraMetadataEntry_init = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadataEntry_init')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PersonalizedPoiExtraMetadataEntry_get_key = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadataEntry_get_key')
    .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PersonalizedPoiExtraMetadataEntry_get_value = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadataEntry_get_value')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'PersonalizedPoiExtraMetadataImpl.getNativePtr',
    toPlatform:
        '(val) => PersonalizedPoiExtraMetadataImpl.fromPointer(val, needFree: false)',
    platformType: 'PersonalizedPoiExtraMetadata')
final class PersonalizedPoiExtraMetadataImpl
    implements PersonalizedPoiExtraMetadata {
  PersonalizedPoiExtraMetadataImpl(
      core.List<PersonalizedPoiExtraMetadataEntry> data)
      : this.fromNativePtr(_PersonalizedPoiExtraMetadata_init(
            PersonalizedPoiExtraMetadataEntryContainerExtension.toNativeVector(
                data)));

  @core.override
  late final data =
      PersonalizedPoiExtraMetadataEntryContainerExtension.toPlatformVector(
          _PersonalizedPoiExtraMetadata_get_data(_ptr));

  @core.override
  final _PersonalizedPoiExtraMetadataFactory runtimeFactory =
      const _PersonalizedPoiExtraMetadataFactory();

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_PersonalizedPoiExtraMetadata_free.cast());

  PersonalizedPoiExtraMetadataImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(PersonalizedPoiExtraMetadata? obj) {
    return (obj as PersonalizedPoiExtraMetadataImpl?)?._ptr ?? ffi.nullptr;
  }

  static PersonalizedPoiExtraMetadata? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr
        ? null
        : PersonalizedPoiExtraMetadataImpl.fromNativePtr(ptr);
  }

  static PersonalizedPoiExtraMetadata? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = PersonalizedPoiExtraMetadataImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

class _PersonalizedPoiExtraMetadataFactory
    extends struct_factory.StructFactory<PersonalizedPoiExtraMetadata> {
  const _PersonalizedPoiExtraMetadataFactory();

  @core.override
  PersonalizedPoiExtraMetadata create(ffi.Pointer<ffi.Void> ptr) {
    return PersonalizedPoiExtraMetadataImpl.fromNativePtr(ptr);
  }

  @core.override
  PersonalizedPoiExtraMetadata fromParent(ffi.Pointer<ffi.Void> ptr) {
    return PersonalizedPoiExtraMetadataImpl.fromNativePtr(
        _PersonalizedPoiExtraMetadata_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(PersonalizedPoiExtraMetadata obj) {
    return _PersonalizedPoiExtraMetadata_upcast(
        PersonalizedPoiExtraMetadataImpl.getNativePtr(obj));
  }

  @core.override
  native_types.NativeString typeName() {
    return _PersonalizedPoiExtraMetadata_name();
  }
}

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PersonalizedPoiExtraMetadata_downcast = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadata_downcast')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PersonalizedPoiExtraMetadata_upcast = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadata_upcast')
    .asFunction(isLeaf: true);

final native_types.NativeString Function() _PersonalizedPoiExtraMetadata_name = lib
    .library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadata_name')
    .asFunction(isLeaf: true);

final _PersonalizedPoiExtraMetadata_free = lib.library.lookup<
        ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
    'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadata_free');

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PersonalizedPoiExtraMetadata_init = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadata_init')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PersonalizedPoiExtraMetadata_get_data = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadata_get_data')
    .asFunction(isLeaf: true);
