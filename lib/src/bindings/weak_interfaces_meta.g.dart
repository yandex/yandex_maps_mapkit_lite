import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/geo/projection.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/data_source.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/data_source_layer.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/geo_object_tap_event.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/layer.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/object_event.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/error.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/logo/logo.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/arrow.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/base_data_source_builder.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/base_map_object_collection.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/camera_bounds.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/circle.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/cluster.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/clusterized_placemark_collection.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/composite_icon.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object_collection.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_window.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/model.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark_animation.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemarks_styler.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polygon.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/polyline.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/tile_data_source_builder.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/mapkit.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/offline_cache/errors.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/offline_cache/offline_cache_manager.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/storage/storage_manager.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/traffic/traffic_layer.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/ui/overlay.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/src/mapkit/user_location/user_location.dart'
    as mapkit;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart' as runtime;
import 'package:yandex_maps_mapkit_lite/src/runtime/i18n/i18n_manager.dart'
    as runtime;
import 'package:yandex_maps_mapkit_lite/src/runtime/local_error.dart'
    as runtime;
import 'package:yandex_maps_mapkit_lite/src/runtime/network/errors.dart'
    as runtime;

const weakInterfacesMeta = {
  'mapkit.MapKit': mapkit.MapKitImpl.fromNativePtrImpl,
  'mapkit.geometry.geo.Projection': mapkit.ProjectionImpl.fromNativePtrImpl,
  'mapkit.layers.BaseDataSource': mapkit.BaseDataSourceImpl.fromNativePtrImpl,
  'mapkit.layers.DataSource': mapkit.DataSourceImpl.fromNativePtrImpl,
  'mapkit.layers.DataSourceLayer': mapkit.DataSourceLayerImpl.fromNativePtrImpl,
  'mapkit.layers.GeoObjectTapEvent':
      mapkit.GeoObjectTapEventImpl.fromNativePtrImpl,
  'mapkit.layers.Layer': mapkit.LayerImpl.fromNativePtrImpl,
  'mapkit.layers.ObjectEvent': mapkit.ObjectEventImpl.fromNativePtrImpl,
  'mapkit.layers.TileDataSource': mapkit.TileDataSourceImpl.fromNativePtrImpl,
  'mapkit.location.LocationUnavailableError':
      mapkit.LocationUnavailableErrorImpl.fromNativePtrImpl,
  'mapkit.logo.Logo': mapkit.LogoImpl.fromNativePtrImpl,
  'mapkit.map.Arrow': mapkit.ArrowImpl.fromNativePtrImpl,
  'mapkit.map.BaseDataSourceBuilder':
      mapkit.BaseDataSourceBuilderImpl.fromNativePtrImpl,
  'mapkit.map.BaseMapObjectCollection':
      mapkit.BaseMapObjectCollectionImpl.fromNativePtrImpl,
  'mapkit.map.BaseTileDataSourceBuilder':
      mapkit.BaseTileDataSourceBuilderImpl.fromNativePtrImpl,
  'mapkit.map.CameraBounds': mapkit.CameraBoundsImpl.fromNativePtrImpl,
  'mapkit.map.CircleMapObject': mapkit.CircleMapObjectImpl.fromNativePtrImpl,
  'mapkit.map.Cluster': mapkit.ClusterImpl.fromNativePtrImpl,
  'mapkit.map.ClusterizedPlacemarkCollection':
      mapkit.ClusterizedPlacemarkCollectionImpl.fromNativePtrImpl,
  'mapkit.map.CompositeIcon': mapkit.CompositeIconImpl.fromNativePtrImpl,
  'mapkit.map.Map': mapkit.MapImpl.fromNativePtrImpl,
  'mapkit.map.MapObject': mapkit.MapObjectImpl.fromNativePtrImpl,
  'mapkit.map.MapObjectCollection':
      mapkit.MapObjectCollectionImpl.fromNativePtrImpl,
  'mapkit.map.MapWindow': mapkit.MapWindowImpl.fromNativePtrImpl,
  'mapkit.map.Model': mapkit.ModelImpl.fromNativePtrImpl,
  'mapkit.map.PlacemarkAnimation':
      mapkit.PlacemarkAnimationImpl.fromNativePtrImpl,
  'mapkit.map.PlacemarkMapObject':
      mapkit.PlacemarkMapObjectImpl.fromNativePtrImpl,
  'mapkit.map.PlacemarksStyler': mapkit.PlacemarksStylerImpl.fromNativePtrImpl,
  'mapkit.map.PolygonMapObject': mapkit.PolygonMapObjectImpl.fromNativePtrImpl,
  'mapkit.map.PolylineMapObject':
      mapkit.PolylineMapObjectImpl.fromNativePtrImpl,
  'mapkit.map.RootMapObjectCollection':
      mapkit.RootMapObjectCollectionImpl.fromNativePtrImpl,
  'mapkit.map.TileDataSourceBuilder':
      mapkit.TileDataSourceBuilderImpl.fromNativePtrImpl,
  'mapkit.offline_cache.CachePathUnavailable':
      mapkit.CachePathUnavailableImpl.fromNativePtrImpl,
  'mapkit.offline_cache.OfflineCacheManager':
      mapkit.OfflineCacheManagerImpl.fromNativePtrImpl,
  'mapkit.storage.StorageManager': mapkit.StorageManagerImpl.fromNativePtrImpl,
  'mapkit.traffic.TrafficLayer': mapkit.TrafficLayerImpl.fromNativePtrImpl,
  'mapkit.ui.Overlay': mapkit.OverlayImpl.fromNativePtrImpl,
  'mapkit.user_location.UserLocationAnchorChanged':
      mapkit.UserLocationAnchorChangedImpl.fromNativePtrImpl,
  'mapkit.user_location.UserLocationIconChanged':
      mapkit.UserLocationIconChangedImpl.fromNativePtrImpl,
  'mapkit.user_location.UserLocationLayer':
      mapkit.UserLocationLayerImpl.fromNativePtrImpl,
  'mapkit.user_location.UserLocationView':
      mapkit.UserLocationViewImpl.fromNativePtrImpl,
  'runtime.DiskCorruptError': runtime.DiskCorruptErrorImpl.fromNativePtrImpl,
  'runtime.DiskFullError': runtime.DiskFullErrorImpl.fromNativePtrImpl,
  'runtime.DiskWriteAccessError':
      runtime.DiskWriteAccessErrorImpl.fromNativePtrImpl,
  'runtime.Error': runtime.ErrorImpl.fromNativePtrImpl,
  'runtime.LocalError': runtime.LocalErrorImpl.fromNativePtrImpl,
  'runtime.i18n.I18nManager': runtime.I18nManagerImpl.fromNativePtrImpl,
  'runtime.network.BadRequestError':
      runtime.BadRequestErrorImpl.fromNativePtrImpl,
  'runtime.network.ForbiddenError':
      runtime.ForbiddenErrorImpl.fromNativePtrImpl,
  'runtime.network.NetworkError': runtime.NetworkErrorImpl.fromNativePtrImpl,
  'runtime.network.NotFoundError': runtime.NotFoundErrorImpl.fromNativePtrImpl,
  'runtime.network.RemoteError': runtime.RemoteErrorImpl.fromNativePtrImpl,
  'runtime.network.RequestEntityTooLargeError':
      runtime.RequestEntityTooLargeErrorImpl.fromNativePtrImpl,
  'runtime.network.UnauthorizedError':
      runtime.UnauthorizedErrorImpl.fromNativePtrImpl,
};
