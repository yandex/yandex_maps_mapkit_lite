part of 'placemark_text.dart';

@bindings_annotations.WeakInterface('mapkit.map.PlacemarkText')
@bindings_annotations.ContainerData(
    toNative: 'PlacemarkTextImpl.getNativePtr',
    toPlatform:
        '(val) => PlacemarkTextImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'PlacemarkText')
class PlacemarkTextImpl implements PlacemarkText, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_PlacemarkText_free.cast());

  /// @nodoc
  PlacemarkTextImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  PlacemarkTextImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PlacemarkTextImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PlacemarkText? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as PlacemarkTextImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _PlacemarkText_check(ptr);
  }

  @internal

  /// @nodoc
  static PlacemarkText? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PlacemarkTextImpl.fromNativePtr(ptr);
  }

  @core.override
  core.String get text {
    final result = _PlacemarkText_get_text(ptr);
    exception.checkCallResult();
    return to_platform.toPlatformString(result);
  }

  @core.override
  set text(core.String val) {
    _PlacemarkText_set_text(ptr, to_native.toNativeString(val));
    exception.checkCallResult();
  }

  @core.override
  mapkit_map_text_style.TextStyle get style {
    final result = _PlacemarkText_get_style(ptr);
    exception.checkCallResult();
    return mapkit_map_text_style.TextStyleImpl.fromNative(result);
  }

  @core.override
  set style(mapkit_map_text_style.TextStyle val) {
    _PlacemarkText_set_style(
        ptr, mapkit_map_text_style.TextStyleImpl.toNative(val));
    exception.checkCallResult();
  }
}

final _PlacemarkText_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkText_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _PlacemarkText_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarkText_check')
    .asFunction(isLeaf: true);

final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _PlacemarkText_get_text = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkText_get_text')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _PlacemarkText_set_text = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_map_PlacemarkText_set_text')
        .asFunction();

final mapkit_map_text_style.TextStyleNative Function(ffi.Pointer<ffi.Void>)
    _PlacemarkText_get_style = lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_map_text_style.TextStyleNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarkText_get_style')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_map_text_style.TextStyleNative)
    _PlacemarkText_set_style = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_map_text_style.TextStyleNative)>>(
            'yandex_flutter_mapkit_map_PlacemarkText_set_style')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, core.int) _PlacemarkText_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_PlacemarkText_set_')
    .asFunction(isLeaf: true);
