import 'dart:ffi';

import 'library.dart';
import 'native_types.dart';
import 'to_native.dart';

final void Function(NativeString) _nativeAssert = library
    .lookup<NativeFunction<Void Function(NativeString)>>(
        'yandex_maps_flutter_native_assert')
    .asFunction(isLeaf: true);

void nativeAssert(String message) {
  _nativeAssert(toNativeString(message));
}

class AsyncErrorHandler {
  final Function? _onError;

  AsyncErrorHandler(this._onError);

  void onError(Object error, StackTrace stack) {
    if (_onError == null) {
      nativeAssert(
          'Unhandled exception $error in AsyncDispatcherHeap handler. Do not throw exception from callbacks passed to mapkit or pass onError callback:\n$stack');
      return;
    }

    if (_onError is Function(Object)) {
      _onError!(error);
    } else if (_onError is Function(Object, StackTrace)) {
      _onError!(error, stack);
    }
  }
}
