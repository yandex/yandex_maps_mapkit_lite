part of 'geo_object_tags.dart';

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectTagsImpl.getNativePtr',
    toPlatform: '(val) => GeoObjectTagsImpl.fromPointer(val, needFree: false)',
    platformType: 'GeoObjectTags')
final class GeoObjectTagsImpl extends GeoObjectTags {
  GeoObjectTagsImpl(core.List<core.String> tags)
      : this.fromNativePtr(
            _GeoObjectTags_init(to_native.toNativeVectorString(tags)));

  @core.override
  late final tags = to_platform.toVectorString(_GeoObjectTags_get_tags(_ptr));

  @core.override
  final _GeoObjectTagsFactory runtimeFactory = const _GeoObjectTagsFactory();

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_GeoObjectTags_free.cast());

  GeoObjectTagsImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(GeoObjectTags? obj) {
    return (obj as GeoObjectTagsImpl?)?._ptr ?? ffi.nullptr;
  }

  static GeoObjectTags? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : GeoObjectTagsImpl.fromNativePtr(ptr);
  }

  static GeoObjectTags? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = GeoObjectTagsImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

class _GeoObjectTagsFactory
    extends struct_factory.StructFactory<GeoObjectTags> {
  const _GeoObjectTagsFactory();

  @core.override
  GeoObjectTags create(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectTagsImpl.fromNativePtr(ptr);
  }

  @core.override
  GeoObjectTags fromParent(ffi.Pointer<ffi.Void> ptr) {
    return GeoObjectTagsImpl.fromNativePtr(_GeoObjectTags_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(GeoObjectTags obj) {
    return _GeoObjectTags_upcast(GeoObjectTagsImpl.getNativePtr(obj));
  }

  @core.override
  native_types.NativeString typeName() {
    return _GeoObjectTags_name();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectTags_downcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectTags_downcast')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectTags_upcast = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectTags_upcast')
        .asFunction(isLeaf: true);

final native_types.NativeString Function() _GeoObjectTags_name = lib.library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_map_GeoObjectTags_name')
    .asFunction(isLeaf: true);

final _GeoObjectTags_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_map_GeoObjectTags_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectTags_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectTags_init')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObjectTags_get_tags = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_GeoObjectTags_get_tags')
        .asFunction(isLeaf: true);
