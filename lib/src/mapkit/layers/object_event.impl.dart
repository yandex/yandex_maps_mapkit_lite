part of 'object_event.dart';

@bindings_annotations.WeakInterface('mapkit.layers.ObjectEvent')
@bindings_annotations.ContainerData(
    toNative: 'ObjectEventImpl.getNativePtr',
    toPlatform:
        '(val) => ObjectEventImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'ObjectEvent')
class ObjectEventImpl implements ObjectEvent, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_ObjectEvent_free.cast());

  /// @nodoc
  ObjectEventImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  ObjectEventImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory ObjectEventImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(ObjectEvent? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as ObjectEventImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _ObjectEvent_check(ptr);
  }

  @internal

  /// @nodoc
  static ObjectEvent? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return ObjectEventImpl.fromNativePtr(ptr);
  }
}

final _ObjectEvent_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_ObjectEvent_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _ObjectEvent_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_layers_ObjectEvent_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, core.int) _ObjectEvent_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_layers_ObjectEvent_set_')
    .asFunction(isLeaf: true);
