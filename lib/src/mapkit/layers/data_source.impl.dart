part of 'data_source.dart';

@bindings_annotations.WeakInterface('mapkit.layers.BaseDataSource')
@bindings_annotations.ContainerData(
    toNative: 'BaseDataSourceImpl.getNativePtr',
    toPlatform:
        '(val) => BaseDataSourceImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'BaseDataSource')
class BaseDataSourceImpl implements BaseDataSource, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_BaseDataSource_free.cast());

  /// @nodoc
  BaseDataSourceImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  BaseDataSourceImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory BaseDataSourceImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(BaseDataSource? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as BaseDataSourceImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _BaseDataSource_check(ptr);
  }

  @internal

  /// @nodoc
  static BaseDataSource? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return BaseDataSourceImpl.fromNativePtr(ptr);
  }

  @core.override
  core.String get id {
    final result = _BaseDataSource_get_id(ptr);
    exception.checkCallResult();
    return to_platform.toPlatformString(result);
  }
}

final _BaseDataSource_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_BaseDataSource_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _BaseDataSource_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_BaseDataSource_check')
    .asFunction(isLeaf: true);

final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _BaseDataSource_get_id = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_layers_BaseDataSource_get_id')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, core.int) _BaseDataSource_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_layers_BaseDataSource_set_')
    .asFunction(isLeaf: true);

@bindings_annotations.WeakInterface('mapkit.layers.TileDataSource')
@bindings_annotations.ContainerData(
    toNative: 'TileDataSourceImpl.getNativePtr',
    toPlatform:
        '(val) => TileDataSourceImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'TileDataSource')
class TileDataSourceImpl extends BaseDataSourceImpl
    implements TileDataSource, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_TileDataSource_free.cast());

  /// @nodoc
  TileDataSourceImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  TileDataSourceImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory TileDataSourceImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(TileDataSource? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as TileDataSourceImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _TileDataSource_check(ptr);
  }

  @internal

  /// @nodoc
  static TileDataSource? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return TileDataSourceImpl.fromNativePtr(ptr);
  }

  void invalidate(core.String version) {
    _TileDataSource_invalidate(ptr, to_native.toNativeString(version));
    exception.checkCallResult();
  }
}

final _TileDataSource_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_TileDataSource_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _TileDataSource_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_TileDataSource_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _TileDataSource_invalidate = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_layers_TileDataSource_invalidate')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _TileDataSource_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_layers_TileDataSource_set_')
    .asFunction(isLeaf: true);

@bindings_annotations.WeakInterface('mapkit.layers.DataSource')
@bindings_annotations.ContainerData(
    toNative: 'DataSourceImpl.getNativePtr',
    toPlatform:
        '(val) => DataSourceImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'DataSource')
class DataSourceImpl extends BaseDataSourceImpl
    implements DataSource, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_DataSource_free.cast());

  /// @nodoc
  DataSourceImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  DataSourceImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory DataSourceImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DataSource? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as DataSourceImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _DataSource_check(ptr);
  }

  @internal

  /// @nodoc
  static DataSource? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DataSourceImpl.fromNativePtr(ptr);
  }

  void setData(typed_data.ByteBuffer data) {
    _DataSource_setData(ptr, to_native.toNativeBytes(data));
    exception.checkCallResult();
  }
}

final _DataSource_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSource_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _DataSource_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSource_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, native_types.NativeBytes)
    _DataSource_setData = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeBytes)>>(
            'yandex_flutter_mapkit_layers_DataSource_setData')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _DataSource_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_layers_DataSource_set_')
    .asFunction(isLeaf: true);

final class _DataSourceListenerWrapper implements ffi.Finalizable {
  _DataSourceListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_DataSourceListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension DataSourceListenerImpl on DataSourceListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<DataSourceListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<DataSourceListener, _DataSourceListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(DataSourceListener obj) {
    final ptr = _DataSourceListener_new(ffi.Pointer.fromFunction<
        ffi.Void Function(ffi.Pointer<ffi.Void>,
            ffi.Pointer<ffi.Void>)>(_DataSourceListener_onDataSourceUpdated));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _DataSourceListenerWrapper(ptr);
    _DataSourceListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(DataSourceListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _DataSourceListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_layers_DataSourceListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _DataSourceListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_layers_DataSourceListener_new')
        .asFunction(isLeaf: true);

final _DataSourceListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSourceListener_free');
void _DataSourceListener_onDataSourceUpdated(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> dataSource) {
  final listener = DataSourceListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onDataSourceUpdated(BaseDataSourceImpl.fromNativePtr(dataSource));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
