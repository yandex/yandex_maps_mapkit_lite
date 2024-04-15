class WeakInterface {
  final String name;

  const WeakInterface(this.name);
}

class ContainerData {
  const ContainerData({required this.toNative, required this.toPlatform});

  final String toNative;
  final String toPlatform;
}
