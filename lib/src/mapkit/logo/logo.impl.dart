part of 'logo.dart';

@bindings_annotations.WeakInterface('mapkit.logo.Logo')
@bindings_annotations.ContainerData(
    toNative: 'LogoImpl.getNativePtr',
    toPlatform:
        '(val) => LogoImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Logo')
class LogoImpl implements Logo, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Logo_free.cast());

  /// @nodoc
  LogoImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  LogoImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory LogoImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Logo? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as LogoImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _Logo_check(ptr);
  }

  @internal

  /// @nodoc
  static Logo? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LogoImpl.fromNativePtr(ptr);
  }

  void setAlignment(mapkit_logo_alignment.LogoAlignment alignment) {
    _Logo_setAlignment(
        ptr, mapkit_logo_alignment.LogoAlignmentImpl.toNative(alignment));
    exception.checkCallResult();
  }

  void setPadding(mapkit_logo_padding.LogoPadding padding) {
    _Logo_setPadding(
        ptr, mapkit_logo_padding.LogoPaddingImpl.toNative(padding));
    exception.checkCallResult();
  }
}

final _Logo_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_logo_Logo_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Logo_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_logo_Logo_check')
    .asFunction(isLeaf: true);

final void Function(
        ffi.Pointer<ffi.Void>, mapkit_logo_alignment.LogoAlignmentNative)
    _Logo_setAlignment = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_logo_alignment.LogoAlignmentNative)>>(
            'yandex_flutter_mapkit_logo_Logo_setAlignment')
        .asFunction();
final void Function(
        ffi.Pointer<ffi.Void>, mapkit_logo_padding.LogoPaddingNative)
    _Logo_setPadding = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>,
                        mapkit_logo_padding.LogoPaddingNative)>>(
            'yandex_flutter_mapkit_logo_Logo_setPadding')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _Logo_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_logo_Logo_set_')
    .asFunction(isLeaf: true);
