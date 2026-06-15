part of 'subscription_logger.dart';

final class LogMessageNative extends ffi.Struct {
  external native_types.NativeAbsTimestamp time;
  @ffi.Int64()
  external core.int level;
  external native_types.NativeString scope;
  external native_types.NativeString message;
  external native_types.NativeString verboseInfo;
}

final LogMessageNative Function(
        native_types.NativeAbsTimestamp,
        core.int,
        native_types.NativeString,
        native_types.NativeString,
        native_types.NativeString) _LogMessageNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    LogMessageNative Function(
                        native_types.NativeAbsTimestamp,
                        ffi.Int64,
                        native_types.NativeString,
                        native_types.NativeString,
                        native_types.NativeString)>>(
            'yandex_flutter_runtime_logging_LogMessage_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'LogMessageImpl.toPointer',
    toPlatform: '(val) => LogMessageImpl.fromPointer(val, needFree: false)',
    platformType: 'LogMessage')
extension LogMessageImpl on LogMessage {
  static LogMessage fromNative(LogMessageNative native) {
    return LogMessage(to_platform.toPlatformAbsTimestamp(native.time),
        LogMessageLogLevelImpl.fromInt(native.level),
        scope: to_platform.toPlatformString(native.scope),
        message: to_platform.toPlatformString(native.message),
        verboseInfo: to_platform.toPlatformString(native.verboseInfo));
  }

  static LogMessageNative toNative(LogMessage obj) {
    return _LogMessageNativeInit(
        to_native.toNativeAbsTimestamp(obj.time),
        LogMessageLogLevelImpl.toInt(obj.level),
        to_native.toNativeString(obj.scope),
        to_native.toNativeString(obj.message),
        to_native.toNativeString(obj.verboseInfo));
  }

  static LogMessage? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = LogMessageImpl.fromNative(ptr.cast<LogMessageNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(LogMessage? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<LogMessageNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'LogMessageLogLevelImpl.toPointer',
    toPlatform:
        '(val) => LogMessageLogLevelImpl.fromPointer(val, needFree: false)',
    platformType: 'LogMessageLogLevel')
extension LogMessageLogLevelImpl on LogMessageLogLevel {
  static core.int toInt(LogMessageLogLevel e) {
    return e.index;
  }

  static LogMessageLogLevel fromInt(core.int val) {
    return LogMessageLogLevel.values[val];
  }

  static LogMessageLogLevel? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(LogMessageLogLevel? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

final class _LogListenerWrapper implements ffi.Finalizable {
  _LogListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer = ffi.NativeFinalizer(_LogListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

extension LogListenerImpl on LogListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<LogListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<LogListener, _LogListenerWrapper?>();

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(LogListener obj) {
    final ptr = _LogListener_new(ffi.Pointer.fromFunction<
        ffi.Void Function(ffi.Pointer<ffi.Void>,
            LogMessageNative)>(_LogListener_onMessageReceived));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _LogListenerWrapper(ptr);
    _LogListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  static ffi.Pointer<ffi.Void> getNativePtr(LogListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _LogListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_runtime_logging_LogListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, LogMessageNative)>>)
    _LogListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, LogMessageNative)>>)>>(
            'yandex_flutter_runtime_logging_LogListener_new')
        .asFunction(isLeaf: true);

final _LogListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_logging_LogListener_free');
void _LogListener_onMessageReceived(
    ffi.Pointer<ffi.Void> _ptr, LogMessageNative message) {
  final listener = LogListenerImpl._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener.onMessageReceived(LogMessageImpl.fromNative(message));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}

@bindings_annotations.WeakInterface('runtime.logging.Logging')
@bindings_annotations.ContainerData(
    toNative: 'LoggingImpl.getNativePtr',
    toPlatform:
        '(val) => LoggingImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'Logging')
class LoggingImpl implements Logging, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_Logging_free.cast());

  /// @nodoc
  LoggingImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  LoggingImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory LoggingImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(Logging? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as LoggingImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _Logging_check(ptr);
  }

  @internal

  /// @nodoc
  static Logging? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return LoggingImpl.fromNativePtr(ptr);
  }

  void subscribe(LogListener logListener) {
    _Logging_subscribe(ptr, LogListenerImpl.getNativePtr(logListener));
    exception.checkCallResult();
  }

  void unsubscribe(LogListener logListener) {
    _Logging_unsubscribe(ptr, LogListenerImpl.getNativePtr(logListener));
    exception.checkCallResult();
  }
}

final _Logging_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_logging_Logging_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _Logging_check = lib.library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_runtime_logging_Logging_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Logging_subscribe = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_logging_Logging_subscribe')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _Logging_unsubscribe = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_runtime_logging_Logging_unsubscribe')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _Logging_set = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_runtime_logging_Logging_set_')
    .asFunction(isLeaf: true);

Logging _getLogging() {
  final result = _LoggingFactory_getLogging();
  return LoggingImpl.fromNativePtr(result);
}

final ffi.Pointer<ffi.Void> Function() _LoggingFactory_getLogging = lib.library
    .lookup<ffi.NativeFunction<ffi.Pointer<ffi.Void> Function()>>(
        'yandex_flutter_runtime_logging_LoggingFactory_getLogging')
    .asFunction();
