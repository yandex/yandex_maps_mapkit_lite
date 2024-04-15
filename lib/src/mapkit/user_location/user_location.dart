import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_mapkit_lite/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/object_event.dart'
    as mapkit_layers_object_event;
import 'package:yandex_maps_mapkit_lite/src/mapkit/location/location_view_source.dart'
    as mapkit_location_location_view_source;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/camera_position.dart'
    as mapkit_map_camera_position;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/circle.dart'
    as mapkit_map_circle;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;

part 'user_location.containers.dart';

/// Use this interface to specify the appearance of the user location
/// icon elements.
@bindings_annotations.WeakInterface('mapkit.user_location.UserLocationView')
@bindings_annotations.ContainerData(
    toNative: 'UserLocationView.getNativePtr',
    toPlatform:
        '(val) => UserLocationView.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class UserLocationView implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_UserLocationView_free.cast());

  /// @nodoc
  UserLocationView.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  UserLocationView.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory UserLocationView.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(UserLocationView? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _UserLocationView_check(ptr);
  }

  @internal

  /// @nodoc
  static UserLocationView? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UserLocationView.fromNativePtr(ptr);
  }

  /// Gets the location arrow map object.
  mapkit_map_placemark.PlacemarkMapObject get arrow {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _UserLocationView_get_arrow(ptr));
  }

  /// Gets the location pin map object.
  mapkit_map_placemark.PlacemarkMapObject get pin {
    return mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(
        _UserLocationView_get_pin(ptr));
  }

  /// Gets the GPS accuracy circle map object.
  mapkit_map_circle.CircleMapObject get accuracyCircle {
    return mapkit_map_circle.CircleMapObject.fromNativePtr(
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

/// The type of icon to use.
@bindings_annotations.ContainerData(
    toNative: 'UserLocationIconType.toPointer',
    toPlatform:
        '(val) => UserLocationIconType.fromPointer(val, needFree: false)')
enum UserLocationIconType {
  /// Arrow icon.
  Arrow,

  /// Pin icon.
  Pin,
  ;

  /// @nodoc
  @internal
  static UserLocationIconType fromInt(core.int val) {
    return UserLocationIconType.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(UserLocationIconType e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static UserLocationIconType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(UserLocationIconType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

/// The type of anchor to use.
@bindings_annotations.ContainerData(
    toNative: 'UserLocationAnchorType.toPointer',
    toPlatform:
        '(val) => UserLocationAnchorType.fromPointer(val, needFree: false)')
enum UserLocationAnchorType {
  /// Normal anchor.
  Normal,

  /// Course anchor.
  Course,
  ;

  /// @nodoc
  @internal
  static UserLocationAnchorType fromInt(core.int val) {
    return UserLocationAnchorType.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(UserLocationAnchorType e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static UserLocationAnchorType? fromPointer(ffi.Pointer<ffi.Void> ptr,
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
  static ffi.Pointer<ffi.Void> toPointer(UserLocationAnchorType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

/// This event triggers when the user location icon type is changed.
@bindings_annotations
    .WeakInterface('mapkit.user_location.UserLocationIconChanged')
@bindings_annotations.ContainerData(
    toNative: 'UserLocationIconChanged.getNativePtr',
    toPlatform:
        '(val) => UserLocationIconChanged.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class UserLocationIconChanged extends mapkit_layers_object_event.ObjectEvent
    implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_UserLocationIconChanged_free.cast());

  /// @nodoc
  UserLocationIconChanged.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  UserLocationIconChanged.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory UserLocationIconChanged.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(UserLocationIconChanged? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _UserLocationIconChanged_check(ptr);
  }

  @internal

  /// @nodoc
  static UserLocationIconChanged? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UserLocationIconChanged.fromNativePtr(ptr);
  }

  /// Gets the type of user location icon used.
  UserLocationIconType get iconType {
    return UserLocationIconType.fromInt(
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

/// Event for a change in the user location icon anchor.
@bindings_annotations
    .WeakInterface('mapkit.user_location.UserLocationAnchorChanged')
@bindings_annotations.ContainerData(
    toNative: 'UserLocationAnchorChanged.getNativePtr',
    toPlatform:
        '(val) => UserLocationAnchorChanged.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class UserLocationAnchorChanged extends mapkit_layers_object_event.ObjectEvent
    implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_UserLocationAnchorChanged_free.cast());

  /// @nodoc
  UserLocationAnchorChanged.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  UserLocationAnchorChanged.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory UserLocationAnchorChanged.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(UserLocationAnchorChanged? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _UserLocationAnchorChanged_check(ptr);
  }

  @internal

  /// @nodoc
  static UserLocationAnchorChanged? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UserLocationAnchorChanged.fromNativePtr(ptr);
  }

  /// Gets the type of anchor used.
  UserLocationAnchorType get anchorType {
    return UserLocationAnchorType.fromInt(
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

/// @nodoc
class _UserLocationObjectListenerWrapper implements ffi.Finalizable {
  _UserLocationObjectListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_UserLocationObjectListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// User location events object listener. Use it to customize the user
/// location view. Although some callbacks are unused, the generic
/// structure of the interface is suitable for object layer listeners.
abstract class UserLocationObjectListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<UserLocationObjectListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<UserLocationObjectListener,
      _UserLocationObjectListenerWrapper?>();

  /// Called when the layer object is added. It is called once when the
  /// user location icon appears the first time.
  void onObjectAdded(UserLocationView view);

  /// Called when the layer object is being removed. It is never called for
  /// the user location icon.
  void onObjectRemoved(UserLocationView view);

  /// Called when the layer object is being updated. The 'event' parameter
  /// can be one of the derived types.
  void onObjectUpdated(
      UserLocationView view, mapkit_layers_object_event.ObjectEvent event);

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

  /// @nodoc
  @internal
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
        ffi
            .Pointer<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _UserLocationObjectListener_new = lib.library
        .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>, ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_user_location_UserLocationObjectListener_new')
        .asFunction(isLeaf: true);

final _UserLocationObjectListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_user_location_UserLocationObjectListener_free');
void _UserLocationObjectListener_onObjectAdded(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> view) {
  final listener = UserLocationObjectListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onObjectAdded(UserLocationView.fromNativePtr(view));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _UserLocationObjectListener_onObjectRemoved(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> view) {
  final listener = UserLocationObjectListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onObjectRemoved(UserLocationView.fromNativePtr(view));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _UserLocationObjectListener_onObjectUpdated(ffi.Pointer<ffi.Void> _ptr,
    ffi.Pointer<ffi.Void> view, ffi.Pointer<ffi.Void> event) {
  final listener = UserLocationObjectListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onObjectUpdated(UserLocationView.fromNativePtr(view),
        mapkit_layers_object_event.ObjectEvent.fromNativePtr(event));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

/// @nodoc
class _UserLocationTapListenerWrapper implements ffi.Finalizable {
  _UserLocationTapListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_UserLocationTapListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Triggered by a tap on the user location icon.
abstract class UserLocationTapListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<UserLocationTapListener>>{};
  static final _listenerToPointer = weak_map.WeakMap<UserLocationTapListener,
      _UserLocationTapListenerWrapper?>();

  /// Called when the user taps a location object.
  void onUserLocationObjectTap(mapkit_geometry_point.Point point);

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

  /// @nodoc
  @internal
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
  final listener = UserLocationTapListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener
        .onUserLocationObjectTap(mapkit_geometry_point.Point.fromNative(point));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

/// Use the UserLocationLayer interface to manage the location icon: its
/// appearance, following mode, data source and so on.
@bindings_annotations.WeakInterface('mapkit.user_location.UserLocationLayer')
@bindings_annotations.ContainerData(
    toNative: 'UserLocationLayer.getNativePtr',
    toPlatform:
        '(val) => UserLocationLayer.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class UserLocationLayer implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_UserLocationLayer_free.cast());

  /// @nodoc
  UserLocationLayer.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  UserLocationLayer.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory UserLocationLayer.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(UserLocationLayer? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _UserLocationLayer_check(ptr);
  }

  @internal

  /// @nodoc
  static UserLocationLayer? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return UserLocationLayer.fromNativePtr(ptr);
  }

  /// Enables/disables heading mode. If heading mode is enabled, the map is
  /// rotated. If heading mode is disabled, the location icon is rotated.
  core.bool get headingEnabled {
    return _UserLocationLayer_get_headingEnabled(ptr);
  }

  set headingEnabled(core.bool val) {
    return _UserLocationLayer_set_headingEnabled(ptr, val);
  }

  /// Returns true if anchor mode is set, and false otherwise.
  core.bool get anchorEnabled {
    return _UserLocationLayer_get_anchorEnabled(ptr);
  }

  /// Enables/disables auto zoom.
  core.bool get autoZoomEnabled {
    return _UserLocationLayer_get_autoZoomEnabled(ptr);
  }

  set autoZoomEnabled(core.bool val) {
    return _UserLocationLayer_set_autoZoomEnabled(ptr, val);
  }

  /// Sets user location visibility.
  void setVisible(core.bool on) {
    _UserLocationLayer_setVisible(ptr, on);
  }

  /// Checks if user location is visible.
  core.bool isVisible() {
    return _UserLocationLayer_isVisible(ptr);
  }

  /// Sets the anchor to the specified position in pixels and enables
  /// Anchor mode. (0, 0) denotes the top-left corner of the screen.
  ///
  /// [anchorNormal] The anchor position when the app is not on a steady
  /// course; usually, the center of the screen.
  /// [anchorCourse] An anchor position near the bottom line for steady
  /// course mode.
  void setAnchor(math.Point<core.double> anchorNormal,
      math.Point<core.double> anchorCourse) {
    _UserLocationLayer_setAnchor(ptr, to_native.toNativePoint(anchorNormal),
        to_native.toNativePoint(anchorCourse));
  }

  /// Resets anchor mode.
  void resetAnchor() {
    _UserLocationLayer_resetAnchor(ptr);
  }

  /// Calculates the camera position that projects the current location
  /// into view. If the current location is unknown, returns none. If the
  /// current location is known, returns the camera position that displays
  /// the location position.
  mapkit_map_camera_position.CameraPosition? cameraPosition() {
    return mapkit_map_camera_position.CameraPosition.fromPointer(
        _UserLocationLayer_cameraPosition(ptr));
  }

  /// Sets/gets the data source.
  void setSource(
      mapkit_location_location_view_source.LocationViewSource? source) {
    _UserLocationLayer_setSource(
        ptr,
        mapkit_location_location_view_source.LocationViewSource.getNativePtr(
            source));
  }

  /// Sets the data source with the global location manager
  void setDefaultSource() {
    _UserLocationLayer_setDefaultSource(ptr);
  }

  /// Sets/resets the tap listener.
  ///
  /// The class does not retain the object in the 'tapListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setTapListener(UserLocationTapListener? tapListener) {
    _UserLocationLayer_setTapListener(
        ptr, UserLocationTapListener.getNativePtr(tapListener));
  }

  /// Sets/resets the object listener.
  ///
  /// The class does not retain the object in the 'objectListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setObjectListener(UserLocationObjectListener? objectListener) {
    _UserLocationLayer_setObjectListener(
        ptr, UserLocationObjectListener.getNativePtr(objectListener));
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
