import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
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
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;

part 'traffic_listener.containers.dart';
part 'traffic_listener.impl.dart';

/// The color that is used for traffic.
enum TrafficColor {
  /// Red color.
  Red,

  /// Yellow color.
  Yellow,

  /// Green color.
  Green,
  ;
}

/// The level of traffic.
abstract final class TrafficLevel implements ffi.Finalizable {
  factory TrafficLevel(TrafficColor color, core.int level) =>
      TrafficLevelImpl(color, level);

  TrafficLevel._();

  /// The color that represents traffic.
  TrafficColor get color;

  /// Traffic level.
  core.int get level;

  @core.override
  core.int get hashCode => core.Object.hashAll([color, level]);

  @core.override
  core.bool operator ==(covariant TrafficLevel other) {
    if (core.identical(this, other)) {
      return true;
    }
    return color == other.color && level == other.level;
  }

  @core.override
  core.String toString() {
    return "TrafficLevel(color: $color, level: $level)";
  }
}

/// Listener to handle traffic information.
abstract class TrafficListener {
  /// Triggered when traffic level changes.
  void onTrafficChanged(TrafficLevel? trafficLevel);

  /// Triggered when traffic information is loading.
  void onTrafficLoading();

  /// Triggered when traffic information expires.
  void onTrafficExpired();
}
