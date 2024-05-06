part of 'spannable_string.dart';

@bindings_annotations.ContainerData(
    toNative: 'SpannableStringImpl.toPointer',
    toPlatform:
        '(val) => SpannableStringImpl.fromPointer(val, needFree: false)',
    platformType: 'SpannableString')
final class SpannableStringImpl implements SpannableString {
  SpannableStringImpl(core.String text, core.List<SpannableStringSpan> spans)
      : this.fromNativePtr(_SpannableString_init(to_native.toNativeString(text),
            SpannableStringSpanContainerExtension.toNativeVector(spans)));

  @core.override
  late final text =
      to_platform.toPlatformString(_SpannableString_get_text(_ptr));
  @core.override
  late final spans = SpannableStringSpanContainerExtension.toPlatformVector(
      _SpannableString_get_spans(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_SpannableString_free.cast());

  SpannableStringImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(SpannableString? obj) {
    return (obj as SpannableStringImpl?)?._ptr ?? ffi.nullptr;
  }

  static SpannableString? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : SpannableStringImpl.fromNativePtr(ptr);
  }

  static SpannableString? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = SpannableStringImpl.fromNativePtr(
        ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(SpannableString? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _SpannableString_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _SpannableString_clone = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_SpannableString_clone')
        .asFunction(isLeaf: true);

final _SpannableString_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_SpannableString_free');

final ffi.Pointer<ffi.Void> Function(
        native_types.NativeString, ffi.Pointer<ffi.Void>)
    _SpannableString_init = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        native_types.NativeString, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_SpannableString_init')
        .asFunction(isLeaf: true);

final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _SpannableString_get_text = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_SpannableString_get_text')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _SpannableString_get_spans = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_SpannableString_get_spans')
        .asFunction(isLeaf: true);

final class SpannableStringSpanNative extends ffi.Struct {
  @ffi.Int()
  external core.int begin;
  @ffi.Int()
  external core.int end;
}

final SpannableStringSpanNative Function(core.int, core.int)
    _SpannableStringSpanNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    SpannableStringSpanNative Function(ffi.Int, ffi.Int)>>(
            'yandex_flutter_mapkit_SpannableString_SpannableStringSpan_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'SpannableStringSpanImpl.toPointer',
    toPlatform:
        '(val) => SpannableStringSpanImpl.fromPointer(val, needFree: false)',
    platformType: 'SpannableStringSpan')
extension SpannableStringSpanImpl on SpannableStringSpan {
  static SpannableStringSpan fromNative(SpannableStringSpanNative native) {
    return SpannableStringSpan(begin: native.begin, end: native.end);
  }

  static SpannableStringSpanNative toNative(SpannableStringSpan obj) {
    return _SpannableStringSpanNativeInit(obj.begin, obj.end);
  }

  static SpannableStringSpan? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = SpannableStringSpanImpl.fromNative(
        ptr.cast<SpannableStringSpanNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(SpannableStringSpan? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<SpannableStringSpanNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
