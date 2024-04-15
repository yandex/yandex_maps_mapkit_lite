import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;

part 'object_event.containers.dart';

/// Base abstract class for an object event. Layers that produce object
/// event callbacks need to provide derived event classes.
@bindings_annotations.WeakInterface('mapkit.layers.ObjectEvent')
@bindings_annotations.ContainerData(
    toNative: 'ObjectEvent.getNativePtr',
    toPlatform:
        '(val) => ObjectEvent.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class ObjectEvent implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_ObjectEvent_free.cast());

  /// @nodoc
  ObjectEvent.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  ObjectEvent.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory ObjectEvent.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(ObjectEvent? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _ObjectEvent_check(ptr);
  }

  @internal

  /// @nodoc
  static ObjectEvent? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return ObjectEvent.fromNativePtr(ptr);
  }
}

final _ObjectEvent_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_ObjectEvent_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _ObjectEvent_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_ObjectEvent_check')
    .asFunction(isLeaf: true);
