part of 'user_location.dart';

@bindings_annotations.WeakInterface('mapkit.user_location.UserLocationView')
@bindings_annotations.ContainerData(
    toNative: 'UserLocationViewImpl.getNativePtr',
    toPlatform:
        '(val) => UserLocationViewImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'UserLocationView')
class UserLocationViewImpl implements UserLocationView, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_UserLocationView_free.cast());

  /// @nodoc
  UserLocationViewImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  UserLocationViewImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory UserLocationViewImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(UserLocationView? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as UserLocationViewImpl).ptr;
  }

  core.bool isValid() {
    return _UserLocationView_check(ptr);
  }

  @internal

  /// @nodoc
  static UserLocationView? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UserLocationViewImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_map_placemark.PlacemarkMapObject get arrow {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _UserLocationView_get_arrow(ptr));
  }

  @core.override
  mapkit_map_placemark.PlacemarkMapObject get pin {
    return mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(
        _UserLocationView_get_pin(ptr));
  }

  @core.override
  mapkit_map_circle.CircleMapObject get accuracyCircle {
    return mapkit_map_circle.CircleMapObjectImpl.fromNativePtr(
        _UserLocationView_get_accuracyCircle(ptr));
  }
}

final _UserLocationView_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationView_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _UserLocationView_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationView_check')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _UserLocationView_get_arrow = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_user_location_UserLocationView_get_arrow')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _UserLocationView_get_pin = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_user_location_UserLocationView_get_pin')
        .asFunction();

final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _UserLocationView_get_accuracyCircle = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationView_get_accuracyCircle')
    .asFunction();

@bindings_annotations.ContainerData(
    toNative: 'UserLocationIconTypeImpl.toPointer',
    toPlatform:
        '(val) => UserLocationIconTypeImpl.fromPointer(val, needFree: false)',
    platformType: 'UserLocationIconType')
extension UserLocationIconTypeImpl on UserLocationIconType {
  static core.int toInt(UserLocationIconType e) {
    return e.index;
  }

  static UserLocationIconType fromInt(core.int val) {
    return UserLocationIconType.values[val];
  }

  static UserLocationIconType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(UserLocationIconType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'UserLocationAnchorTypeImpl.toPointer',
    toPlatform:
        '(val) => UserLocationAnchorTypeImpl.fromPointer(val, needFree: false)',
    platformType: 'UserLocationAnchorType')
extension UserLocationAnchorTypeImpl on UserLocationAnchorType {
  static core.int toInt(UserLocationAnchorType e) {
    return e.index;
  }

  static UserLocationAnchorType fromInt(core.int val) {
    return UserLocationAnchorType.values[val];
  }

  static UserLocationAnchorType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(UserLocationAnchorType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

@bindings_annotations
    .WeakInterface('mapkit.user_location.UserLocationIconChanged')
@bindings_annotations.ContainerData(
    toNative: 'UserLocationIconChangedImpl.getNativePtr',
    toPlatform:
        '(val) => UserLocationIconChangedImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'UserLocationIconChanged')
class UserLocationIconChangedImpl extends mapkit_layers_object_event
    .ObjectEventImpl implements UserLocationIconChanged, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_UserLocationIconChanged_free.cast());

  /// @nodoc
  UserLocationIconChangedImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  UserLocationIconChangedImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory UserLocationIconChangedImpl.fromNativePtr(
          ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(UserLocationIconChanged? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as UserLocationIconChangedImpl).ptr;
  }

  core.bool isValid() {
    return _UserLocationIconChanged_check(ptr);
  }

  @internal

  /// @nodoc
  static UserLocationIconChanged? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UserLocationIconChangedImpl.fromNativePtr(ptr);
  }

  @core.override
  UserLocationIconType get iconType {
    return UserLocationIconTypeImpl.fromInt(
        _UserLocationIconChanged_get_iconType(ptr));
  }
}

final _UserLocationIconChanged_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationIconChanged_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _UserLocationIconChanged_check =
    lib
        .library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_user_location_UserLocationIconChanged_check')
        .asFunction(isLeaf: true);

final core.int Function(
    ffi
        .Pointer<ffi.Void>) _UserLocationIconChanged_get_iconType = lib.library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationIconChanged_get_iconType')
    .asFunction();

@bindings_annotations
    .WeakInterface('mapkit.user_location.UserLocationAnchorChanged')
@bindings_annotations.ContainerData(
    toNative: 'UserLocationAnchorChangedImpl.getNativePtr',
    toPlatform:
        '(val) => UserLocationAnchorChangedImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'UserLocationAnchorChanged')
class UserLocationAnchorChangedImpl extends mapkit_layers_object_event
    .ObjectEventImpl implements UserLocationAnchorChanged, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_UserLocationAnchorChanged_free.cast());

