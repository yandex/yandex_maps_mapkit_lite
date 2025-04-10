import 'dart:collection';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'to_platform.dart';
import 'to_native.dart';
import 'library.dart';
import 'native_types.dart';

final class _NativeData extends Struct {
  external NativeString key;
  external Pointer<Void> value;
}

final Pointer<Void> Function(Pointer<Void>, NativeString) _map_get_value =
    library
        .lookup<
            NativeFunction<
                Pointer<Void> Function(Pointer<Void>,
                    NativeString)>>('yandex_maps_flutter_string_map_get_value')
        .asFunction(isLeaf: true);

final int Function(Pointer<Void>) _map_get_size = library
    .lookup<NativeFunction<Size Function(Pointer<Void>)>>(
        'yandex_maps_flutter_string_map_get_size')
    .asFunction(isLeaf: true);

final _map_free_native =
    library.lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_string_map_free');

final Pointer<Void> Function(Pointer<_NativeData>, int) _map_new = library
    .lookup<NativeFunction<Pointer<Void> Function(Pointer<_NativeData>, Size)>>(
        'yandex_maps_flutter_string_map_new')
    .asFunction(isLeaf: true);

final Pointer<Void> Function(Pointer<Void>) _map_iterator_begin = library
    .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
        'yandex_maps_flutter_string_map_iterator_begin')
    .asFunction(isLeaf: true);

final bool Function(Pointer<Void>) _map_iterator_is_end = library
    .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
        'yandex_maps_flutter_string_map_iterator_is_end')
    .asFunction(isLeaf: true);

final _map_iterator_free_native =
    library.lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_string_map_iterator_free');

final NativeString Function(Pointer<Void>) _map_iterator_get_value = library
    .lookup<NativeFunction<NativeString Function(Pointer<Void>)>>(
        'yandex_maps_flutter_string_map_iterator_get_value')
    .asFunction(isLeaf: true);

final void Function(Pointer<Void>) _map_iterator_next = library
    .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_string_map_iterator_next')
    .asFunction(isLeaf: true);

class _IteratorMap implements Iterator<String>, Finalizable {
  _IteratorMap(this._map) : _it = nullptr {
    _finalizer.attach(this, _it, detach: this);
  }

  @override
  String get current => toPlatformString(_map_iterator_get_value(_it));

  @override
  bool moveNext() {
    if (_it == nullptr) {
      _it = _map_iterator_begin(_map);
      return !_map_iterator_is_end(_it);
    }
    _map_iterator_next(_it);
    return !_map_iterator_is_end(_it);
  }

  static final _finalizer = NativeFinalizer(_map_iterator_free_native);
  final Pointer<Void> _map;
  Pointer<Void> _it;
}

class _IterableMap extends Iterable<String> {
  _IterableMap(this._ptr);

  @override
  Iterator<String> get iterator => _IteratorMap(_ptr);

  final Pointer<Void> _ptr;
}

class StringMap<T> extends UnmodifiableMapBase<String, T>
    implements Finalizable {
  @internal
  StringMap(this._ptr, this._f) {
    _finalizer.attach(this, _ptr, detach: this);
  }

  @override
  T? operator [](Object? key) {
    if (key != null) {
      final val = _map_get_value(_ptr, toNativeString(key as String));
      final result = _f(val);
      return result;
    }
    return null;
  }

  @override
  Iterable<String> get keys => _IterableMap(_ptr);

  @override
  int get length => _map_get_size(_ptr);

  static final _finalizer = NativeFinalizer(_map_free_native);
  final Pointer<Void> _ptr;
  final T? Function(Pointer<Void>) _f;
}

@internal
Pointer<Void> toNativeMap<T>(
    Map<String, T> obj, Pointer<Void> Function(T val) toNative) {
  if (obj is StringMap<T>) {
    return obj._ptr;
  }
  final length = obj.length;
  final data = malloc.call<_NativeData>(length);

  int i = 0;
  for (final it in obj.entries) {
    final ptr = data.elementAt(i);
    ptr.ref.key = toNativeString(it.key);
    ptr.ref.value = toNative(it.value);
    i++;
  }
  return _map_new(data, length);
}
