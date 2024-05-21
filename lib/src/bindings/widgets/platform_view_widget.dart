import 'package:flutter/widgets.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/view/platform_view.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/view/platform_view_type.dart';

abstract class PlatformViewWidget extends StatefulWidget {
  const PlatformViewWidget({
    super.key,
    required this.onViewCreated,
    this.platformViewType = PlatformViewType.Compat,
    this.textDirection,
  });

  final bool Function(PlatformView) onViewCreated;
  final PlatformViewType platformViewType;
  final TextDirection? textDirection;

  @override
  State createState() => _PlatformViewWidgetState();
}

class _PlatformViewWidgetState extends State<PlatformViewWidget> {
  @override
  Widget build(BuildContext context) {
    return PlatformView.create(
      (view) {
        if (!mounted) {
          return false;
        }
        return widget.onViewCreated(view);
      },
      platformViewType: widget.platformViewType,
      textDirection: widget.textDirection,
    );
  }
}