  /// @nodoc
  UserLocationAnchorChangedImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  UserLocationAnchorChangedImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory UserLocationAnchorChangedImpl.fromNativePtr(
          ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(UserLocationAnchorChanged? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as UserLocationAnchorChangedImpl).ptr;
  }

  core.bool isValid() {
    return _UserLocationAnchorChanged_check(ptr);
  }

  @internal

  /// @nodoc
  static UserLocationAnchorChanged? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UserLocationAnchorChangedImpl.fromNativePtr(ptr);
  }

  @core.override
  UserLocationAnchorType get anchorType {
    return UserLocationAnchorTypeImpl.fromInt(
        _UserLocationAnchorChanged_get_anchorType(ptr));
  }
}

final _UserLocationAnchorChanged_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationAnchorChanged_free');
final core.bool Function(
    ffi
        .Pointer<ffi.Void>) _UserLocationAnchorChanged_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationAnchorChanged_check')
    .asFunction(isLeaf: true);

final core.int Function(
    ffi
        .Pointer<ffi.Void>) _UserLocationAnchorChanged_get_anchorType = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationAnchorChanged_get_anchorType')
    .asFunction();

final class _UserLocationObjectListenerWrapper implements ffi.Finalizable {
  _UserLocationObjectListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_UserLocationObjectListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension UserLocationObjectListenerImpl on UserLocationObjectListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<UserLocationObjectListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<UserLocationObjectListener,
      _UserLocationObjectListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(
      UserLocationObjectListener obj) {
    final ptr = _UserLocationObjectListener_new(
        ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _UserLocationObjectListener_onObjectAdded),
        ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _UserLocationObjectListener_onObjectRemoved),
        ffi.Pointer.fromFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
                    ffi.Pointer<ffi.Void>)>(
            _UserLocationObjectListener_onObjectUpdated));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _UserLocationObjectListenerWrapper(ptr);
    _UserLocationObjectListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(UserLocationObjectListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _UserLocationObjectListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_user_location_UserLocationObjectListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<
            ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _UserLocationObjectListener_new = lib.library
        .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_user_location_UserLocationObjectListener_new')
        .asFunction(isLeaf: true);

final _UserLocationObjectListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationObjectListener_free');
void _UserLocationObjectListener_onObjectAdded(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> view) {
  final listener =
      UserLocationObjectListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onObjectAdded(UserLocationViewImpl.fromNativePtr(view));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _UserLocationObjectListener_onObjectRemoved(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> view) {
  final listener =
      UserLocationObjectListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onObjectRemoved(UserLocationViewImpl.fromNativePtr(view));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _UserLocationObjectListener_onObjectUpdated(ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> view, ffi.Pointer<ffi.Void> event) {
  final listener =
      UserLocationObjectListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onObjectUpdated(UserLocationViewImpl.fromNativePtr(view),
        mapkit_layers_object_event.ObjectEventImpl.fromNativePtr(event));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

final class _UserLocationTapListenerWrapper implements ffi.Finalizable {
  _UserLocationTapListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_UserLocationTapListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension UserLocationTapListenerImpl on UserLocationTapListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<UserLocationTapListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<UserLocationTapListener,
      _UserLocationTapListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(UserLocationTapListener obj) {
    final ptr = _UserLocationTapListener_new(ffi.Pointer.fromFunction<
            ffi.Void Function(
                ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)>(
        _UserLocationTapListener_onUserLocationObjectTap));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _UserLocationTapListenerWrapper(ptr);
    _UserLocationTapListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(UserLocationTapListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _UserLocationTapListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_user_location_UserLocationTapListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)>>)
    _UserLocationTapListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, mapkit_geometry_point.PointNative)>>)>>(
            'yandex_flutter_mapkit_user_location_UserLocationTapListener_new')
        .asFunction(isLeaf: true);

final _UserLocationTapListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationTapListener_free');
void _UserLocationTapListener_onUserLocationObjectTap(
    ffi.Pointer<ffi.Void> _ptr, mapkit_geometry_point.PointNative point) {
  final listener = UserLocationTapListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onUserLocationObjectTap(
        mapkit_geometry_point.PointImpl.fromNative(point));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

@bindings_annotations.WeakInterface('mapkit.user_location.UserLocationLayer')
@bindings_annotations.ContainerData(
    toNative: 'UserLocationLayerImpl.getNativePtr',
    toPlatform:
        '(val) => UserLocationLayerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'UserLocationLayer')
class UserLocationLayerImpl implements UserLocationLayer, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_UserLocationLayer_free.cast());

  /// @nodoc
  UserLocationLayerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  UserLocationLayerImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory UserLocationLayerImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(UserLocationLayer? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as UserLocationLayerImpl).ptr;
  }

  core.bool isValid() {
    return _UserLocationLayer_check(ptr);
  }

  @internal

  /// @nodoc
  static UserLocationLayer? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UserLocationLayerImpl.fromNativePtr(ptr);
  }

  @core.override
  core.bool get headingEnabled {
    return _UserLocationLayer_get_headingEnabled(ptr);
  }

  @core.override
  set headingEnabled(core.bool val) {
    _UserLocationLayer_set_headingEnabled(ptr, val);
  }

  @core.override
  core.bool get anchorEnabled {
    return _UserLocationLayer_get_anchorEnabled(ptr);
  }

  @core.override
  core.bool get autoZoomEnabled {
    return _UserLocationLayer_get_autoZoomEnabled(ptr);
  }

  @core.override
  set autoZoomEnabled(core.bool val) {
    _UserLocationLayer_set_autoZoomEnabled(ptr, val);
  }

  void setVisible(core.bool on) {
    _UserLocationLayer_setVisible(ptr, on);
  }

  core.bool isVisible() {
    return _UserLocationLayer_isVisible(ptr);
  }

  void setAnchor(math.Point<core.double> anchorNormal,
      math.Point<core.double> anchorCourse) {
    _UserLocationLayer_setAnchor(ptr, to_native.toNativePoint(anchorNormal),
        to_native.toNativePoint(anchorCourse));
  }

  void resetAnchor() {
    _UserLocationLayer_resetAnchor(ptr);
  }

  mapkit_map_camera_position.CameraPosition? cameraPosition() {
    return mapkit_map_camera_position.CameraPositionImpl.fromPointer(
        _UserLocationLayer_cameraPosition(ptr));
  }

  void setSource(
      mapkit_location_location_view_source.LocationViewSource? source) {
    _UserLocationLayer_setSource(
        ptr,
        mapkit_location_location_view_source.LocationViewSourceImpl
            .getNativePtr(source));
  }

  void setDefaultSource() {
    _UserLocationLayer_setDefaultSource(ptr);
  }

  void setTapListener(UserLocationTapListener? tapListener) {
    _UserLocationLayer_setTapListener(
        ptr, UserLocationTapListenerImpl.getNativePtr(tapListener));
  }

  void setObjectListener(UserLocationObjectListener? objectListener) {
    _UserLocationLayer_setObjectListener(
        ptr, UserLocationObjectListenerImpl.getNativePtr(objectListener));
  }
}

final _UserLocationLayer_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _UserLocationLayer_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_check')
    .asFunction(isLeaf: true);

final core.bool Function(
    ffi
        .Pointer<ffi.Void>) _UserLocationLayer_get_headingEnabled = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_get_headingEnabled')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core
        .bool) _UserLocationLayer_set_headingEnabled = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_set_headingEnabled')
    .asFunction();

