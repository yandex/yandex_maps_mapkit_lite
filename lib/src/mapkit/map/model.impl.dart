part of 'model.dart';

@bindings_annotations.WeakInterface('mapkit.map.Model')
@bindings_annotations.ContainerData(
    toNative: 'ModelImpl.getNativePtr',
    toPlatform:
        '(val) => ModelImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Model')
class ModelImpl implements Model, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Model_free.cast());

  /// @nodoc
  ModelImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  ModelImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory ModelImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Model? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as ModelImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _Model_check(ptr);
  }

  @internal

  /// @nodoc
  static Model? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return ModelImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_map_model_style.ModelStyle get modelStyle {
    final result = _Model_get_modelStyle(ptr);
    exception.checkCallResult();
    return mapkit_map_model_style.ModelStyleImpl.fromNative(result);
  }

  @core.override
  set modelStyle(mapkit_map_model_style.ModelStyle val) {
    _Model_set_modelStyle(
        ptr, mapkit_map_model_style.ModelStyleImpl.toNative(val));
    exception.checkCallResult();
  }

  void setData(
      runtime_data_provider_with_id.DataProviderWithId gltfDataProvider,
      mapkit_map_callback.Callback onFinished) {
    _Model_setData(
        ptr,
        runtime_data_provider_with_id.DataProviderWithIdImpl.getNativePtr(
            gltfDataProvider),
        mapkit_map_callback.CallbackImpl.getNativePtr(onFinished));
    exception.checkCallResult();
  }
}

final _Model_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Model_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Model_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Model_check')
    .asFunction(isLeaf: true);

final mapkit_map_model_style.ModelStyleNative Function(ffi.Pointer<ffi.Void>)
    _Model_get_modelStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_model_style.ModelStyleNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Model_get_modelStyle')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_map_model_style.ModelStyleNative)
    _Model_set_modelStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_map_model_style.ModelStyleNative)>>(
            'yandex_flutter_mapkit_map_Model_set_modelStyle')
        .asFunction();

final void Function(
        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Model_setData = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Model_setData')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _Model_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_Model_set_')
    .asFunction(isLeaf: true);
