import 'dart:ffi';
import 'library.dart';

final Pointer<Void> Function() _runWithBlockUiStart = library
    .lookup<NativeFunction<Pointer<Void> Function()>>(
        'yandex_maps_flutter_async_run_with_block_ui_start')
    .asFunction(isLeaf: true);

final void Function(Pointer<Void>) _runWithBlockUiStop = library
    .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_async_run_with_block_ui_stop')
    .asFunction(isLeaf: true);

bool _uiBlocked = false;

/// Block the ui thread to ensure that the mapkit state does
/// not change until [callback] is completed.
/// [callback] must be synchronous function.
T runWithBlockUi<T>(T Function() callback) {
  if (callback is Future<void> Function()) {
    throw ArgumentError('must be synchronous function', 'callback');
  }

  if (_uiBlocked) {
    return callback();
  }

  final context = _runWithBlockUiStart();
  try {
    _uiBlocked = true;
    return callback();
  } finally {
    _uiBlocked = false;
    _runWithBlockUiStop(context);
  }
}
