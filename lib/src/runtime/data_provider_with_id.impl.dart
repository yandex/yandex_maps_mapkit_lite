part of 'data_provider_with_id.dart';

extension DataProviderWithIdImpl on DataProviderWithId {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, DataProviderWithId>{};
  static final _listenerToPointer =
      <DataProviderWithId, ffi.Pointer<ffi.Void>>{};

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _DataProviderWithId_free(ptr);
    final listener = _pointerToListener[ptr];
    _listenerToPointer.remove(listener);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _renewNonExsistPointer(
      ffi.Pointer<ffi.Void> ptr) {
    if (!_DataProviderWithId_exists(ptr)) {
      final listener = _pointerToListener[ptr];
      _pointerToListener.remove(ptr);
      _listenerToPointer.remove(listener);
      return _newNativeObject(listener!);
    }
    return ptr;
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(DataProviderWithId obj) {
    final ptr = _DataProviderWithId_new(
        ffi.Pointer.fromFunction<
            native_types.NativeString Function(
                ffi.Pointer<ffi.Void>)>(_DataProviderWithId_providerId),
        ffi.Pointer.fromFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>)>(_DataProviderWithId_load));
    _pointerToListener[ptr] = obj;
    _listenerToPointer[obj] = ptr;
    _DataProviderWithIdsetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort(),
        nativeBinding.createAsyncExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(DataProviderWithId? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return _renewNonExsistPointer(foundPointer);
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int, core.int)
    _DataProviderWithIdsetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64,
                        ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_runtime_DataProviderWithId_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _DataProviderWithId_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.NativeFunction<native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>('yandex_flutter_runtime_DataProviderWithId_new')
        .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>) _DataProviderWithId_free = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DataProviderWithId_free')
    .asFunction(isLeaf: true);
final core.bool Function(ffi.Pointer<ffi.Void>) _DataProviderWithId_exists = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_DataProviderWithId_exists')
    .asFunction(isLeaf: true);

native_types.NativeString _DataProviderWithId_providerId(
    ffi.Pointer<ffi.Void> _ptr) {
  final listener = DataProviderWithIdImpl._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }
  try {
    return to_native.toNativeString(listener.providerId());
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _DataProviderWithId_load(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> _onResult) {
  final listener = DataProviderWithIdImpl._pointerToListener[_ptr];
  if (listener == null) {
    throw core.Exception();
  }

  listener.load().then(
      (result) => _DataProviderWithIdloadInvokeOnResult(
          _onResult, to_native.toNativeBytes(result)), onError: (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
  });
}

final void Function(ffi.Pointer<ffi.Void>, native_types.NativeBytes)
    _DataProviderWithIdloadInvokeOnResult = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeBytes)>>(
            'yandex_flutter_runtime_DataProviderWithId_load_invokeOnResult')
        .asFunction(isLeaf: true);
