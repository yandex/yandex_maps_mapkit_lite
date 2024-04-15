import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
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
import 'package:yandex_maps_mapkit_lite/src/mapkit/traffic/traffic_listener.dart'
    as mapkit_traffic_traffic_listener;

part 'traffic_layer.containers.dart';

/// A layer with traffic information.
@bindings_annotations.WeakInterface('mapkit.traffic.TrafficLayer')
@bindings_annotations.ContainerData(
    toNative: 'TrafficLayer.getNativePtr',
    toPlatform:
        '(val) => TrafficLayer.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class TrafficLayer implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_TrafficLayer_free.cast());

  /// @nodoc
  TrafficLayer.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  TrafficLayer.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory TrafficLayer.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(TrafficLayer? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _TrafficLayer_check(ptr);
  }

  @internal

  /// @nodoc
  static TrafficLayer? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return TrafficLayer.fromNativePtr(ptr);
  }

  /// Checks if traffic is visible.
  core.bool isTrafficVisible() {
    return _TrafficLayer_isTrafficVisible(ptr);
  }

  /// Sets traffic visibility.
  void setTrafficVisible(core.bool on) {
    _TrafficLayer_setTrafficVisible(ptr, on);
  }

  /// Applies JSON style transformations to the traffic layer. Same as
  /// setTrafficStyle(0, style). Set to empty string to clear previous
  /// styling. Returns true if the style was successfully parsed; false
  /// otherwise. If the return value is false, the current traffic style
  /// remains unchanged.
  core.bool setTrafficStyle(core.String style) {
    return _TrafficLayer_setTrafficStyle(ptr, to_native.toNativeString(style));
  }

  /// Applies JSON style transformations to the traffic layer. Replaces
  /// previous styling with the specified ID (if such exists). Stylings are
  /// applied in an ascending order. Set to empty string to clear previous
  /// styling with the specified ID. Returns true if the style was
  /// successfully parsed; false otherwise. If the return value is false,
  /// the current traffic style remains unchanged.
  core.bool setTrafficStyleWithId({
    required core.int id,
    required core.String style,
  }) {
    return _TrafficLayer_setTrafficStyleWithId(
        ptr, id, to_native.toNativeString(style));
  }

  /// Resets all JSON style transformations applied to the traffic layer.
  void resetTrafficStyles() {
    _TrafficLayer_resetTrafficStyles(ptr);
  }

  /// Adds a traffic listener.
  ///
  /// The class does not retain the object in the 'trafficListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addTrafficListener(
      mapkit_traffic_traffic_listener.TrafficListener trafficListener) {
    _TrafficLayer_addTrafficListener(
        ptr,
        mapkit_traffic_traffic_listener.TrafficListener.getNativePtr(
            trafficListener));
  }

  /// Removes a traffic listener.
  void removeTrafficListener(
      mapkit_traffic_traffic_listener.TrafficListener trafficListener) {
    _TrafficLayer_removeTrafficListener(
        ptr,
        mapkit_traffic_traffic_listener.TrafficListener.getNativePtr(
            trafficListener));
  }
}

final _TrafficLayer_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_traffic_TrafficLayer_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _TrafficLayer_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_traffic_TrafficLayer_check')
    .asFunction(isLeaf: true);

final core.bool Function(ffi.Pointer<ffi.Void>) _TrafficLayer_isTrafficVisible =
    lib
        .library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_traffic_TrafficLayer_isTrafficVisible')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _TrafficLayer_setTrafficVisible = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_traffic_TrafficLayer_setTrafficVisible')
        .asFunction();
final core.bool Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _TrafficLayer_setTrafficStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Bool Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_traffic_TrafficLayer_setTrafficStyle')
        .asFunction();
final core.bool Function(
        ffi.Pointer<ffi.Void>, core.int, native_types.NativeString)
    _TrafficLayer_setTrafficStyleWithId = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Int,
                        native_types.NativeString)>>(
            'yandex_flutter_mapkit_traffic_TrafficLayer_setTrafficStyleWithId')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _TrafficLayer_resetTrafficStyles =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_traffic_TrafficLayer_resetTrafficStyles')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _TrafficLayer_addTrafficListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_traffic_TrafficLayer_addTrafficListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _TrafficLayer_removeTrafficListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_traffic_TrafficLayer_removeTrafficListener')
        .asFunction();
