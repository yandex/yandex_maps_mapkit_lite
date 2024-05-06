part of 'tile_data_source_builder.dart';

@bindings_annotations.WeakInterface('mapkit.map.BaseTileDataSourceBuilder')
@bindings_annotations.ContainerData(
    toNative: 'BaseTileDataSourceBuilderImpl.getNativePtr',
    toPlatform:
        '(val) => BaseTileDataSourceBuilderImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'BaseTileDataSourceBuilder')
class BaseTileDataSourceBuilderImpl
    implements BaseTileDataSourceBuilder, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_BaseTileDataSourceBuilder_free.cast());

  /// @nodoc
  BaseTileDataSourceBuilderImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  BaseTileDataSourceBuilderImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory BaseTileDataSourceBuilderImpl.fromNativePtr(
          ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(BaseTileDataSourceBuilder? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as BaseTileDataSourceBuilderImpl).ptr;
  }

  core.bool isValid() {
    return _BaseTileDataSourceBuilder_check(ptr);
  }

  @internal

  /// @nodoc
  static BaseTileDataSourceBuilder? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return BaseTileDataSourceBuilderImpl.fromNativePtr(ptr);
  }

  void setTileUrlProvider(
      mapkit_tiles_url_provider.TilesUrlProvider urlProvider) {
    _BaseTileDataSourceBuilder_setTileUrlProvider(
        ptr,
        mapkit_tiles_url_provider.TilesUrlProviderImpl.getNativePtr(
            urlProvider));
  }

  void setTileProvider(mapkit_tiles_tile_provider.TileProvider tileProvider) {
    _BaseTileDataSourceBuilder_setTileProvider(ptr,
        mapkit_tiles_tile_provider.TileProviderImpl.getNativePtr(tileProvider));
  }

  void setImageUrlProvider(
      mapkit_images_image_url_provider.ImagesImageUrlProvider urlProvider) {
    _BaseTileDataSourceBuilder_setImageUrlProvider(
        ptr,
        mapkit_images_image_url_provider.ImagesImageUrlProviderImpl
            .getNativePtr(urlProvider));
  }

  void setProjection(mapkit_geometry_geo_projection.Projection projection) {
    _BaseTileDataSourceBuilder_setProjection(ptr,
        mapkit_geometry_geo_projection.ProjectionImpl.getNativePtr(projection));
  }

  void setZoomRanges(core.List<mapkit_zoom_range.ZoomRangeIdl> zoomRanges) {
    _BaseTileDataSourceBuilder_setZoomRanges(
        ptr,
        mapkit_zoom_range.ZoomRangeIdlContainerExtension.toNativeVector(
            zoomRanges));
  }

  void setTileFormat(mapkit_layers_tile_format.TileFormat format) {
    _BaseTileDataSourceBuilder_setTileFormat(
        ptr, mapkit_layers_tile_format.TileFormatImpl.toInt(format));
  }
}

final _BaseTileDataSourceBuilder_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_BaseTileDataSourceBuilder_free');
final core.bool Function(ffi.Pointer<ffi.Void>)
    _BaseTileDataSourceBuilder_check = lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_BaseTileDataSourceBuilder_check')
        .asFunction(isLeaf: true);

final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _BaseTileDataSourceBuilder_setTileUrlProvider = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_BaseTileDataSourceBuilder_setTileUrlProvider')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _BaseTileDataSourceBuilder_setTileProvider = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_BaseTileDataSourceBuilder_setTileProvider')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _BaseTileDataSourceBuilder_setImageUrlProvider = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_BaseTileDataSourceBuilder_setImageUrlProvider')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _BaseTileDataSourceBuilder_setProjection = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_BaseTileDataSourceBuilder_setProjection')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _BaseTileDataSourceBuilder_setZoomRanges = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_BaseTileDataSourceBuilder_setZoomRanges')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int)
    _BaseTileDataSourceBuilder_setTileFormat = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_BaseTileDataSourceBuilder_setTileFormat')
        .asFunction();

@bindings_annotations.WeakInterface('mapkit.map.TileDataSourceBuilder')
@bindings_annotations.ContainerData(
    toNative: 'TileDataSourceBuilderImpl.getNativePtr',
    toPlatform:
        '(val) => TileDataSourceBuilderImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'TileDataSourceBuilder')
class TileDataSourceBuilderImpl extends BaseTileDataSourceBuilderImpl
    implements TileDataSourceBuilder, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_TileDataSourceBuilder_free.cast());

  /// @nodoc
  TileDataSourceBuilderImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  TileDataSourceBuilderImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory TileDataSourceBuilderImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(TileDataSourceBuilder? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as TileDataSourceBuilderImpl).ptr;
  }

  core.bool isValid() {
    return _TileDataSourceBuilder_check(ptr);
  }

  @internal

  /// @nodoc
  static TileDataSourceBuilder? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return TileDataSourceBuilderImpl.fromNativePtr(ptr);
  }
}

final _TileDataSourceBuilder_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_TileDataSourceBuilder_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _TileDataSourceBuilder_check =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_TileDataSourceBuilder_check')
        .asFunction(isLeaf: true);

final class CreateTileDataSourceImpl implements CreateTileDataSource {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, CreateTileDataSource>{};

  CreateTileDataSourceImpl(
      {required void Function(TileDataSourceBuilder builder)
          createTileDataSource})
      : _ptr = _CreateTileDataSource_new(ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _CreateTileDataSource_createTileDataSource)),
        _createTileDataSource = createTileDataSource {
    _pointerToListener[_ptr] = this;
    _CreateTileDataSourcesetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  @core.override
  void createTileDataSource(TileDataSourceBuilder builder) =>
      _createTileDataSource(builder);

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function(TileDataSourceBuilder) _createTileDataSource;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(CreateTileDataSource? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as CreateTileDataSourceImpl)._ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _CreateTileDataSourcesetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_CreateTileDataSource_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _CreateTileDataSource_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_map_CreateTileDataSource_new')
        .asFunction(isLeaf: true);

void _CreateTileDataSource_createTileDataSource(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> builder) {
  final listener = CreateTileDataSourceImpl._pointerToListener[_ptr]!;

  try {
    listener
        .createTileDataSource(TileDataSourceBuilderImpl.fromNativePtr(builder));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}
