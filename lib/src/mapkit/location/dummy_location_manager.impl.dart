part of 'dummy_location_manager.dart';

@bindings_annotations.ContainerData(
    toNative: 'DummyLocationManagerImpl.getNativePtr',
    toPlatform:
        '(val) => DummyLocationManagerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'DummyLocationManager')
class DummyLocationManagerImpl extends mapkit_location_location_manager
    .LocationManagerImpl implements DummyLocationManager, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_DummyLocationManager_free.cast());

  /// @nodoc
  DummyLocationManagerImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  DummyLocationManagerImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DummyLocationManager? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as DummyLocationManagerImpl).ptr;
  }

  @internal

  /// @nodoc
  static DummyLocationManager? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DummyLocationManagerImpl.fromNativePtr(ptr);
  }

  void setLocation(mapkit_location_location.Location location) {
    _DummyLocationManager_setLocation(
        ptr, mapkit_location_location.LocationImpl.toNative(location));
  }
}

final _DummyLocationManager_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_DummyLocationManager_free');

final void Function(
        ffi.Pointer<ffi.Void>, mapkit_location_location.LocationNative)
    _DummyLocationManager_setLocation = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_location_location.LocationNative)>>(
            'yandex_flutter_mapkit_location_DummyLocationManager_setLocation')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _DummyLocationManager_set =
    lib
        .library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_location_DummyLocationManager_set_')
        .asFunction(isLeaf: true);
