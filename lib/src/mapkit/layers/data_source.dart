import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;

part 'data_source.containers.dart';
part 'data_source.impl.dart';

abstract class BaseDataSource implements ffi.Finalizable {
  /// Stores id of data source.
  core.String get id;
  core.bool isValid();
}

abstract class TileDataSource implements BaseDataSource, ffi.Finalizable {
  /// Invalidates data source and reloads all tiles. Must not be called if
  /// DataSource does not support versioning: LayerOptions.versionSupport =
  /// false;
  void invalidate(core.String version);

  core.bool isValid();
}

abstract class DataSource implements BaseDataSource, ffi.Finalizable {
  /// Updates all data. This method works synchronously and blocks UI
  /// thread. It is intended for passing not more than 500kB of data;
  /// otherwise, it will affect the responsiveness of UI and map.
  void setData(typed_data.ByteBuffer data);

  core.bool isValid();
}

abstract class DataSourceListener {
  void onDataSourceUpdated(BaseDataSource dataSource);
}
