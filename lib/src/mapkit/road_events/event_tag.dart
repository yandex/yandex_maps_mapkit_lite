import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'event_tag.containers.dart';
part 'event_tag.impl.dart';

enum RoadEventsEventTag {
  Other,
  Feedback,
  Chat,

  /// Same as Chat but limited by distance that you can see it from
  LocalChat,

  /// Temporary issues
  Drawbridge,
  Closed,
  Reconstruction,
  Accident,

  /// Potentially dangerous zones
  Danger,
  School,
  OvertakingDanger,
  PedestrianDanger,
  CrossRoadDanger,

  /// Generalizing tag that has any traffic code control event. In old
  /// clients all new events fallback to this tag
  Police,

  /// Traffic code control tags
  LaneControl,
  RoadMarkingControl,
  CrossRoadControl,
  NoStoppingControl,
  MobileControl,
  SpeedControl,
  TrafficControl,
  PolicePatrol,
  ;
}
