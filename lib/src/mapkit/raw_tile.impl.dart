part of 'raw_tile.dart';

@bindings_annotations.ContainerData(
    toNative: 'RawTileImpl.getNativePtr',
    toPlatform: '(val) => RawTileImpl.fromPointer(val, needFree: false)',
    platformType: 'RawTile')
final class RawTileImpl implements RawTile {
  RawTileImpl(
      mapkit_version.Version version,
      core.Map<core.String, core.String> features,
      core.String etag,
      RawTileUseCache useCache,
      RawTileState state,
      typed_data.ByteBuffer rawData)
      : this.fromNativePtr(_RawTile_init(
            mapkit_version.VersionImpl.toNative(version),
            to_native.toNativeMapString(features),
            to_native.toNativeString(etag),
            RawTileUseCacheImpl.toInt(useCache),
            RawTileStateImpl.toInt(state),
            to_native.toNativeBytes(rawData)));

  @core.override
  late final version =
      mapkit_version.VersionImpl.fromNative(_RawTile_get_version(_ptr));
  @core.override
  late final features = to_platform.toMapString(_RawTile_get_features(_ptr));
  @core.override
  late final etag = to_platform.toPlatformString(_RawTile_get_etag(_ptr));
  @core.override
  late final useCache =
      RawTileUseCacheImpl.fromInt(_RawTile_get_useCache(_ptr));
  @core.override
  late final state = RawTileStateImpl.fromInt(_RawTile_get_state(_ptr));
  @core.override
  late final rawData = to_platform.toPlatformBytes(_RawTile_get_rawData(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_RawTile_free.cast());

  RawTileImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(RawTile? obj) {
    return (obj as RawTileImpl?)?._ptr ?? ffi.nullptr;
  }

  static RawTile? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : RawTileImpl.fromNativePtr(ptr);
  }

  static RawTile? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        RawTileImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

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

@bindings_annotations.ContainerData(
    toNative: 'RawTileStateImpl.toPointer',
    toPlatform: '(val) => RawTileStateImpl.fromPointer(val, needFree: false)',
    platformType: 'RawTileState')
extension RawTileStateImpl on RawTileState {
  static core.int toInt(RawTileState e) {
    return e.index;
  }

  static RawTileState fromInt(core.int val) {
    return RawTileState.values[val];
  }

  static RawTileState? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(RawTileState? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'RawTileUseCacheImpl.toPointer',
    toPlatform:
        '(val) => RawTileUseCacheImpl.fromPointer(val, needFree: false)',
    platformType: 'RawTileUseCache')
extension RawTileUseCacheImpl on RawTileUseCache {
  static core.int toInt(RawTileUseCache e) {
    return e.index;
  }

  static RawTileUseCache fromInt(core.int val) {
    return RawTileUseCache.values[val];
  }

  static RawTileUseCache? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(RawTileUseCache? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
