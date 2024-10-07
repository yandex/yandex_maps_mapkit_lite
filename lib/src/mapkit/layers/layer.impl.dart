part of 'layer.dart';

@bindings_annotations.WeakInterface('mapkit.layers.Layer')
@bindings_annotations.ContainerData(
    toNative: 'LayerImpl.getNativePtr',
    toPlatform:
        '(val) => LayerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Layer')
class LayerImpl implements Layer, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Layer_free.cast());

  /// @nodoc
  LayerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  LayerImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory LayerImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Layer? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as LayerImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _Layer_check(ptr);
  }

  @internal

  /// @nodoc
  static Layer? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LayerImpl.fromNativePtr(ptr);
  }

  void remove() {
    _Layer_remove(ptr);
    exception.checkCallResult();
  }

  mapkit_layers_data_source_layer.DataSourceLayer dataSourceLayer() {
    final result = _Layer_dataSourceLayer(ptr);
    exception.checkCallResult();
    return mapkit_layers_data_source_layer.DataSourceLayerImpl.fromNativePtr(
        result);
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
final void Function(ffi.Pointer<ffi.Void>, core.int) _Layer_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_layers_Layer_set_')
    .asFunction(isLeaf: true);
