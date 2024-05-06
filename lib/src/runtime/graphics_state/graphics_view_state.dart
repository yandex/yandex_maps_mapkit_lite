import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'graphics_view_state.containers.dart';
part 'graphics_view_state.impl.dart';

///
enum GraphicsViewType {
  OpenGl,
  Vulkan,
  ;
}

///
class GraphicsViewState {
  GraphicsViewState._();

  static void logViewCreateAttempt(GraphicsViewType graphicsView) {
    _logViewCreateAttempt(
      graphicsView,
    );
  }

  static core.bool viewCreateAttempted(GraphicsViewType graphicsView) {
    return _viewCreateAttempted(
      graphicsView,
    );
  }
}
