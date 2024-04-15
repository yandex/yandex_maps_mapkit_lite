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

part 'user_data.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'UserData.toPointer',
    toPlatform: '(val) => UserData.fromPointer(val, needFree: false)')
class UserData extends mapkit_base_metadata.BaseMetadata
    implements ffi.Finalizable {
  late final data = to_platform.toMapString(_UserData_get_data(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_UserData_free.cast());

  UserData(core.Map<core.String, core.String> data)
      : this.fromNativePtr(_UserData_init(to_native.toNativeMapString(data)));

  /// @nodoc
  @internal
  UserData.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(UserData? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static UserData? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UserData.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static UserData? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        UserData.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(UserData? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _UserData_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }

  static _UserDataFactory get factory => const _UserDataFactory();

  /// @nodoc
  @core.override
  _UserDataFactory get runtimeFactory => const _UserDataFactory();
}

/// @nodoc
class _UserDataFactory extends struct_factory.StructFactory<UserData> {
  const _UserDataFactory();

  @core.override
  UserData create(ffi.Pointer<ffi.Void> ptr) {
    return UserData.fromNativePtr(ptr);
  }

  @core.override
  UserData fromParent(ffi.Pointer<ffi.Void> ptr) {
    return UserData.fromNativePtr(_UserData_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(UserData obj) {
    return _UserData_upcast(UserData.getNativePtr(obj));
  }

  @core.override
  native_types.NativeString typeName() {
    return _UserData_name();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _UserData_downcast =
    lib
        .library
        .lookup<
                ffi
                .NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_UserData_downcast')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _UserData_upcast =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_UserData_upcast')
        .asFunction(isLeaf: true);

final native_types.NativeString Function() _UserData_name = lib.library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_UserData_name')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _UserData_clone =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_UserData_clone')
        .asFunction(isLeaf: true);

final _UserData_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_map_UserData_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _UserData_init = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_UserData_init')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _UserData_get_data =
    lib
        .library
        .lookup<
                ffi
                .NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_UserData_get_data')
        .asFunction(isLeaf: true);
