import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;

part 'data_source.containers.dart';

@bindings_annotations.WeakInterface('mapkit.layers.DataSource')
@bindings_annotations.ContainerData(
    toNative: 'DataSource.getNativePtr',
    toPlatform:
        '(val) => DataSource.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class DataSource implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_DataSource_free.cast());

  /// @nodoc
  DataSource.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  DataSource.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory DataSource.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DataSource? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _DataSource_check(ptr);
  }

  @internal

  /// @nodoc
  static DataSource? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DataSource.fromNativePtr(ptr);
  }

  /// Stores id of data source.
  core.String get id {
    return to_platform.toPlatformString(_DataSource_get_id(ptr));
  }

  /// Invalidates data source and reloads all tiles. Must not be called if
  /// DataSource does not support versioning: LayerOptions.versionSupport =
  /// false;
  ///
  /// This method may be called on any thread. Its implementation must be thread-safe.
  void invalidate(core.String version) {
    _DataSource_invalidate(ptr, to_native.toNativeString(version));
  }
}

final _DataSource_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSource_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _DataSource_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_DataSource_check')
    .asFunction(isLeaf: true);

final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _DataSource_get_id = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_layers_DataSource_get_id')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _DataSource_invalidate = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_layers_DataSource_invalidate')
        .asFunction();

/// @nodoc
class _DataSourceListenerWrapper implements ffi.Finalizable {
  _DataSourceListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_DataSourceListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

abstract class DataSourceListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<DataSourceListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<DataSourceListener, _DataSourceListenerWrapper?>();

  void onDataSourceUpdated(DataSource dataSource);

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

  /// @nodoc
  @internal
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
  final listener = DataSourceListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onDataSourceUpdated(DataSource.fromNativePtr(dataSource));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
