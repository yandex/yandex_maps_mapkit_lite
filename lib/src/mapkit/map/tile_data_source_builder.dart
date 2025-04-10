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
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/tile_format.dart'
    as mapkit_layers_tile_format;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/base_data_source_builder.dart'
    as mapkit_map_base_data_source_builder;
import 'package:yandex_maps_mapkit_lite/src/mapkit/tiles/tile_provider.dart'
    as mapkit_tiles_tile_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/tiles/url_provider.dart'
    as mapkit_tiles_url_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/zoom_range.dart'
    as mapkit_zoom_range;

part 'tile_data_source_builder.containers.dart';
part 'tile_data_source_builder.impl.dart';

abstract class BaseTileDataSourceBuilder
    implements
        mapkit_map_base_data_source_builder.BaseDataSourceBuilder,
        ffi.Finalizable {
  /// The class does not retain the object in the 'urlProvider' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setTileUrlProvider(
      mapkit_tiles_url_provider.TilesUrlProvider urlProvider);

  /// The class does not retain the object in the 'tileProvider' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setTileProvider(mapkit_tiles_tile_provider.TileProvider tileProvider);

  void setProjection(mapkit_geometry_geo_projection.Projection projection);

  void setZoomRanges(core.List<mapkit_zoom_range.ZoomRangeIdl> zoomRanges);

  void setTileFormat(mapkit_layers_tile_format.TileFormat format);

  core.bool isValid();
}

abstract class TileDataSourceBuilder
    implements BaseTileDataSourceBuilder, ffi.Finalizable {
  core.bool isValid();
}

abstract final class CreateTileDataSource {
  factory CreateTileDataSource(
      {required void Function(TileDataSourceBuilder builder)
          createTileDataSource}) {
    return CreateTileDataSourceImpl(
      createTileDataSource: createTileDataSource,
    );
  }

  /// User defined factory, which sets up TileDataSourceBuilder. Will be
  /// called only once.
  void createTileDataSource(TileDataSourceBuilder builder);
}
