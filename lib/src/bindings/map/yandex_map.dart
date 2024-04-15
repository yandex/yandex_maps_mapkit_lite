import 'package:flutter/material.dart';

import 'package:yandex_maps_mapkit_lite/mapkit.dart';
import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/view/platform_view.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/view/platform_view_type.dart';

class YandexMap extends StatefulWidget {
  const YandexMap({
    super.key,
    required this.onMapCreated,
    this.platformViewType = PlatformViewType.Compat,
    this.textDirection,
  });

  @override
  State<StatefulWidget> createState() {
    return _MapState();
  }

  final void Function(MapWindow) onMapCreated;
  final PlatformViewType platformViewType;
  final TextDirection? textDirection;
}

class _MapState extends State<YandexMap> {
  @override
  Widget build(BuildContext context) {
    return PlatformView.create(
      (view) {
        if (!mounted) {
          return false;
        }

        final window = mapkit.createMapWindow(view);
        widget.onMapCreated(window);

        return true;
      },
      platformViewType: widget.platformViewType,
      textDirection: widget.textDirection,
    );
  }
}
