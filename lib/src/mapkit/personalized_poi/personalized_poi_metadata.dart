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

part 'personalized_poi_metadata.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'PersonalizedPoiExtraMetadataEntry.toPointer',
    toPlatform:
        '(val) => PersonalizedPoiExtraMetadataEntry.fromPointer(val, needFree: false)')
class PersonalizedPoiExtraMetadataEntry
    extends mapkit_base_metadata.BaseMetadata implements ffi.Finalizable {
  late final key = to_platform.toPlatformFromPointerString(
      _PersonalizedPoiExtraMetadataEntry_get_key(_ptr));
  late final value = to_platform.toPlatformFromPointerString(
      _PersonalizedPoiExtraMetadataEntry_get_value(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_PersonalizedPoiExtraMetadataEntry_free.cast());

  PersonalizedPoiExtraMetadataEntry(core.String? key, core.String? value)
      : this.fromNativePtr(_PersonalizedPoiExtraMetadataEntry_init(
            to_native.toNativePtrString(key),
            to_native.toNativePtrString(value)));

  /// @nodoc
  @internal
  PersonalizedPoiExtraMetadataEntry.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(
      PersonalizedPoiExtraMetadataEntry? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static PersonalizedPoiExtraMetadataEntry? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PersonalizedPoiExtraMetadataEntry.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static PersonalizedPoiExtraMetadataEntry? fromPointer(
      ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = PersonalizedPoiExtraMetadataEntry.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(
      PersonalizedPoiExtraMetadataEntry? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _PersonalizedPoiExtraMetadataEntry_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }

  static _PersonalizedPoiExtraMetadataEntryFactory get factory =>
      const _PersonalizedPoiExtraMetadataEntryFactory();

  /// @nodoc
  @core.override
  _PersonalizedPoiExtraMetadataEntryFactory get runtimeFactory =>
      const _PersonalizedPoiExtraMetadataEntryFactory();
}

/// @nodoc
class _PersonalizedPoiExtraMetadataEntryFactory
    extends struct_factory.StructFactory<PersonalizedPoiExtraMetadataEntry> {
  const _PersonalizedPoiExtraMetadataEntryFactory();

  @core.override
  PersonalizedPoiExtraMetadataEntry create(ffi.Pointer<ffi.Void> ptr) {
    return PersonalizedPoiExtraMetadataEntry.fromNativePtr(ptr);
  }

  @core.override
  PersonalizedPoiExtraMetadataEntry fromParent(ffi.Pointer<ffi.Void> ptr) {
    return PersonalizedPoiExtraMetadataEntry.fromNativePtr(
        _PersonalizedPoiExtraMetadataEntry_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(PersonalizedPoiExtraMetadataEntry obj) {
    return _PersonalizedPoiExtraMetadataEntry_upcast(
        PersonalizedPoiExtraMetadataEntry.getNativePtr(obj));
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

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PersonalizedPoiExtraMetadataEntry_clone = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadataEntry_clone')
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
    toNative: 'PersonalizedPoiExtraMetadata.toPointer',
    toPlatform:
        '(val) => PersonalizedPoiExtraMetadata.fromPointer(val, needFree: false)')
class PersonalizedPoiExtraMetadata extends mapkit_base_metadata.BaseMetadata
    implements ffi.Finalizable {
  late final data =
      PersonalizedPoiExtraMetadataEntryContainerExtension.toPlatformVector(
          _PersonalizedPoiExtraMetadata_get_data(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_PersonalizedPoiExtraMetadata_free.cast());

  PersonalizedPoiExtraMetadata(
      core.List<PersonalizedPoiExtraMetadataEntry> data)
      : this.fromNativePtr(_PersonalizedPoiExtraMetadata_init(
            PersonalizedPoiExtraMetadataEntryContainerExtension.toNativeVector(
                data)));

  /// @nodoc
  @internal
  PersonalizedPoiExtraMetadata.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(PersonalizedPoiExtraMetadata? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static PersonalizedPoiExtraMetadata? fromOptionalPtr(
      ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PersonalizedPoiExtraMetadata.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static PersonalizedPoiExtraMetadata? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = PersonalizedPoiExtraMetadata.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(PersonalizedPoiExtraMetadata? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _PersonalizedPoiExtraMetadata_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }

  static _PersonalizedPoiExtraMetadataFactory get factory =>
      const _PersonalizedPoiExtraMetadataFactory();

  /// @nodoc
  @core.override
  _PersonalizedPoiExtraMetadataFactory get runtimeFactory =>
      const _PersonalizedPoiExtraMetadataFactory();
}

/// @nodoc
class _PersonalizedPoiExtraMetadataFactory
    extends struct_factory.StructFactory<PersonalizedPoiExtraMetadata> {
  const _PersonalizedPoiExtraMetadataFactory();

  @core.override
  PersonalizedPoiExtraMetadata create(ffi.Pointer<ffi.Void> ptr) {
    return PersonalizedPoiExtraMetadata.fromNativePtr(ptr);
  }

  @core.override
  PersonalizedPoiExtraMetadata fromParent(ffi.Pointer<ffi.Void> ptr) {
    return PersonalizedPoiExtraMetadata.fromNativePtr(
        _PersonalizedPoiExtraMetadata_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(PersonalizedPoiExtraMetadata obj) {
    return _PersonalizedPoiExtraMetadata_upcast(
        PersonalizedPoiExtraMetadata.getNativePtr(obj));
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

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _PersonalizedPoiExtraMetadata_clone = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_personalized_poi_PersonalizedPoiExtraMetadata_clone')
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
