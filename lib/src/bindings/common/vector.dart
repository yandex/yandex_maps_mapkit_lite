import 'dart:collection';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'library.dart';

final Pointer<Void> Function(Pointer<Void>, int) _vector_get_value = library
    .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Size)>>(
        'yandex_maps_flutter_vector_get_value')
    .asFunction(isLeaf: true);

final int Function(Pointer<Void>) _vector_get_size = library
    .lookup<NativeFunction<Size Function(Pointer<Void>)>>(
        'yandex_maps_flutter_vector_get_size')
    .asFunction(isLeaf: true);

final Pointer<Void> Function(Pointer<Pointer<Void>>, int) _vector_new = library
    .lookup<
        NativeFunction<
            Pointer<Void> Function(Pointer<Pointer<Void>>,
                Size)>>('yandex_maps_flutter_vector_new')
    .asFunction(isLeaf: true);

final _vector_free_native =
    library.lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_vector_free');

final void Function(Pointer<Void>) _vector_free =
    _vector_free_native.asFunction(isLeaf: true);

class Vector<T> extends ListBase<T> implements Finalizable {
  @internal
  Vector(this._ptr, this._f) {
    _finalizer.attach(this, _ptr, detach: this);
  }

  @override
  int get length => _vector_get_size(_ptr);

  @override
  set length(int _) => throw UnsupportedError("Vector read-only");

  @override
  T operator [](int index) {
    final value = _vector_get_value(_ptr, index);
    final result = _f(value);
    if (result != null) {
      return result;
    }
    throw RangeError("Vector out of range");
  }

  @override
  void operator []=(int index, T value) {
    throw UnsupportedError("Vector read-only");
  }

  static final _finalizer = NativeFinalizer(_vector_free_native);
  final Pointer<Void> _ptr;
  final T? Function(Pointer<Void>) _f;
}

@internal
Pointer<Void> toNativeVector<T>(
    List<T> obj, Pointer<Void> Function(T val) toNative) {
  if (obj is Vector<T>) {
    return obj._ptr;
  }

  final length = obj.length;
  final data = malloc.call<Pointer<Void>>(length);

  int i = 0;
  for (final val in obj) {
    final ptr = data.elementAt(i);
    ptr.value = toNative(val);
    i++;
  }

  return _vector_new(data, length);
}
