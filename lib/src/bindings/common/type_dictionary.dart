import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'library.dart';
import 'native_types.dart';
import 'struct_factory.dart';

final Pointer<Void> Function(Pointer<Void>, NativeString) _get_native = library
    .lookup<
        NativeFunction<
            Pointer<Void> Function(Pointer<Void>,
                NativeString)>>('yandex_maps_flutter_type_dictionary_get')
    .asFunction(isLeaf: true);

final Pointer<Void> Function(Pointer<_TypeDictionaryData>, int) _new_native =
    library
        .lookup<
            NativeFunction<
                Pointer<Void> Function(Pointer<_TypeDictionaryData>,
                    Size)>>('yandex_maps_flutter_type_dictionary_new')
        .asFunction(isLeaf: true);

final class _TypeDictionaryData extends Struct {
  external NativeString key;
  external Pointer<Void> value;
}

@internal
abstract class TypeDictionaryBase<T> {
  const TypeDictionaryBase();

  U? get<U extends T>(StructFactory<U> factory);

  @internal
  Pointer<Void> getNativePtr();
}

@internal
class NativeTypeDictionary<T> extends TypeDictionaryBase<T> {
  const NativeTypeDictionary(this._ptr);

  @override
  U? get<U extends T>(StructFactory<U> factory) {
    final typeName = factory.typeName();
    var parentPtr = _get_native(_ptr, typeName);

    if (parentPtr == nullptr) {
      return null;
    }

    return factory.fromParent(parentPtr);
  }

  @internal
  @override
  Pointer<Void> getNativePtr() => _ptr;

  final Pointer<Void> _ptr;
}

class TypeDictionary<T extends AbstractStructRuntime>
    extends TypeDictionaryBase<T> {
  const TypeDictionary._(this._data);

  TypeDictionary(List<T> data) : _data = _createMap(data);

  static Map<NativeString, Pointer<Void>>
      _createMap<T extends AbstractStructRuntime>(List<T> data) {
    final types = Map<NativeString, Pointer<Void>>();

    for (final val in data) {
      StructFactory factory = val.runtimeFactory;
      final typeName = factory.typeName();
      final parentPtr = factory.toParent(val);

      types[typeName] = parentPtr;
    }

    return types;
  }

  @override
  U? get<U extends T>(StructFactory<U> factory) {
    final typeName = factory.typeName();
    final parent = _data[typeName];

    if (parent == null || parent.address == 0) {
      return null;
    }
    return factory.fromParent(parent);
  }

  @override
  Pointer<Void> getNativePtr() {
    final nativeData = malloc.call<_TypeDictionaryData>(_data.length);

    int i = 0;
    for (var it in _data.entries) {
      final ref = nativeData.elementAt(i).ref;
      ref.key = it.key;
      ref.value = it.value;
      i++;
    }

    return _new_native(nativeData, i);
  }

  final Map<NativeString, Pointer<Void>> _data;
}
