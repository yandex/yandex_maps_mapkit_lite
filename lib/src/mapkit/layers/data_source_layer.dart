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
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/data_source.dart'
    as mapkit_layers_data_source;
import 'package:yandex_maps_mapkit_lite/src/mapkit/layers/layer_loaded_listener.dart'
    as mapkit_layers_layer_loaded_listener;

part 'data_source_layer.containers.dart';

@bindings_annotations.WeakInterface('mapkit.layers.DataSourceLayer')
@bindings_annotations.ContainerData(
    toNative: 'DataSourceLayer.getNativePtr',
    toPlatform:
        '(val) => DataSourceLayer.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class DataSourceLayer implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_DataSourceLayer_free.cast());

  /// @nodoc
  DataSourceLayer.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  DataSourceLayer.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory DataSourceLayer.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DataSourceLayer? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _DataSourceLayer_check(ptr);
  }

  @internal

  /// @nodoc
  static DataSourceLayer? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DataSourceLayer.fromNativePtr(ptr);
  }

  /// Manages visibility of the layer.
  core.bool get active {
    return _DataSourceLayer_get_active(ptr);
  }

  set active(core.bool val) {
    return _DataSourceLayer_set_active(ptr, val);
  }

  /// TODO: should be removed when
  /// https://st.yandex-team.ru/MAPSMOBCORE-16640 is done
  ///
  /// Invalidates data source and reloads all tiles. Must not be called if
  /// DataSource does not support versioning: LayerOptions.versionSupport =
  /// false;
  ///
  /// This method may be called on any thread. Its implementation must be thread-safe.
  void invalidate(core.String version) {
    _DataSourceLayer_invalidate(ptr, to_native.toNativeString(version));
  }

  /// Clears all cached tiles and starts new requests for tiles that are
  /// displayed.
  void clear() {
    _DataSourceLayer_clear(ptr);
  }

  /// Applies JSON style transformation to the layer. Replaces previous
  /// styling with the specified ID (if such exists). Stylings are applied
  /// in an ascending order. Set to empty string to clear previous styling
  /// with the specified ID. Returns true if the style was successfully
  /// parsed and false otherwise. If the returned value is false, the
  /// current style remains unchanged.
  core.bool setStyle({
    required core.int id,
    required core.String style,
  }) {
    return _DataSourceLayer_setStyle(ptr, id, to_native.toNativeString(style));
  }

  /// Resets all JSON style transformations applied to the layer.
  void resetStyles() {
    _DataSourceLayer_resetStyles(ptr);
  }

  /// Sets layer loaded listener.
  ///
  /// The class does not retain the object in the 'layerLoadedListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setLayerLoadedListener(
      mapkit_layers_layer_loaded_listener.LayerLoadedListener?
          layerLoadedListener) {
    _DataSourceLayer_setLayerLoadedListener(
        ptr,
        mapkit_layers_layer_loaded_listener.LayerLoadedListener.getNativePtr(
            layerLoadedListener));
  }

  /// Removes the data source layer from the parent layer. The object
  /// becomes invalid after that.
  void remove() {
    _DataSourceLayer_remove(ptr);
  }

  /// Sets data source listener. Use it to invalidate data source.
  ///
  /// The class does not retain the object in the 'dataSourceListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setDataSourceListener(
      mapkit_layers_data_source.DataSourceListener? dataSourceListener) {
    _DataSourceLayer_setDataSourceListener(
        ptr,
        mapkit_layers_data_source.DataSourceListener.getNativePtr(
            dataSourceListener));
  }
}

final _DataSourceLayer_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSourceLayer_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _DataSourceLayer_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSourceLayer_check')
    .asFunction(isLeaf: true);

final core.bool Function(ffi.Pointer<ffi.Void>) _DataSourceLayer_get_active =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_layers_DataSourceLayer_get_active')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _DataSourceLayer_set_active = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'yandex_flutter_mapkit_layers_DataSourceLayer_set_active')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _DataSourceLayer_invalidate = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_layers_DataSourceLayer_invalidate')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _DataSourceLayer_clear = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSourceLayer_clear')
    .asFunction();
final core.bool Function(
        ffi.Pointer<ffi.Void>, core.int, native_types.NativeString)
    _DataSourceLayer_setStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Int,
                        native_types.NativeString)>>(
            'yandex_flutter_mapkit_layers_DataSourceLayer_setStyle')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _DataSourceLayer_resetStyles = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSourceLayer_resetStyles')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _DataSourceLayer_setLayerLoadedListener = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSourceLayer_setLayerLoadedListener')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _DataSourceLayer_remove = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSourceLayer_remove')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _DataSourceLayer_setDataSourceListener = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSourceLayer_setDataSourceListener')
    .asFunction();
