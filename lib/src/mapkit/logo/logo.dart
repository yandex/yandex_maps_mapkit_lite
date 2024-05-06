import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/logo/alignment.dart'
    as mapkit_logo_alignment;
import 'package:yandex_maps_mapkit_lite/src/mapkit/logo/padding.dart'
    as mapkit_logo_padding;

part 'logo.containers.dart';
part 'logo.impl.dart';

/// The object that allows to control logo display properties.
abstract class Logo implements ffi.Finalizable {
  /// Set logo alignment in the container.
  void setAlignment(mapkit_logo_alignment.LogoAlignment alignment);

  /// Set logo padding relative to the left/right and top/bottom edges.
  /// Values must be positive.
  void setPadding(mapkit_logo_padding.LogoPadding padding);
}
