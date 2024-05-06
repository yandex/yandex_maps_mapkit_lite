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
import 'package:yandex_maps_mapkit_lite/src/mapkit/geo_object.dart'
    as mapkit_geo_object;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;

part 'geo_object_session.containers.dart';
part 'geo_object_session.impl.dart';

/// The interface for working with the session.
abstract class GeoObjectSession implements ffi.Finalizable {
  /// Cancels the current request.
  void cancel();

  /// Retries the last request. Cancels the current request if it is
  /// active.
  void retry(GeoObjectSessionGeoObjectListener objListener);
}

abstract final class GeoObjectSessionGeoObjectListener {
  factory GeoObjectSessionGeoObjectListener(
      {required void Function(mapkit_geo_object.GeoObject obj)
          onGeoObjectResult,
      required void Function(runtime_error.Error error) onGeoObjectError}) {
    return GeoObjectSessionGeoObjectListenerImpl(
      onGeoObjectResult: onGeoObjectResult,
      onGeoObjectError: onGeoObjectError,
    );
  }

  /// Called when a user is requesting detailed info for the specified
  /// object.
  void onGeoObjectResult(mapkit_geo_object.GeoObject obj);

  /// Called when an error occurs.
  void onGeoObjectError(runtime_error.Error error);
}
