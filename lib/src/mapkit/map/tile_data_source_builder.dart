import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geo/projection.dart'
    as mapkit_geometry_geo_projection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/images/image_url_provider.dart'
    as mapkit_images_image_url_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/tile_format.dart'
    as mapkit_layers_tile_format;
import 'package:yandex_maps_mapkit_lite/src/mapkit/tiles/tile_provider.dart'
    as mapkit_tiles_tile_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/tiles/url_provider.dart'
    as mapkit_tiles_url_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/zoom_range.dart'
    as mapkit_zoom_range;

part 'tile_data_source_builder.containers.dart';

@bindings_annotations.WeakInterface('mapkit.map.BaseTileDataSourceBuilder')
@bindings_annotations.ContainerData(
    toNative: 'BaseTileDataSourceBuilder.getNativePtr',
    toPlatform:
        '(val) => BaseTileDataSourceBuilder.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class BaseTileDataSourceBuilder implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_BaseTileDataSourceBuilder_free.cast());

  /// @nodoc
  BaseTileDataSourceBuilder.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  BaseTileDataSourceBuilder.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory BaseTileDataSourceBuilder.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(BaseTileDataSourceBuilder? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _BaseTileDataSourceBuilder_check(ptr);
  }

  @internal

  /// @nodoc
  static BaseTileDataSourceBuilder? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return BaseTileDataSourceBuilder.fromNativePtr(ptr);
  }

  /// The class does not retain the object in the 'urlProvider' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setTileUrlProvider(
      mapkit_tiles_url_provider.TilesUrlProvider urlProvider) {
    _BaseTileDataSourceBuilder_setTileUrlProvider(ptr,
        mapkit_tiles_url_provider.TilesUrlProvider.getNativePtr(urlProvider));
  }

  /// The class does not retain the object in the 'tileProvider' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setTileProvider(mapkit_tiles_tile_provider.TileProvider tileProvider) {
    _BaseTileDataSourceBuilder_setTileProvider(ptr,
        mapkit_tiles_tile_provider.TileProvider.getNativePtr(tileProvider));
  }

  /// The class does not retain the object in the 'urlProvider' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setImageUrlProvider(
      mapkit_images_image_url_provider.ImagesImageUrlProvider urlProvider) {
    _BaseTileDataSourceBuilder_setImageUrlProvider(
        ptr,
        mapkit_images_image_url_provider.ImagesImageUrlProvider.getNativePtr(
            urlProvider));
  }

  void setProjection(mapkit_geometry_geo_projection.Projection projection) {
    _BaseTileDataSourceBuilder_setProjection(ptr,
        mapkit_geometry_geo_projection.Projection.getNativePtr(projection));
  }

  void setZoomRanges(core.List<mapkit_zoom_range.ZoomRangeIdl> zoomRanges) {
    _BaseTileDataSourceBuilder_setZoomRanges(
        ptr,
        mapkit_zoom_range.ZoomRangeIdlContainerExtension.toNativeVector(
            zoomRanges));
  }

  void setTileFormat(mapkit_layers_tile_format.TileFormat format) {
    _BaseTileDataSourceBuilder_setTileFormat(
        ptr, mapkit_layers_tile_format.TileFormat.toInt(format));
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
    toNative: 'TileDataSourceBuilder.getNativePtr',
    toPlatform:
        '(val) => TileDataSourceBuilder.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class TileDataSourceBuilder extends BaseTileDataSourceBuilder
    implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_TileDataSourceBuilder_free.cast());

  /// @nodoc
  TileDataSourceBuilder.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  TileDataSourceBuilder.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory TileDataSourceBuilder.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(TileDataSourceBuilder? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _TileDataSourceBuilder_check(ptr);
  }

  @internal

  /// @nodoc
  static TileDataSourceBuilder? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return TileDataSourceBuilder.fromNativePtr(ptr);
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

class CreateTileDataSource {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, CreateTileDataSource>{};

  CreateTileDataSource(
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

  /// User defined factory, which sets up TileDataSourceBuilder. Will be
  /// called only once.
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
    return obj._ptr;
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
  final listener = CreateTileDataSource._pointerToListener[_ptr]!;

  try {
    listener.createTileDataSource(TileDataSourceBuilder.fromNativePtr(builder));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}
