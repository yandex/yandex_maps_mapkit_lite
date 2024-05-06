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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geo_object.dart'
    as mapkit_geo_object;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;
import 'package:yandex_maps_mapkit_lite/src/runtime/network/errors.dart'
    as runtime_network_errors;

part 'road_events_manager.containers.dart';
part 'road_events_manager.impl.dart';

/// Session for requesting road event info.
abstract class RoadEventsEventInfoSession implements ffi.Finalizable {
  /// One of the following errors can happen:
  /// [runtime_network_errors.NotFoundError],
  /// [runtime_network_errors.NetworkError],
  /// [runtime_network_errors.RemoteError].
  void retry(RoadEventsEventInfoSessionEventInfoListener eventInfoListener);

  void cancel();
}

abstract final class RoadEventsEventInfoSessionEventInfoListener {
  factory RoadEventsEventInfoSessionEventInfoListener(
      {required void Function(mapkit_geo_object.GeoObject event)
          onEventInfoReceived,
      required void Function(runtime_error.Error error) onEventInfoError}) {
    return RoadEventsEventInfoSessionEventInfoListenerImpl(
      onEventInfoReceived: onEventInfoReceived,
      onEventInfoError: onEventInfoError,
    );
  }

  void onEventInfoReceived(mapkit_geo_object.GeoObject event);
  void onEventInfoError(runtime_error.Error error);
}

abstract class RoadEventsManager implements ffi.Finalizable {
  /// Begins asynchronous request for road event info.
  ///
  /// [eventId] ID of the event to request information for.
  /// [eventInfoListener] Listener for result or error.
  RoadEventsEventInfoSession requestEventInfo(
    RoadEventsEventInfoSessionEventInfoListener eventInfoListener, {
    required core.String eventId,
  });
}
