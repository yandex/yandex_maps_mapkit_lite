part of 'map_object.dart';

@bindings_annotations.WeakInterface('mapkit.map.MapObject')
@bindings_annotations.ContainerData(
    toNative: 'MapObjectImpl.getNativePtr',
    toPlatform:
        '(val) => MapObjectImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'MapObject')
class MapObjectImpl implements MapObject, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_MapObject_free.cast());

  /// @nodoc
  MapObjectImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  MapObjectImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory MapObjectImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(MapObject? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as MapObjectImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _MapObject_check(ptr);
  }

  @internal

  /// @nodoc
  static MapObject? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return MapObjectImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_map_base_map_object_collection.BaseMapObjectCollection get parent {
    return mapkit_map_base_map_object_collection.BaseMapObjectCollectionImpl
        .fromNativePtr(_MapObject_get_parent(ptr));
  }

  @core.override
  core.bool get visible {
    return _MapObject_get_visible(ptr);
  }

  @core.override
  set visible(core.bool val) {
    _MapObject_set_visible(ptr, val);
  }

  @core.override
  core.double get zIndex {
    return _MapObject_get_zIndex(ptr);
  }

  @core.override
  set zIndex(core.double val) {
    _MapObject_set_zIndex(ptr, val);
  }

  @core.override
  core.bool get draggable {
    return _MapObject_get_draggable(ptr);
  }

  @core.override
  set draggable(core.bool val) {
    _MapObject_set_draggable(ptr, val);
  }

  void setVisible(
    mapkit_animation.Animation animation, {
    required core.bool visible,
    mapkit_map_callback.Callback? onFinished,
  }) {
    _MapObject_setVisible(
        ptr,
        visible,
        mapkit_animation.AnimationImpl.toNative(animation),
        mapkit_map_callback.CallbackImpl.getNativePtr(onFinished));
  }

  void addTapListener(
      mapkit_map_map_object_tap_listener.MapObjectTapListener tapListener) {
    _MapObject_addTapListener(
        ptr,
        mapkit_map_map_object_tap_listener.MapObjectTapListenerImpl
            .getNativePtr(tapListener));
  }

  void removeTapListener(
      mapkit_map_map_object_tap_listener.MapObjectTapListener tapListener) {
    _MapObject_removeTapListener(
        ptr,
        mapkit_map_map_object_tap_listener.MapObjectTapListenerImpl
            .getNativePtr(tapListener));
  }

  void setDragListener(
      mapkit_map_map_object_drag_listener.MapObjectDragListener? dragListener) {
    _MapObject_setDragListener(
        ptr,
        mapkit_map_map_object_drag_listener.MapObjectDragListenerImpl
            .getNativePtr(dragListener));
  }

  core.bool _setUserDataHolder = false;

  @core.override
  core.Object? get userData => platform_user_data.platformUserData[_getId()];

  @core.override
  set userData(core.Object? val) {
    final nativeId = _getId();
    if (nativeId != null) {
      if (!_setUserDataHolder) {
        _MapObject_setuserData(
            ptr, nativeBinding.createInterfaceDestructedPort());
        _setUserDataHolder = true;
      }
      if (val != null) {
        platform_user_data.platformUserData[nativeId] = val;
      } else {
        platform_user_data.platformUserData.remove(nativeId);
      }
    }
  }

  core.int? _getId() {
    final id = _MapObject_native_id(ptr);
    return id == 0 ? null : id;
  }
}

final _MapObject_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObject_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _MapObject_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObject_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _MapObject_get_parent = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObject_get_parent')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _MapObject_get_visible = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObject_get_visible')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool) _MapObject_set_visible =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_MapObject_set_visible')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _MapObject_get_zIndex = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObject_get_zIndex')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double) _MapObject_set_zIndex =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_MapObject_set_zIndex')
        .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _MapObject_get_draggable = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObject_get_draggable')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool) _MapObject_set_draggable =
    lib
        .library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_map_MapObject_set_draggable')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, core.bool,
        mapkit_animation.AnimationNative, ffi.Pointer<ffi.Void>)
    _MapObject_setVisible = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>,
                        ffi.Bool,
                        mapkit_animation.AnimationNative,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObject_setVisible')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapObject_addTapListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObject_addTapListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapObject_removeTapListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObject_removeTapListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _MapObject_setDragListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_MapObject_setDragListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _MapObject_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_MapObject_set_')
    .asFunction(isLeaf: true);
final core.int Function(ffi.Pointer<ffi.Void>) _MapObject_native_id = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Uint64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_MapObject_native_id')
    .asFunction(isLeaf: true);
final void Function(ffi.Pointer<ffi.Void>, core.int) _MapObject_setuserData =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_MapObject_set_userData')
        .asFunction(isLeaf: true);
