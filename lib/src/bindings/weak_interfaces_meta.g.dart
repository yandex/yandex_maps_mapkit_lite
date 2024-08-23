import 'package:yandex_maps_mapkit_lite/src/runtime/i18n/i18n_manager.dart'
    as src_runtime_i18n_i18n_manager;
import 'package:yandex_maps_mapkit_lite/src/runtime/network/errors.dart'
    as src_runtime_network_errors;
import 'package:yandex_maps_mapkit_lite/src/runtime/local_error.dart'
    as src_runtime_local_error;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as src_runtime_error;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geo/projection.dart'
    as src_mapkit_geometry_geo_projection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/arrow.dart'
    as src_mapkit_map_arrow;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/cluster.dart'
    as src_mapkit_map_cluster;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as src_mapkit_map_map_object;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polyline.dart'
    as src_mapkit_map_polyline;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_window.dart'
    as src_mapkit_map_map_window;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/clusterized_placemark_collection.dart'
    as src_mapkit_map_clusterized_placemark_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemarks_styler.dart'
    as src_mapkit_map_placemarks_styler;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark_animation.dart'
    as src_mapkit_map_placemark_animation;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/camera_bounds.dart'
    as src_mapkit_map_camera_bounds;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map.dart'
    as src_mapkit_map_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/base_map_object_collection.dart'
    as src_mapkit_map_base_map_object_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/circle.dart'
    as src_mapkit_map_circle;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/composite_icon.dart'
    as src_mapkit_map_composite_icon;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/tile_data_source_builder.dart'
    as src_mapkit_map_tile_data_source_builder;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polygon.dart'
    as src_mapkit_map_polygon;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object_collection.dart'
    as src_mapkit_map_map_object_collection;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as src_mapkit_map_placemark;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/base_data_source_builder.dart'
    as src_mapkit_map_base_data_source_builder;
import 'package:yandex_maps_mapkit_lite/src/mapkit/user_location/user_location.dart'
    as src_mapkit_user_location_user_location;
import 'package:yandex_maps_mapkit_lite/src/mapkit/storage/storage_manager.dart'
    as src_mapkit_storage_storage_manager;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/layer.dart'
    as src_mapkit_layers_layer;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/data_source_layer.dart'
    as src_mapkit_layers_data_source_layer;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/object_event.dart'
    as src_mapkit_layers_object_event;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/data_source.dart'
    as src_mapkit_layers_data_source;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/geo_object_tap_event.dart'
    as src_mapkit_layers_geo_object_tap_event;
import 'package:yandex_maps_mapkit_lite/src/mapkit/mapkit.dart'
    as src_mapkit_mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/offline_cache/errors.dart'
    as src_mapkit_offline_cache_errors;
import 'package:yandex_maps_mapkit_lite/src/mapkit/offline_cache/offline_cache_manager.dart'
    as src_mapkit_offline_cache_offline_cache_manager;
import 'package:yandex_maps_mapkit_lite/src/mapkit/traffic/traffic_layer.dart'
    as src_mapkit_traffic_traffic_layer;
import 'package:yandex_maps_mapkit_lite/src/mapkit/logo/logo.dart'
    as src_mapkit_logo_logo;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/error.dart'
    as src_mapkit_location_error;