final core.bool Function(
    ffi
        .Pointer<ffi.Void>) _UserLocationLayer_get_anchorEnabled = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_get_anchorEnabled')
    .asFunction();

final core.bool Function(
    ffi
        .Pointer<ffi.Void>) _UserLocationLayer_get_autoZoomEnabled = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_get_autoZoomEnabled')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    core
        .bool) _UserLocationLayer_set_autoZoomEnabled = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_set_autoZoomEnabled')
    .asFunction();

final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _UserLocationLayer_setVisible = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_user_location_UserLocationLayer_setVisible')
        .asFunction();
final core.bool Function(ffi.Pointer<ffi.Void>) _UserLocationLayer_isVisible =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_user_location_UserLocationLayer_isVisible')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativePoint,
        native_types.NativePoint) _UserLocationLayer_setAnchor =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        native_types.NativePoint, native_types.NativePoint)>>(
            'yandex_flutter_mapkit_user_location_UserLocationLayer_setAnchor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _UserLocationLayer_resetAnchor = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_resetAnchor')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(
    ffi
        .Pointer<ffi.Void>) _UserLocationLayer_cameraPosition = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_cameraPosition')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _UserLocationLayer_setSource = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_user_location_UserLocationLayer_setSource')
        .asFunction();
final void Function(
    ffi
        .Pointer<ffi.Void>) _UserLocationLayer_setDefaultSource = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_setDefaultSource')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _UserLocationLayer_setTapListener = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_setTapListener')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _UserLocationLayer_setObjectListener = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationLayer_setObjectListener')
    .asFunction();
