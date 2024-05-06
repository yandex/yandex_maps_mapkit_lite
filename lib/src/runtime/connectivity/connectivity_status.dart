import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'connectivity_status.containers.dart';
part 'connectivity_status.impl.dart';

///
/// The status of the current connection to the internet.
enum ConnectivityStatus {
  /// No connection to the internet.
  None,

  /// Mobile network connection.
  Cellular,

  /// Network connection with high throughput (Wi-Fi or Ethernet).
  Broadband,
  ;
}
