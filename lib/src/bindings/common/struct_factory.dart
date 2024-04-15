import 'dart:ffi';
import 'package:meta/meta.dart';
import 'native_types.dart';

@internal
abstract class StructFactory<T> {
  const StructFactory();

  T create(Pointer<Void> ptr);
  T fromParent(Pointer<Void> ptr);
  Pointer<Void> toParent(T obj);
  NativeString typeName();
}

@internal
abstract class AbstractStructRuntime {
  StructFactory get runtimeFactory;
}
