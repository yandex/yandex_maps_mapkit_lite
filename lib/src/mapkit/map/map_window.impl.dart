part of 'map_window.dart';

@bindings_annotations.WeakInterface('mapkit.map.MapWindow')
@bindings_annotations.ContainerData(
    toNative: 'MapWindowImpl.getNativePtr',
    toPlatform:
        '(val) => MapWindowImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'MapWindow')
class MapWindowImpl implements MapWindow, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_MapWindow_free.cast());

  /// @nodoc
  MapWindowImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  MapWindowImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory MapWindowImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(MapWindow? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as MapWindowImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _MapWindow_check(ptr);
  }

  @internal

  /// @nodoc
  static MapWindow? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return MapWindowImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_map_map.Map get map {
    return mapkit_map_map.MapImpl.fromNativePtr(_MapWindow_get_map(ptr));
  }

  @core.override
  mapkit_screen_types.ScreenRect? get focusRect {
    return mapkit_screen_types.ScreenRectImpl.fromPointer(
        _MapWindow_get_focusRect(ptr));
  }

  @core.override
  set focusRect(mapkit_screen_types.ScreenRect? val) {
    _MapWindow_set_focusRect(
        ptr, mapkit_screen_types.ScreenRectImpl.toPointer(val));
  }

  @core.override
  mapkit_screen_types.ScreenPoint? get focusPoint {
    return mapkit_screen_types.ScreenPointImpl.fromPointer(
        _MapWindow_get_focusPoint(ptr));
  }

  @core.override
  set focusPoint(mapkit_screen_types.ScreenPoint? val) {
    _MapWindow_set_focusPoint(
        ptr, mapkit_screen_types.ScreenPointImpl.toPointer(val));
  }

  @core.override
  mapkit_screen_types.ScreenPoint? get gestureFocusPoint {
    return mapkit_screen_types.ScreenPointImpl.fromPointer(
        _MapWindow_get_gestureFocusPoint(ptr));
  }

  @core.override
  set gestureFocusPoint(mapkit_screen_types.ScreenPoint? val) {
    _MapWindow_set_gestureFocusPoint(
        ptr, mapkit_screen_types.ScreenPointImpl.toPointer(val));
  }

  @core.override
  mapkit_map_gesture_focus_point_mode.GestureFocusPointMode
      get gestureFocusPointMode {
    return mapkit_map_gesture_focus_point_mode.GestureFocusPointModeImpl
        .fromInt(_MapWindow_get_gestureFocusPointMode(ptr));
  }

  @core.override
  set gestureFocusPointMode(
      mapkit_map_gesture_focus_point_mode.GestureFocusPointMode val) {
    _MapWindow_set_gestureFocusPointMode(
        ptr,
        mapkit_map_gesture_focus_point_mode.GestureFocusPointModeImpl.toInt(
            val));
  }

  @core.override
  mapkit_map_point_of_view.PointOfView get pointOfView {
    return mapkit_map_point_of_view.PointOfViewImpl.fromInt(
        _MapWindow_get_pointOfView(ptr));
  }

  @core.override
  set pointOfView(mapkit_map_point_of_view.PointOfView val) {
    _MapWindow_set_pointOfView(
        ptr, mapkit_map_point_of_view.PointOfViewImpl.toInt(val));
  }

  @core.override
  mapkit_map_visible_region.VisibleRegion get focusRegion {
    return mapkit_map_visible_region.VisibleRegionImpl.fromNative(
        _MapWindow_get_focusRegion(ptr));
  }

  @core.override
  core.double get scaleFactor {
    return _MapWindow_get_scaleFactor(ptr);
  }

  @core.override
  set scaleFactor(core.double val) {
    _MapWindow_set_scaleFactor(ptr, val);
  }

  core.int width() {
    return _MapWindow_width(ptr);
  }

  core.int height() {
    return _MapWindow_height(ptr);
  }

  mapkit_screen_types.ScreenPoint? worldToScreen(
      mapkit_geometry_point.Point worldPoint) {
    return mapkit_screen_types.ScreenPointImpl.fromPointer(
        _MapWindow_worldToScreen(
            ptr, mapkit_geometry_point.PointImpl.toNative(worldPoint)));
  }

  mapkit_geometry_point.Point? screenToWorld(
      mapkit_screen_types.ScreenPoint screenPoint) {
    return mapkit_geometry_point.PointImpl.fromPointer(_MapWindow_screenToWorld(
        ptr, mapkit_screen_types.ScreenPointImpl.toNative(screenPoint)));
  }

  void addSizeChangedListener(
      mapkit_map_size_changed_listener.MapSizeChangedListener
          sizeChangedListener) {
    _MapWindow_addSizeChangedListener(
        ptr,
        mapkit_map_size_changed_listener.MapSizeChangedListenerImpl
            .getNativePtr(sizeChangedListener));
  }

  void removeSizeChangedListener(
      mapkit_map_size_changed_listener.MapSizeChangedListener
          sizeChangedListener) {
    _MapWindow_removeSizeChangedListener(
        ptr,
        mapkit_map_size_changed_listener.MapSizeChangedListenerImpl
            .getNativePtr(sizeChangedListener));
  }
}

final _MapWindow_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapWindow_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _MapWindow_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapWindow_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _MapWindow_get_map =
    lib
        .library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_map')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapWindow_get_focusRect = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_focusRect')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_set_focusRect = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_focusRect')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapWindow_get_focusPoint = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_focusPoint')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_set_focusPoint = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_focusPoint')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapWindow_get_gestureFocusPoint = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_gestureFocusPoint')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_set_gestureFocusPoint = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_gestureFocusPoint')
        .asFunction();

final core.int Function(ffi.Pointer<ffi.Void>)
    _MapWindow_get_gestureFocusPointMode = lib.library
        .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_gestureFocusPointMode')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int)
    _MapWindow_set_gestureFocusPointMode = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_gestureFocusPointMode')
        .asFunction();

final core.int Function(ffi.Pointer<ffi.Void>) _MapWindow_get_pointOfView = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapWindow_get_pointOfView')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int)
    _MapWindow_set_pointOfView = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_pointOfView')
        .asFunction();

final mapkit_map_visible_region.VisibleRegionNative Function(
        ffi.Pointer<ffi.Void>) _MapWindow_get_focusRegion =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_visible_region.VisibleRegionNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_focusRegion')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _MapWindow_get_scaleFactor =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_get_scaleFactor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _MapWindow_set_scaleFactor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_MapWindow_set_scaleFactor')
        .asFunction();

final core.int Function(ffi.Pointer<ffi.Void>) _MapWindow_width = lib.library
    .lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapWindow_width')
    .asFunction();
final core.int Function(ffi.Pointer<ffi.Void>) _MapWindow_height = lib.library
    .lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapWindow_height')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)
    _MapWindow_worldToScreen = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                        mapkit_geometry_point.PointNative)>>(
            'yandex_flutter_mapkit_map_MapWindow_worldToScreen')
        .asFunction();
final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.Void>, mapkit_screen_types.ScreenPointNative)
    _MapWindow_screenToWorld = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>,
                        mapkit_screen_types.ScreenPointNative)>>(
            'yandex_flutter_mapkit_map_MapWindow_screenToWorld')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_addSizeChangedListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_addSizeChangedListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_removeSizeChangedListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_removeSizeChangedListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _MapWindow_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_MapWindow_set_')
    .asFunction(isLeaf: true);
