part of 'callback.dart';

final class CallbackImpl implements Callback {
  static final _pointerToListener = <ffi.Pointer<ffi.Void>, Callback>{};

  CallbackImpl({required void Function() onTaskFinished})
      : _ptr = _Callback_new(
            ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
                _Callback_onTaskFinished)),
        _onTaskFinished = onTaskFinished {
    _pointerToListener[_ptr] = this;
    _CallbacksetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  @core.override
  void onTaskFinished() => _onTaskFinished();

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function() _onTaskFinished;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(Callback? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as CallbackImpl)._ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _CallbacksetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_Callback_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)
    _Callback_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi.NativeFunction<
                                ffi.Void Function(ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_map_Callback_new')
        .asFunction(isLeaf: true);

void _Callback_onTaskFinished(ffi.Pointer<ffi.Void> _ptr) {
  final listener = CallbackImpl._pointerToListener[_ptr]!;

  try {
    listener.onTaskFinished();
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}
