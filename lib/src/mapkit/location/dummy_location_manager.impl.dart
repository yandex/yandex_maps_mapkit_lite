part of 'dummy_location_manager.dart';

@bindings_annotations.ContainerData(
    toNative: 'DummyLocationQualityImpl.toPointer',
    toPlatform:
        '(val) => DummyLocationQualityImpl.fromPointer(val, needFree: false)',
    platformType: 'DummyLocationQuality')
extension DummyLocationQualityImpl on DummyLocationQuality {
  static core.int toInt(DummyLocationQuality e) {
    return e.index;
  }

  static DummyLocationQuality fromInt(core.int val) {
    return DummyLocationQuality.values[val];
  }

  static DummyLocationQuality? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(DummyLocationQuality? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

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

  void setLocation(mapkit_location_location.Location location,
      DummyLocationQuality quality) {
    _DummyLocationManager_setLocation(
        ptr,
        mapkit_location_location.LocationImpl.toNative(location),
        DummyLocationQualityImpl.toInt(quality));
  }
}

final _DummyLocationManager_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_location_DummyLocationManager_free');

final void Function(ffi.Pointer<ffi.Void>,
        mapkit_location_location.LocationNative, core.int)
    _DummyLocationManager_setLocation = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_location_location.LocationNative, ffi.Int64)>>(
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
