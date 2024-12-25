part of 'indoor_state_listener.dart';

final class _IndoorStateListenerWrapper implements ffi.Finalizable {
  _IndoorStateListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_IndoorStateListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension IndoorStateListenerImpl on IndoorStateListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<IndoorStateListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<IndoorStateListener, _IndoorStateListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(IndoorStateListener obj) {
    final ptr = _IndoorStateListener_new(
        ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _IndoorStateListener_onActivePlanFocused),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
            _IndoorStateListener_onActivePlanLeft),
        ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, native_types.NativeString)>(
            _IndoorStateListener_onActiveLevelChanged));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _IndoorStateListenerWrapper(ptr);
    _IndoorStateListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(IndoorStateListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _IndoorStateListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_indoor_IndoorStateListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)>>)
    _IndoorStateListener_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)>>)>>('yandex_flutter_mapkit_indoor_IndoorStateListener_new')
        .asFunction(isLeaf: true);

final _IndoorStateListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_indoor_IndoorStateListener_free');
void _IndoorStateListener_onActivePlanFocused(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> activePlan) {
  final listener = IndoorStateListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onActivePlanFocused(
        mapkit_indoor_indoor_plan.IndoorPlanImpl.fromNativePtr(activePlan));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _IndoorStateListener_onActivePlanLeft(ffi.Pointer<ffi.Void> _ptr) {
  final listener = IndoorStateListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onActivePlanLeft();
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _IndoorStateListener_onActiveLevelChanged(
    ffi.Pointer<ffi.Void> _ptr, native_types.NativeString activeLevelId) {
  final listener = IndoorStateListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onActiveLevelChanged(to_platform.toPlatformString(activeLevelId));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
