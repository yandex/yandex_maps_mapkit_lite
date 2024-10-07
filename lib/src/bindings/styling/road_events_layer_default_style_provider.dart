import 'package:yandex_maps_mapkit_lite/src/mapkit/flutter_road_events_layer.dart';
import 'package:yandex_maps_mapkit_lite/src/mapkit/road_events_layer/style_provider.dart';
import 'package:yandex_maps_mapkit_lite/src/mapkit/internal/flutter_road_events_layer.dart';

class RoadEventsLayerDefaultStyleProvider
    implements RoadEventsLayerStyleProvider {
  final InternalDefaultStyleProvider _defaultStyleProvider =
      InternalDefaultStyleProviderFactory.createDefaultStyleProvider();

  @override
  RoadEventsLayerHighlightCircleStyle? provideHighlightCircleStyle(
          bool isNightMode, RoadEventsLayerHighlightMode highlightMode) =>
      _defaultStyleProvider.provideHighlightCircleStyle(highlightMode,
          isNightMode: isNightMode);

  @override
  bool provideStyle(
          RoadEventsLayerRoadEventStylingProperties roadEventStylingProperties,
          bool isNightMode,
          double scaleFactor,
          RoadEventsLayerRoadEventStyle style) =>
      _defaultStyleProvider.provideStyle(roadEventStylingProperties, style,
          isNightMode: isNightMode, scaleFactor: scaleFactor);
}
