part of 'traffic_layer.dart';

@bindings_annotations.WeakInterface('mapkit.traffic.TrafficLayer')
@bindings_annotations.ContainerData(
    toNative: 'TrafficLayerImpl.getNativePtr',
    toPlatform:
        '(val) => TrafficLayerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'TrafficLayer')
class TrafficLayerImpl implements TrafficLayer, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_TrafficLayer_free.cast());

  /// @nodoc
  TrafficLayerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  TrafficLayerImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory TrafficLayerImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(TrafficLayer? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as TrafficLayerImpl).ptr;
  }

  core.bool isValid() {
    return _TrafficLayer_check(ptr);
  }

  @internal

  /// @nodoc
  static TrafficLayer? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return TrafficLayerImpl.fromNativePtr(ptr);
  }

  core.bool isTrafficVisible() {
    return _TrafficLayer_isTrafficVisible(ptr);
  }

  void setTrafficVisible(core.bool on) {
    _TrafficLayer_setTrafficVisible(ptr, on);
  }

  core.bool setTrafficStyle(core.String style) {
    return _TrafficLayer_setTrafficStyle(ptr, to_native.toNativeString(style));
  }

  core.bool setTrafficStyleWithId({
    required core.int id,
    required core.String style,
  }) {
    return _TrafficLayer_setTrafficStyleWithId(
        ptr, id, to_native.toNativeString(style));
  }

  void resetTrafficStyles() {
    _TrafficLayer_resetTrafficStyles(ptr);
  }

  void addTrafficListener(
      mapkit_traffic_traffic_listener.TrafficListener trafficListener) {
    _TrafficLayer_addTrafficListener(
        ptr,
        mapkit_traffic_traffic_listener.TrafficListenerImpl.getNativePtr(
            trafficListener));
  }

  void removeTrafficListener(
      mapkit_traffic_traffic_listener.TrafficListener trafficListener) {
    _TrafficLayer_removeTrafficListener(
        ptr,
        mapkit_traffic_traffic_listener.TrafficListenerImpl.getNativePtr(
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
