part of 'local_error.dart';

@bindings_annotations.WeakInterface('runtime.LocalError')
@bindings_annotations.ContainerData(
    toNative: 'LocalErrorImpl.getNativePtr',
    toPlatform:
        '(val) => LocalErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'LocalError')
class LocalErrorImpl extends runtime_error.ErrorImpl
    implements LocalError, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_LocalError_free.cast());

  /// @nodoc
  LocalErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  LocalErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory LocalErrorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(LocalError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as LocalErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _LocalError_check(ptr);
  }

  @internal

  /// @nodoc
  static LocalError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LocalErrorImpl.fromNativePtr(ptr);
  }
}

final _LocalError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_LocalError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _LocalError_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_LocalError_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, core.int) _LocalError_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_runtime_LocalError_set_')
    .asFunction(isLeaf: true);

@bindings_annotations.WeakInterface('runtime.DiskFullError')
@bindings_annotations.ContainerData(
    toNative: 'DiskFullErrorImpl.getNativePtr',
    toPlatform:
        '(val) => DiskFullErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'DiskFullError')
class DiskFullErrorImpl extends LocalErrorImpl
    implements DiskFullError, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_DiskFullError_free.cast());

  /// @nodoc
  DiskFullErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  DiskFullErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory DiskFullErrorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DiskFullError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as DiskFullErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _DiskFullError_check(ptr);
  }

  @internal

  /// @nodoc
  static DiskFullError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DiskFullErrorImpl.fromNativePtr(ptr);
  }
}

final _DiskFullError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DiskFullError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _DiskFullError_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DiskFullError_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, core.int) _DiskFullError_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_runtime_DiskFullError_set_')
    .asFunction(isLeaf: true);

@bindings_annotations.WeakInterface('runtime.DiskCorruptError')
@bindings_annotations.ContainerData(
    toNative: 'DiskCorruptErrorImpl.getNativePtr',
    toPlatform:
        '(val) => DiskCorruptErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'DiskCorruptError')
class DiskCorruptErrorImpl extends LocalErrorImpl
    implements DiskCorruptError, ffi.Finalizable {
  static final _finalizer = ffi.NativeFinalizer(_DiskCorruptError_free.cast());

  /// @nodoc
  DiskCorruptErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  DiskCorruptErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory DiskCorruptErrorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DiskCorruptError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as DiskCorruptErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _DiskCorruptError_check(ptr);
  }

  @internal

  /// @nodoc
  static DiskCorruptError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DiskCorruptErrorImpl.fromNativePtr(ptr);
  }
}

final _DiskCorruptError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DiskCorruptError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _DiskCorruptError_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DiskCorruptError_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, core.int) _DiskCorruptError_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_runtime_DiskCorruptError_set_')
    .asFunction(isLeaf: true);

@bindings_annotations.WeakInterface('runtime.DiskWriteAccessError')
@bindings_annotations.ContainerData(
    toNative: 'DiskWriteAccessErrorImpl.getNativePtr',
    toPlatform:
        '(val) => DiskWriteAccessErrorImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'DiskWriteAccessError')
class DiskWriteAccessErrorImpl extends DiskCorruptErrorImpl
    implements DiskWriteAccessError, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_DiskWriteAccessError_free.cast());

  /// @nodoc
  DiskWriteAccessErrorImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  DiskWriteAccessErrorImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory DiskWriteAccessErrorImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DiskWriteAccessError? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as DiskWriteAccessErrorImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _DiskWriteAccessError_check(ptr);
  }

  @internal

  /// @nodoc
  static DiskWriteAccessError? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DiskWriteAccessErrorImpl.fromNativePtr(ptr);
  }
}

final _DiskWriteAccessError_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DiskWriteAccessError_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _DiskWriteAccessError_check =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_DiskWriteAccessError_check')
        .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, core.int) _DiskWriteAccessError_set =
    lib
        .library
        .lookup<
                ffi
                .NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
            'yandex_flutter_runtime_DiskWriteAccessError_set_')
        .asFunction(isLeaf: true);
