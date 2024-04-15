import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'event_tag.containers.dart';

@bindings_annotations.ContainerData(
    toNative: 'RoadEventsEventTag.toPointer',
    toPlatform: '(val) => RoadEventsEventTag.fromPointer(val, needFree: false)')
enum RoadEventsEventTag {
  Other,
  Feedback,
  Chat,

  /// Only use this tag in conjuction with RoadEventsLayer. Road events
  /// layer embedded into TrafficLayer can't display local chats.
  LocalChat,

  /// Temporary issues
  Drawbridge,
  Closed,
  Reconstruction,
  Accident,
  TrafficAlert,

  /// Potentially dangerous zones
  Danger,
  School,
  OvertakingDanger,
  PedestrianDanger,
  CrossRoadDanger,

  /// Traffic code control tags
  Police,
  LaneControl,
  RoadMarkingControl,
  CrossRoadControl,
  NoStoppingControl,
  MobileControl,
  SpeedControl,
  ;

  /// @nodoc
  @internal
  static RoadEventsEventTag fromInt(core.int val) {
    return RoadEventsEventTag.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(RoadEventsEventTag e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static RoadEventsEventTag? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(RoadEventsEventTag? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
