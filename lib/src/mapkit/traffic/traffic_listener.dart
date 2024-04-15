import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;

part 'traffic_listener.containers.dart';

/// The color that is used for traffic.
@bindings_annotations.ContainerData(
    toNative: 'TrafficColor.toPointer',
    toPlatform: '(val) => TrafficColor.fromPointer(val, needFree: false)')
enum TrafficColor {
  /// Red color.
  Red,

  /// Yellow color.
  Yellow,

  /// Green color.
  Green,
  ;

  /// @nodoc
  @internal
  static TrafficColor fromInt(core.int val) {
    return TrafficColor.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(TrafficColor e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static TrafficColor? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(TrafficColor? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'TrafficLevel.toPointer',
    toPlatform: '(val) => TrafficLevel.fromPointer(val, needFree: false)')
class TrafficLevel implements ffi.Finalizable {
  late final color = TrafficColor.fromInt(_TrafficLevel_get_color(_ptr));
  late final level = _TrafficLevel_get_level(_ptr);

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_TrafficLevel_free.cast());

  TrafficLevel(TrafficColor color, core.int level)
      : this.fromNativePtr(
            _TrafficLevel_init(TrafficColor.toInt(color), level));

  /// @nodoc
  @internal
  TrafficLevel.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(TrafficLevel? obj) {
    if (obj == null) return ffi.nullptr;
    return obj._ptr;
  }

  /// @nodoc
  @internal
  static TrafficLevel? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return TrafficLevel.fromNativePtr(ptr);
  }

  /// @nodoc
  @internal
  static TrafficLevel? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result =
        TrafficLevel.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
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

/// @nodoc
class _TrafficListenerWrapper implements ffi.Finalizable {
  _TrafficListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_TrafficListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Listener to handle traffic information.
abstract class TrafficListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<TrafficListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<TrafficListener, _TrafficListenerWrapper?>();

  /// Triggered when traffic level changes.
  void onTrafficChanged(TrafficLevel? trafficLevel);

  /// Triggered when traffic information is loading.
  void onTrafficLoading();

  /// Triggered when traffic information expires.
  void onTrafficExpired();

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

  /// @nodoc
  @internal
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
  final listener = TrafficListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onTrafficChanged(TrafficLevel.fromOptionalPtr(trafficLevel));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

void _TrafficListener_onTrafficLoading(ffi.Pointer<ffi.Void> _ptr) {
  final listener = TrafficListener._pointerToListener[_ptr]?.target;
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
  final listener = TrafficListener._pointerToListener[_ptr]?.target;
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
