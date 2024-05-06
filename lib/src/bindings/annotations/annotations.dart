class WeakInterface {
  final String name;

  const WeakInterface(this.name);
}

class ContainerData {
  const ContainerData({
    required this.toNative,
    required this.toPlatform,
    this.platformType,
  });

  final String toNative;
  final String toPlatform;
  final String? platformType;
}
