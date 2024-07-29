part of 'arrow.dart';

@bindings_annotations.WeakInterface('mapkit.map.Arrow')
@bindings_annotations.ContainerData(
    toNative: 'ArrowImpl.getNativePtr',
    toPlatform:
        '(val) => ArrowImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Arrow')
class ArrowImpl implements Arrow, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Arrow_free.cast());

  /// @nodoc
  ArrowImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  ArrowImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory ArrowImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Arrow? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as ArrowImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _Arrow_check(ptr);
  }

  @internal

  /// @nodoc
  static Arrow? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return ArrowImpl.fromNativePtr(ptr);
  }

  @core.override
  mapkit_geometry_geometry.PolylinePosition get position {
    return mapkit_geometry_geometry.PolylinePositionImpl.fromNative(
        _Arrow_get_position(ptr));
  }

  @core.override
  ui.Color get fillColor {
    return to_platform.toPlatformColor(_Arrow_get_fillColor(ptr));
  }

  @core.override
  set fillColor(ui.Color val) {
    _Arrow_set_fillColor(ptr, to_native.toNativeColor(val));
  }

  @core.override
  ui.Color get outlineColor {
    return to_platform.toPlatformColor(_Arrow_get_outlineColor(ptr));
  }

  @core.override
  set outlineColor(ui.Color val) {
    _Arrow_set_outlineColor(ptr, to_native.toNativeColor(val));
  }

  @core.override
  core.double get outlineWidth {
    return _Arrow_get_outlineWidth(ptr);
  }

  @core.override
  set outlineWidth(core.double val) {
    _Arrow_set_outlineWidth(ptr, val);
  }

  @core.override
  core.double get length {
    return _Arrow_get_length(ptr);
  }

  @core.override
  set length(core.double val) {
    _Arrow_set_length(ptr, val);
  }

  @core.override
  core.bool get visible {
    return _Arrow_get_visible(ptr);
  }

  @core.override
  set visible(core.bool val) {
    _Arrow_set_visible(ptr, val);
  }

  @core.override
  core.double get triangleHeight {
    return _Arrow_get_triangleHeight(ptr);
  }

  @core.override
  set triangleHeight(core.double val) {
    _Arrow_set_triangleHeight(ptr, val);
  }
}

final _Arrow_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Arrow_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Arrow_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Arrow_check')
    .asFunction(isLeaf: true);

final mapkit_geometry_geometry.PolylinePositionNative Function(
        ffi.Pointer<ffi.Void>) _Arrow_get_position =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    mapkit_geometry_geometry.PolylinePositionNative Function(
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Arrow_get_position')
        .asFunction();

final native_types.NativeColor Function(ffi.Pointer<ffi.Void>)
    _Arrow_get_fillColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Arrow_get_fillColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _Arrow_set_fillColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_Arrow_set_fillColor')
        .asFunction();

final native_types.NativeColor Function(ffi.Pointer<ffi.Void>)
    _Arrow_get_outlineColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeColor Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Arrow_get_outlineColor')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeColor)
    _Arrow_set_outlineColor = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeColor)>>(
            'yandex_flutter_mapkit_map_Arrow_set_outlineColor')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _Arrow_get_outlineWidth = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Arrow_get_outlineWidth')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _Arrow_set_outlineWidth = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_Arrow_set_outlineWidth')
        .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _Arrow_get_length = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Arrow_get_length')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double) _Arrow_set_length = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Float)>>('yandex_flutter_mapkit_map_Arrow_set_length')
    .asFunction();

final core.bool Function(ffi.Pointer<ffi.Void>) _Arrow_get_visible = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_Arrow_get_visible')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool) _Arrow_set_visible = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Bool)>>('yandex_flutter_mapkit_map_Arrow_set_visible')
    .asFunction();

final core.double Function(ffi.Pointer<ffi.Void>) _Arrow_get_triangleHeight =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_Arrow_get_triangleHeight')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.double)
    _Arrow_set_triangleHeight = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Float)>>(
            'yandex_flutter_mapkit_map_Arrow_set_triangleHeight')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, core.int) _Arrow_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_map_Arrow_set_')
    .asFunction(isLeaf: true);
