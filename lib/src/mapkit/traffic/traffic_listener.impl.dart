part of 'traffic_listener.dart';

@bindings_annotations.ContainerData(
    toNative: 'TrafficColorImpl.toPointer',
    toPlatform: '(val) => TrafficColorImpl.fromPointer(val, needFree: false)',
    platformType: 'TrafficColor')
extension TrafficColorImpl on TrafficColor {
  static core.int toInt(TrafficColor e) {
    return e.index;
  }

  static TrafficColor fromInt(core.int val) {
    return TrafficColor.values[val];
  }

  static TrafficColor? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(TrafficColor? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

final class TrafficLevelNative extends ffi.Struct {
  @ffi.Int64()
  external core.int color;
  @ffi.Int()
  external core.int level;
}

final TrafficLevelNative Function(core.int, core.int) _TrafficLevelNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    TrafficLevelNative Function(ffi.Int64, ffi.Int)>>(
            'yandex_flutter_mapkit_traffic_TrafficLevel_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'TrafficLevelImpl.toPointer',
    toPlatform: '(val) => TrafficLevelImpl.fromPointer(val, needFree: false)',
    platformType: 'TrafficLevel')
extension TrafficLevelImpl on TrafficLevel {
  static TrafficLevel fromNative(TrafficLevelNative native) {
    return TrafficLevel(TrafficColorImpl.fromInt(native.color),
        level: native.level);
  }

  static TrafficLevelNative toNative(TrafficLevel obj) {
    return _TrafficLevelNativeInit(
        TrafficColorImpl.toInt(obj.color), obj.level);
  }

  static TrafficLevel? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        TrafficLevelImpl.fromNative(ptr.cast<TrafficLevelNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(TrafficLevel? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<TrafficLevelNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

final class _TrafficListenerWrapper implements ffi.Finalizable {
  _TrafficListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_TrafficListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension TrafficListenerImpl on TrafficListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<TrafficListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<TrafficListener, _TrafficListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(TrafficListener obj) {
    final ptr = _TrafficListener_new(
        ffi.Pointer.fromFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>)>(_TrafficListener_onTrafficChanged),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
            _TrafficListener_onTrafficLoading),
        ffi.Pointer.fromFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
            _TrafficListener_onTrafficExpired));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _TrafficListenerWrapper(ptr);
    _TrafficListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(TrafficListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _TrafficListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_traffic_TrafficListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>,
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)
    _TrafficListener_new = lib.library
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<ffi.Void> Function(
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>,
                    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>)>>('yandex_flutter_mapkit_traffic_TrafficListener_new')
        .asFunction(isLeaf: true);

final _TrafficListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_traffic_TrafficListener_free');
void _TrafficListener_onTrafficChanged(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> trafficLevel) {
  final listener = TrafficListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onTrafficChanged(TrafficLevelImpl.fromPointer(trafficLevel));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _TrafficListener_onTrafficLoading(ffi.Pointer<ffi.Void> _ptr) {
  final listener = TrafficListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onTrafficLoading();
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _TrafficListener_onTrafficExpired(ffi.Pointer<ffi.Void> _ptr) {
  final listener = TrafficListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onTrafficExpired();
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
