import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
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
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/text_style.dart'
    as mapkit_map_text_style;

part 'placemark_text.containers.dart';
part 'placemark_text.impl.dart';

/// Provides an interface to set text and its style for a placemark.
abstract class PlacemarkText implements ffi.Finalizable {
  /// UTF-8 encoded text to be displayed with the PlacemarkMapObject Empty
  /// string means no text
  core.String get text;
  set text(core.String val);

  /// The style properties (size, color, etc.) of the placemark text. Note:
  /// The current style cannot be modified directly - you must reset it to
  /// apply changes.
  mapkit_map_text_style.TextStyle get style;
  set style(mapkit_map_text_style.TextStyle val);

  core.bool isValid();
}
