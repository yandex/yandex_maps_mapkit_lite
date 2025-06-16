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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart'
    as image_provider;
import 'package:yandex_maps_mapkit_lite/src/bindings/ui_view/view_provider.dart'
    as view_provider;
import 'package:yandex_maps_mapkit_lite/src/mapkit/screen_types.dart'
    as mapkit_screen_types;

part 'overlay.containers.dart';
part 'overlay.impl.dart';

/// Allows to render overlay on the screen.
abstract class Overlay implements ffi.Finalizable {
  /// Sets image as content of overlay, resets view. Window origin (0, 0) -
  /// top left corner.
  void setImage(
      image_provider.ImageProvider image, mapkit_screen_types.ScreenRect rect);

  /// Sets view as content of overlay, resets image. Window origin (0, 0) -
  /// top left corner.
  void setView(
      view_provider.ViewProvider view, mapkit_screen_types.ScreenRect rect);

  /// Removes the overlay from the map.
  void remove();

  core.bool isValid();
}
