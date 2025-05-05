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
    final result = _MapWindow_get_map(ptr);
    exception.checkCallResult();
    return mapkit_map_map.MapImpl.fromNativePtr(result);
  }

  @core.override
  mapkit_screen_types.ScreenRect? get focusRect {
    final result = _MapWindow_get_focusRect(ptr);
    exception.checkCallResult();
    return mapkit_screen_types.ScreenRectImpl.fromPointer(result);
  }

  @core.override
  set focusRect(mapkit_screen_types.ScreenRect? val) {
    _MapWindow_set_focusRect(
        ptr, mapkit_screen_types.ScreenRectImpl.toPointer(val));
    exception.checkCallResult();
  }

  @core.override
  mapkit_screen_types.ScreenPoint? get focusPoint {
    final result = _MapWindow_get_focusPoint(ptr);
    exception.checkCallResult();
    return mapkit_screen_types.ScreenPointImpl.fromPointer(result);
  }

  @core.override
  set focusPoint(mapkit_screen_types.ScreenPoint? val) {
    _MapWindow_set_focusPoint(
        ptr, mapkit_screen_types.ScreenPointImpl.toPointer(val));
    exception.checkCallResult();
  }

  @core.override
  mapkit_screen_types.ScreenPoint? get gestureFocusPoint {
    final result = _MapWindow_get_gestureFocusPoint(ptr);
    exception.checkCallResult();
    return mapkit_screen_types.ScreenPointImpl.fromPointer(result);
  }

  @core.override
  set gestureFocusPoint(mapkit_screen_types.ScreenPoint? val) {
    _MapWindow_set_gestureFocusPoint(
        ptr, mapkit_screen_types.ScreenPointImpl.toPointer(val));
    exception.checkCallResult();
  }

  @core.override
  mapkit_map_gesture_focus_point_mode.GestureFocusPointMode
      get gestureFocusPointMode {
    final result = _MapWindow_get_gestureFocusPointMode(ptr);
    exception.checkCallResult();
    return mapkit_map_gesture_focus_point_mode.GestureFocusPointModeImpl
        .fromInt(result);
  }

  @core.override
  set gestureFocusPointMode(
      mapkit_map_gesture_focus_point_mode.GestureFocusPointMode val) {
    _MapWindow_set_gestureFocusPointMode(
        ptr,
        mapkit_map_gesture_focus_point_mode.GestureFocusPointModeImpl.toInt(
            val));
    exception.checkCallResult();
  }

  @core.override
  mapkit_map_point_of_view.PointOfView get pointOfView {
    final result = _MapWindow_get_pointOfView(ptr);
    exception.checkCallResult();
    return mapkit_map_point_of_view.PointOfViewImpl.fromInt(result);
  }

  @core.override
  set pointOfView(mapkit_map_point_of_view.PointOfView val) {
    _MapWindow_set_pointOfView(
        ptr, mapkit_map_point_of_view.PointOfViewImpl.toInt(val));
    exception.checkCallResult();
  }

  @core.override
  mapkit_map_visible_region.VisibleRegion get focusRegion {
    final result = _MapWindow_get_focusRegion(ptr);
    exception.checkCallResult();
    return mapkit_map_visible_region.VisibleRegionImpl.fromNative(result);
  }

  @core.override
  core.double get scaleFactor {
    final result = _MapWindow_get_scaleFactor(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set scaleFactor(core.double val) {
    _MapWindow_set_scaleFactor(ptr, val);
    exception.checkCallResult();
  }

  core.int width() {
    final result = _MapWindow_width(ptr);
    exception.checkCallResult();
    return result;
  }

  core.int height() {
    final result = _MapWindow_height(ptr);
    exception.checkCallResult();
    return result;
  }

  mapkit_screen_types.ScreenPoint? worldToScreen(
      mapkit_geometry_point.Point worldPoint) {
    final result = _MapWindow_worldToScreen(
        ptr, mapkit_geometry_point.PointImpl.toNative(worldPoint));
    exception.checkCallResult();
    return mapkit_screen_types.ScreenPointImpl.fromPointer(result);
  }

  mapkit_geometry_point.Point? screenToWorld(
      mapkit_screen_types.ScreenPoint screenPoint) {
    final result = _MapWindow_screenToWorld(
        ptr, mapkit_screen_types.ScreenPointImpl.toNative(screenPoint));
    exception.checkCallResult();
    return mapkit_geometry_point.PointImpl.fromPointer(result);
  }

  void addSizeChangedListener(
      mapkit_map_size_changed_listener.MapSizeChangedListener
          sizeChangedListener) {
    _MapWindow_addSizeChangedListener(
        ptr,
        mapkit_map_size_changed_listener.MapSizeChangedListenerImpl
            .getNativePtr(sizeChangedListener));
    exception.checkCallResult();
  }

  void removeSizeChangedListener(
      mapkit_map_size_changed_listener.MapSizeChangedListener
          sizeChangedListener) {
    _MapWindow_removeSizeChangedListener(
        ptr,
        mapkit_map_size_changed_listener.MapSizeChangedListenerImpl
            .getNativePtr(sizeChangedListener));
    exception.checkCallResult();
  }

  void setMaxFps(core.double fps) {
    _MapWindow_setMaxFps(ptr, fps);
    exception.checkCallResult();
  }

  void startPerformanceMetricsCapture() {
    _MapWindow_startPerformanceMetricsCapture(ptr);
    exception.checkCallResult();
  }

  core.String stopPerformanceMetricsCapture() {
    final result = _MapWindow_stopPerformanceMetricsCapture(ptr);
    exception.checkCallResult();
    return to_platform.toPlatformString(result);
  }

  void startMemoryMetricsCapture() {
    _MapWindow_startMemoryMetricsCapture(ptr);
    exception.checkCallResult();
  }

  core.String stopMemoryMetricsCapture() {
    final result = _MapWindow_stopMemoryMetricsCapture(ptr);
    exception.checkCallResult();
    return to_platform.toPlatformString(result);
  }

  void addSurface(runtime_view_surface.Surface surface) {
    _MapWindow_addSurface(
        ptr, runtime_view_surface.SurfaceImpl.getNativePtr(surface));
    exception.checkCallResult();
  }

  void removeSurface(runtime_view_surface.Surface surface) {
    _MapWindow_removeSurface(
        ptr, runtime_view_surface.SurfaceImpl.getNativePtr(surface));
    exception.checkCallResult();
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
final void Function(ffi.Pointer<ffi.Void>, core.double) _MapWindow_setMaxFps =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_MapWindow_setMaxFps')
        .asFunction();
final void Function(
    ffi
        .Pointer<ffi.Void>) _MapWindow_startPerformanceMetricsCapture = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapWindow_startPerformanceMetricsCapture')
    .asFunction();
final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _MapWindow_stopPerformanceMetricsCapture = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_stopPerformanceMetricsCapture')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>)
    _MapWindow_startMemoryMetricsCapture = lib.library
        .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_startMemoryMetricsCapture')
        .asFunction();
final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _MapWindow_stopMemoryMetricsCapture = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_stopMemoryMetricsCapture')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_addSurface = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_addSurface')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapWindow_removeSurface = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapWindow_removeSurface')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _MapWindow_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_MapWindow_set_')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'OffscreenMapWindowImpl.getNativePtr',
    toPlatform:
        '(val) => OffscreenMapWindowImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'OffscreenMapWindow')
class OffscreenMapWindowImpl implements OffscreenMapWindow, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_OffscreenMapWindow_free.cast());

  /// @nodoc
  OffscreenMapWindowImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  OffscreenMapWindowImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(OffscreenMapWindow? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as OffscreenMapWindowImpl).ptr;
  }

  @internal

  /// @nodoc
  static OffscreenMapWindow? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return OffscreenMapWindowImpl.fromNativePtr(ptr);
  }

  @core.override
  MapWindow get mapWindow {
    final result = _OffscreenMapWindow_get_mapWindow(ptr);
    return MapWindowImpl.fromNativePtr(result);
  }

  image_wrapper.ImageWrapper captureScreenshot() {
    final result = _OffscreenMapWindow_captureScreenshot(ptr);
    return to_platform.toPlatformBitmap(result);
  }
}

final _OffscreenMapWindow_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_OffscreenMapWindow_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _OffscreenMapWindow_get_mapWindow = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_OffscreenMapWindow_get_mapWindow')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _OffscreenMapWindow_captureScreenshot = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_OffscreenMapWindow_captureScreenshot')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _OffscreenMapWindow_set =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_OffscreenMapWindow_set_')
        .asFunction(isLeaf: true);
