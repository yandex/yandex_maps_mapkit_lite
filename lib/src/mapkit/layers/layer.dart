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
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/data_source_layer.dart'
    as mapkit_layers_data_source_layer;

part 'layer.containers.dart';

/// Interface for working with the layer.
@bindings_annotations.WeakInterface('mapkit.layers.Layer')
@bindings_annotations.ContainerData(
    toNative: 'Layer.getNativePtr',
    toPlatform:
        '(val) => Layer.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class Layer implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Layer_free.cast());

  /// @nodoc
  Layer.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  Layer.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory Layer.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Layer? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _Layer_check(ptr);
  }

  @internal

  /// @nodoc
  static Layer? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return Layer.fromNativePtr(ptr);
  }

  /// Removes the layer from the map. The object becomes invalid after
  /// that.
  void remove() {
    _Layer_remove(ptr);
  }

  mapkit_layers_data_source_layer.DataSourceLayer dataSourceLayer() {
    return mapkit_layers_data_source_layer.DataSourceLayer.fromNativePtr(
        _Layer_dataSourceLayer(ptr));
  }
}

final _Layer_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_Layer_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Layer_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_Layer_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>) _Layer_remove = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_Layer_remove')
    .asFunction();
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _Layer_dataSourceLayer = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_layers_Layer_dataSourceLayer')
        .asFunction();
