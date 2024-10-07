part of 'regions_at_point_listener.dart';

final class RegionsAtPointListenerImpl implements RegionsAtPointListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, RegionsAtPointListener>{};

  RegionsAtPointListenerImpl(
      {required void Function(core.List<core.int> regions) onRegions,
      required void Function(runtime_error.Error error) onError})
      : _ptr = _RegionsAtPointListener_new(
            ffi.Pointer.fromFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>,
                    ffi.Pointer<ffi.Void>)>(_RegionsAtPointListener_onRegions),
            ffi.Pointer.fromFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>,
                    ffi.Pointer<ffi.Void>)>(_RegionsAtPointListener_onError)),
        _onRegions = onRegions,
        _onError = onError {
    _pointerToListener[_ptr] = this;
    _RegionsAtPointListenersetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  @core.override
  void onRegions(core.List<core.int> regions) => _onRegions(regions);
  @core.override
  void onError(runtime_error.Error error) => _onError(error);

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function(core.List<core.int>) _onRegions;
  final void Function(runtime_error.Error) _onError;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(RegionsAtPointListener? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as RegionsAtPointListenerImpl)._ptr;
  }
}

final void Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    core
        .int) _RegionsAtPointListenersetSendPort = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
        'yandex_flutter_mapkit_offline_cache_RegionsAtPointListener_setSendPort')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _RegionsAtPointListener_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>('yandex_flutter_mapkit_offline_cache_RegionsAtPointListener_new')
        .asFunction(isLeaf: true);

void _RegionsAtPointListener_onRegions(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> regions) {
  final listener = RegionsAtPointListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onRegions(to_platform.toVectorUint32(regions));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

void _RegionsAtPointListener_onError(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> error) {
  final listener = RegionsAtPointListenerImpl._pointerToListener[_ptr]!;

  try {
    listener.onError(runtime_error.ErrorImpl.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}
