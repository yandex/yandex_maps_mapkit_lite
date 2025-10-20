part of 'placemark_presentation.dart';

@bindings_annotations.WeakInterface('mapkit.map.PlacemarkPresentation')
@bindings_annotations.ContainerData(
    toNative: 'PlacemarkPresentationImpl.getNativePtr',
    toPlatform:
        '(val) => PlacemarkPresentationImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'PlacemarkPresentation')
class PlacemarkPresentationImpl
    implements PlacemarkPresentation, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer =
      ffi.NativeFinalizer(_PlacemarkPresentation_free.cast());

  /// @nodoc
  PlacemarkPresentationImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  PlacemarkPresentationImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PlacemarkPresentationImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PlacemarkPresentation? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as PlacemarkPresentationImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _PlacemarkPresentation_check(ptr);
  }

  @internal

  /// @nodoc
  static PlacemarkPresentation? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PlacemarkPresentationImpl.fromNativePtr(ptr);
  }

  void remove() {
    _PlacemarkPresentation_remove(ptr);
    exception.checkCallResult();
  }
}

final _PlacemarkPresentation_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkPresentation_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _PlacemarkPresentation_check =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkPresentation_check')
        .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>) _PlacemarkPresentation_remove = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkPresentation_remove')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int)
    _PlacemarkPresentation_set = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_PlacemarkPresentation_set_')
        .asFunction(isLeaf: true);
