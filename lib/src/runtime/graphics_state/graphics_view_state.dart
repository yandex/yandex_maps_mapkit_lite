import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'graphics_view_state.containers.dart';

///
@bindings_annotations.ContainerData(
    toNative: 'GraphicsViewType.toPointer',
    toPlatform: '(val) => GraphicsViewType.fromPointer(val, needFree: false)')
enum GraphicsViewType {
  OpenGl,
  Vulkan,
  ;

  /// @nodoc
  @internal
  static GraphicsViewType fromInt(core.int val) {
    return GraphicsViewType.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(GraphicsViewType e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static GraphicsViewType? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(GraphicsViewType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

///
class GraphicsViewState {
  GraphicsViewState._();

  static void logViewCreateAttempt(GraphicsViewType graphicsView) {
    _GraphicsViewState_logViewCreateAttempt(
        GraphicsViewType.toInt(graphicsView));
  }

  static core.bool viewCreateAttempted(GraphicsViewType graphicsView) {
    return _GraphicsViewState_viewCreateAttempted(
        GraphicsViewType.toInt(graphicsView));
  }
}

final void Function(core.int) _GraphicsViewState_logViewCreateAttempt = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
        'yandex_flutter_runtime_graphics_state_GraphicsViewState_logViewCreateAttempt')
    .asFunction();
final core.bool Function(core.int) _GraphicsViewState_viewCreateAttempted = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Int64)>>(
        'yandex_flutter_runtime_graphics_state_GraphicsViewState_viewCreateAttempted')
    .asFunction();
