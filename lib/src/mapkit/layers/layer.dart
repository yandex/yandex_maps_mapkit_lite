import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/async.dart'
    show runWithBlockUi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/data_source_layer.dart'
    as mapkit_layers_data_source_layer;

part 'layer.containers.dart';
part 'layer.impl.dart';

/// Interface for working with the layer.
abstract class Layer implements ffi.Finalizable {
  /// Removes the layer from the map. The object becomes invalid after
  /// that.
  void remove();

  mapkit_layers_data_source_layer.DataSourceLayer dataSourceLayer();

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}