const weakInterfacesMeta = {
  'runtime.i18n.I18nManager':
      src_runtime_i18n_i18n_manager.I18nManagerImpl.fromNativePtrImpl,
  'runtime.network.RemoteError':
      src_runtime_network_errors.RemoteErrorImpl.fromNativePtrImpl,
  'runtime.network.BadRequestError':
      src_runtime_network_errors.BadRequestErrorImpl.fromNativePtrImpl,
  'runtime.network.NotFoundError':
      src_runtime_network_errors.NotFoundErrorImpl.fromNativePtrImpl,
  'runtime.network.RequestEntityTooLargeError': src_runtime_network_errors
      .RequestEntityTooLargeErrorImpl.fromNativePtrImpl,
  'runtime.network.ForbiddenError':
      src_runtime_network_errors.ForbiddenErrorImpl.fromNativePtrImpl,
  'runtime.network.UnauthorizedError':
      src_runtime_network_errors.UnauthorizedErrorImpl.fromNativePtrImpl,
  'runtime.network.NetworkError':
      src_runtime_network_errors.NetworkErrorImpl.fromNativePtrImpl,
  'runtime.LocalError':
      src_runtime_local_error.LocalErrorImpl.fromNativePtrImpl,
  'runtime.DiskFullError':
      src_runtime_local_error.DiskFullErrorImpl.fromNativePtrImpl,
  'runtime.DiskCorruptError':
      src_runtime_local_error.DiskCorruptErrorImpl.fromNativePtrImpl,
  'runtime.DiskWriteAccessError':
      src_runtime_local_error.DiskWriteAccessErrorImpl.fromNativePtrImpl,
  'runtime.Error': src_runtime_error.ErrorImpl.fromNativePtrImpl,
  'mapkit.geometry.geo.Projection':
      src_mapkit_geometry_geo_projection.ProjectionImpl.fromNativePtrImpl,
  'mapkit.map.Arrow': src_mapkit_map_arrow.ArrowImpl.fromNativePtrImpl,
  'mapkit.map.Cluster': src_mapkit_map_cluster.ClusterImpl.fromNativePtrImpl,
  'mapkit.map.MapObject':
      src_mapkit_map_map_object.MapObjectImpl.fromNativePtrImpl,
  'mapkit.map.PolylineMapObject':
      src_mapkit_map_polyline.PolylineMapObjectImpl.fromNativePtrImpl,
  'mapkit.map.MapWindow':
      src_mapkit_map_map_window.MapWindowImpl.fromNativePtrImpl,
  'mapkit.map.ClusterizedPlacemarkCollection':
      src_mapkit_map_clusterized_placemark_collection
          .ClusterizedPlacemarkCollectionImpl.fromNativePtrImpl,
  'mapkit.map.PlacemarksStyler':
      src_mapkit_map_placemarks_styler.PlacemarksStylerImpl.fromNativePtrImpl,
  'mapkit.map.PlacemarkAnimation': src_mapkit_map_placemark_animation
      .PlacemarkAnimationImpl.fromNativePtrImpl,
  'mapkit.map.CameraBounds':
      src_mapkit_map_camera_bounds.CameraBoundsImpl.fromNativePtrImpl,
  'mapkit.map.Map': src_mapkit_map_map.MapImpl.fromNativePtrImpl,
  'mapkit.map.BaseMapObjectCollection':
      src_mapkit_map_base_map_object_collection
          .BaseMapObjectCollectionImpl.fromNativePtrImpl,
  'mapkit.map.CircleMapObject':
      src_mapkit_map_circle.CircleMapObjectImpl.fromNativePtrImpl,
  'mapkit.map.CompositeIcon':
      src_mapkit_map_composite_icon.CompositeIconImpl.fromNativePtrImpl,
  'mapkit.map.BaseTileDataSourceBuilder':
      src_mapkit_map_tile_data_source_builder
          .BaseTileDataSourceBuilderImpl.fromNativePtrImpl,
  'mapkit.map.TileDataSourceBuilder': src_mapkit_map_tile_data_source_builder
      .TileDataSourceBuilderImpl.fromNativePtrImpl,
  'mapkit.map.PolygonMapObject':
      src_mapkit_map_polygon.PolygonMapObjectImpl.fromNativePtrImpl,
  'mapkit.map.MapObjectCollection': src_mapkit_map_map_object_collection
      .MapObjectCollectionImpl.fromNativePtrImpl,
  'mapkit.map.PlacemarkMapObject':
      src_mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtrImpl,
  'mapkit.map.BaseDataSourceBuilder': src_mapkit_map_base_data_source_builder
      .BaseDataSourceBuilderImpl.fromNativePtrImpl,
  'mapkit.user_location.UserLocationView':
      src_mapkit_user_location_user_location
          .UserLocationViewImpl.fromNativePtrImpl,
  'mapkit.user_location.UserLocationIconChanged':
      src_mapkit_user_location_user_location
          .UserLocationIconChangedImpl.fromNativePtrImpl,
  'mapkit.user_location.UserLocationAnchorChanged':
      src_mapkit_user_location_user_location
          .UserLocationAnchorChangedImpl.fromNativePtrImpl,
  'mapkit.user_location.UserLocationLayer':
      src_mapkit_user_location_user_location
          .UserLocationLayerImpl.fromNativePtrImpl,
  'mapkit.storage.StorageManager':
      src_mapkit_storage_storage_manager.StorageManagerImpl.fromNativePtrImpl,
  'mapkit.layers.Layer': src_mapkit_layers_layer.LayerImpl.fromNativePtrImpl,
  'mapkit.layers.DataSourceLayer':
      src_mapkit_layers_data_source_layer.DataSourceLayerImpl.fromNativePtrImpl,
  'mapkit.layers.ObjectEvent':
      src_mapkit_layers_object_event.ObjectEventImpl.fromNativePtrImpl,
  'mapkit.layers.BaseDataSource':
      src_mapkit_layers_data_source.BaseDataSourceImpl.fromNativePtrImpl,
  'mapkit.layers.TileDataSource':
      src_mapkit_layers_data_source.TileDataSourceImpl.fromNativePtrImpl,
  'mapkit.layers.DataSource':
      src_mapkit_layers_data_source.DataSourceImpl.fromNativePtrImpl,
  'mapkit.layers.GeoObjectTapEvent': src_mapkit_layers_geo_object_tap_event
      .GeoObjectTapEventImpl.fromNativePtrImpl,
  'mapkit.MapKit': src_mapkit_mapkit.MapKitImpl.fromNativePtrImpl,
  'mapkit.offline_cache.CachePathUnavailable': src_mapkit_offline_cache_errors
      .CachePathUnavailableImpl.fromNativePtrImpl,
  'mapkit.offline_cache.OfflineCacheManager':
      src_mapkit_offline_cache_offline_cache_manager
          .OfflineCacheManagerImpl.fromNativePtrImpl,
  'mapkit.traffic.TrafficLayer':
      src_mapkit_traffic_traffic_layer.TrafficLayerImpl.fromNativePtrImpl,
  'mapkit.logo.Logo': src_mapkit_logo_logo.LogoImpl.fromNativePtrImpl,
  'mapkit.location.LocationUnavailableError':
      src_mapkit_location_error.LocationUnavailableErrorImpl.fromNativePtrImpl,
};
