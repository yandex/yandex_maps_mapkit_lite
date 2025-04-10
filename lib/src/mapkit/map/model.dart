import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/callback.dart'
    as mapkit_map_callback;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/model_style.dart'
    as mapkit_map_model_style;
import 'package:yandex_maps_mapkit_lite/src/runtime/data_provider_with_id.dart'
    as runtime_data_provider_with_id;

part 'model.containers.dart';
part 'model.impl.dart';

/// describes model presentation of PlacemarkMapObject
abstract class Model implements ffi.Finalizable {
  /// describes style of the model
  mapkit_map_model_style.ModelStyle get modelStyle;
  set modelStyle(mapkit_map_model_style.ModelStyle val);

  /// Sets gltf data provider.
  ///
  /// The class maintains a strong reference to the object in
  /// the 'gltfDataProvider' parameter until it (the class) is invalidated.
  ///
  /// [onFinished] Called when the model is loaded.
  void setData(
      runtime_data_provider_with_id.DataProviderWithId gltfDataProvider,
      mapkit_map_callback.Callback onFinished);

  core.bool isValid();
}
