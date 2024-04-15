import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/version.dart'
    as mapkit_version;

part 'raw_tile.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'RawTile.toPointer',
    toPlatform: '(val) => RawTile.fromPointer(val, needFree: false)')
class RawTile implements ffi.Finalizable {
  late final version =
      mapkit_version.Version.fromNative(_RawTile_get_version(_ptr));
  late final features = to_platform.toMapString(_RawTile_get_features(_ptr));
  late final etag = to_platform.toPlatformString(_RawTile_get_etag(_ptr));
  late final useCache = RawTileUseCache.fromInt(_RawTile_get_useCache(_ptr));
  late final state = RawTileState.fromInt(_RawTile_get_state(_ptr));
  late final rawData = to_platform.toPlatformBytes(_RawTile_get_rawData(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_RawTile_free.cast());

  RawTile(
      mapkit_version.Version version,
      core.Map<core.String, core.String> features,
      core.String etag,
      RawTileUseCache useCache,
      RawTileState state,
      typed_data.ByteBuffer rawData)
      : this.fromNativePtr(_RawTile_init(
            mapkit_version.Version.toNative(version),
            to_native.toNativeMapString(features),
            to_native.toNativeString(etag),
            RawTileUseCache.toInt(useCache),
            RawTileState.toInt(state),
            to_native.toNativeBytes(rawData)));

  /// @nodoc
  @internal
  RawTile.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(RawTile? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static RawTile? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return RawTile.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static RawTile? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        RawTile.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(RawTile? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _RawTile_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _RawTile_clone = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Pointer<ffi.Void> Function(
                ffi.Pointer<ffi.Void>)>>('yandex_flutter_mapkit_RawTile_clone')
    .asFunction(isLeaf: true);

final _RawTile_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_RawTile_free');

final ffi.Pointer<ffi.Void> Function(
        mapkit_version.VersionNative,
        ffi.Pointer<ffi.Void>,
        native_types.NativeString,
        core.int,
        core.int,
        native_types.NativeBytes) _RawTile_init =
    lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    mapkit_version.VersionNative,
                    ffi.Pointer<ffi.Void>,
                    native_types.NativeString,
                    ffi.Int64,
                    ffi.Int64,
                    native_types
                        .NativeBytes)>>('yandex_flutter_mapkit_RawTile_init')
        .asFunction(isLeaf: true);

final mapkit_version.VersionNative Function(ffi.Pointer<ffi.Void>)
    _RawTile_get_version = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_version.VersionNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RawTile_get_version')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _RawTile_get_features = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RawTile_get_features')
        .asFunction(isLeaf: true);
final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _RawTile_get_etag = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RawTile_get_etag')
        .asFunction(isLeaf: true);
final core.int Function(ffi.Pointer<ffi.Void>) _RawTile_get_useCache = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_RawTile_get_useCache')
    .asFunction(isLeaf: true);
final core.int Function(ffi.Pointer<ffi.Void>) _RawTile_get_state = lib.library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_RawTile_get_state')
    .asFunction(isLeaf: true);
final native_types.NativeBytes Function(ffi.Pointer<ffi.Void>)
    _RawTile_get_rawData = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeBytes Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_RawTile_get_rawData')
        .asFunction(isLeaf: true);

/// Available tile states.
@bindings_annotations.ContainerData(
    toNative: 'RawTileState.toPointer',
    toPlatform: '(val) => RawTileState.fromPointer(val, needFree: false)')
enum RawTileState {
  /// Tile is available.
  Ok,

  /// Tile was not modified.
  NotModified,

  /// An error occurred when processing the tile.
  Error,
  ;

  /// @nodoc
  @internal
  static RawTileState fromInt(core.int val) {
    return RawTileState.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(RawTileState e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static RawTileState? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(RawTileState? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'RawTileUseCache.toPointer',
    toPlatform: '(val) => RawTileUseCache.fromPointer(val, needFree: false)')
enum RawTileUseCache {
  Yes,
  No,
  ;

  /// @nodoc
  @internal
  static RawTileUseCache fromInt(core.int val) {
    return RawTileUseCache.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(RawTileUseCache e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static RawTileUseCache? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(RawTileUseCache? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
