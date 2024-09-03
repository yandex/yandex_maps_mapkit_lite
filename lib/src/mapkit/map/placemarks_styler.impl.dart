part of 'placemarks_styler.dart';

@bindings_annotations.WeakInterface('mapkit.map.PlacemarksStyler')
@bindings_annotations.ContainerData(
    toNative: 'PlacemarksStylerImpl.getNativePtr',
    toPlatform:
        '(val) => PlacemarksStylerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'PlacemarksStyler')
class PlacemarksStylerImpl implements PlacemarksStyler, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_PlacemarksStyler_free.cast());

  /// @nodoc
  PlacemarksStylerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  PlacemarksStylerImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PlacemarksStylerImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PlacemarksStyler? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as PlacemarksStylerImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _PlacemarksStyler_check(ptr);
  }

  @internal

  /// @nodoc
  static PlacemarksStyler? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PlacemarksStylerImpl.fromNativePtr(ptr);
  }

  void setScaleFunction(core.List<math.Point<core.double>> points) {
    _PlacemarksStyler_setScaleFunction(
        ptr, to_native.toNativeVectorPoint(points));
    exception.checkCallResult();
  }
}

final _PlacemarksStyler_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarksStyler_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _PlacemarksStyler_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarksStyler_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PlacemarksStyler_setScaleFunction = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarksStyler_setScaleFunction')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _PlacemarksStyler_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_PlacemarksStyler_set_')
    .asFunction(isLeaf: true);
