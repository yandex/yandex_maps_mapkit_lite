part of 'base_data_source_builder.dart';

@bindings_annotations.WeakInterface('mapkit.map.BaseDataSourceBuilder')
@bindings_annotations.ContainerData(
    toNative: 'BaseDataSourceBuilderImpl.getNativePtr',
    toPlatform:
        '(val) => BaseDataSourceBuilderImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'BaseDataSourceBuilder')
class BaseDataSourceBuilderImpl
    implements BaseDataSourceBuilder, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_BaseDataSourceBuilder_free.cast());

  /// @nodoc
  BaseDataSourceBuilderImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  BaseDataSourceBuilderImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory BaseDataSourceBuilderImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(BaseDataSourceBuilder? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as BaseDataSourceBuilderImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _BaseDataSourceBuilder_check(ptr);
  }

  @internal

  /// @nodoc
  static BaseDataSourceBuilder? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return BaseDataSourceBuilderImpl.fromNativePtr(ptr);
  }

  void setImageUrlProvider(
      mapkit_images_image_url_provider.ImagesImageUrlProvider urlProvider) {
    _BaseDataSourceBuilder_setImageUrlProvider(
        ptr,
        mapkit_images_image_url_provider.ImagesImageUrlProviderImpl
            .getNativePtr(urlProvider));
  }
}

final _BaseDataSourceBuilder_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_BaseDataSourceBuilder_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _BaseDataSourceBuilder_check =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_BaseDataSourceBuilder_check')
        .asFunction(isLeaf: true);

final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _BaseDataSourceBuilder_setImageUrlProvider = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_BaseDataSourceBuilder_setImageUrlProvider')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int)
    _BaseDataSourceBuilder_set = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_BaseDataSourceBuilder_set_')
        .asFunction(isLeaf: true);
