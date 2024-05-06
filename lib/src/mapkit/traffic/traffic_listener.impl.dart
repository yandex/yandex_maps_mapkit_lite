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

@bindings_annotations.ContainerData(
    toNative: 'TrafficLevelImpl.toPointer',
    toPlatform: '(val) => TrafficLevelImpl.fromPointer(val, needFree: false)',
    platformType: 'TrafficLevel')
final class TrafficLevelImpl implements TrafficLevel {
  TrafficLevelImpl(TrafficColor color, core.int level)
      : this.fromNativePtr(
            _TrafficLevel_init(TrafficColorImpl.toInt(color), level));

  @core.override
  late final color = TrafficColorImpl.fromInt(_TrafficLevel_get_color(_ptr));
  @core.override
  late final level = _TrafficLevel_get_level(_ptr);

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_TrafficLevel_free.cast());

  TrafficLevelImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(TrafficLevel? obj) {
    return (obj as TrafficLevelImpl?)?._ptr ?? ffi.nullptr;
  }

  static TrafficLevel? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : TrafficLevelImpl.fromNativePtr(ptr);
  }

  static TrafficLevel? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        TrafficLevelImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(TrafficLevel? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Pointer<ffi.Void>>();
    result.value = _TrafficLevel_clone(getNativePtr(val));

    return result.cast<ffi.Void>();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _TrafficLevel_clone = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_traffic_TrafficLevel_clone')
        .asFunction(isLeaf: true);

final _TrafficLevel_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_traffic_TrafficLevel_free');

final ffi.Pointer<ffi.Void> Function(core.int, core.int) _TrafficLevel_init =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Int64, ffi.Int)>>(
            'yandex_flutter_mapkit_traffic_TrafficLevel_init')
        .asFunction(isLeaf: true);

final core.int Function(ffi.Pointer<ffi.Void>) _TrafficLevel_get_color = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int64 Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_traffic_TrafficLevel_get_color')
    .asFunction(isLeaf: true);
final core.int Function(ffi.Pointer<ffi.Void>) _TrafficLevel_get_level = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_traffic_TrafficLevel_get_level')
    .asFunction(isLeaf: true);

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
    listener.onTrafficChanged(TrafficLevelImpl.fromOptionalPtr(trafficLevel));
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
