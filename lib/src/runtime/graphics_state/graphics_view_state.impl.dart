part of 'graphics_view_state.dart';

@bindings_annotations.ContainerData(
    toNative: 'GraphicsViewTypeImpl.toPointer',
    toPlatform:
        '(val) => GraphicsViewTypeImpl.fromPointer(val, needFree: false)',
    platformType: 'GraphicsViewType')
extension GraphicsViewTypeImpl on GraphicsViewType {
  static core.int toInt(GraphicsViewType e) {
    return e.index;
  }

  static GraphicsViewType fromInt(core.int val) {
    return GraphicsViewType.values[val];
  }

  static GraphicsViewType? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(GraphicsViewType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

void _logViewCreateAttempt(GraphicsViewType graphicsView) {
  _GraphicsViewState_logViewCreateAttempt(
      GraphicsViewTypeImpl.toInt(graphicsView));
}

core.bool _viewCreateAttempted(GraphicsViewType graphicsView) {
  return _GraphicsViewState_viewCreateAttempted(
      GraphicsViewTypeImpl.toInt(graphicsView));
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
