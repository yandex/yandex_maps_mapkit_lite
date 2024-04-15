class WeakMap<K, V> {
  Expando _container = Expando();

  V? operator [](K object) {
    return _container[object!] as V?;
  }

  void operator []=(K object, V value) {
    _container[object!] = value;
  }
}
