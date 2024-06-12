import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/view/platform_view.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/view/platform_view_type.dart';

abstract class PlatformViewWidget extends StatefulWidget {
  const PlatformViewWidget({
    super.key,
    required this.onViewCreated,
    this.platformViewType = PlatformViewType.Compat,
    this.textDirection,
    this.gestureRecognizers = const <Factory<OneSequenceGestureRecognizer>>{},
    this.hitTestBehavior = PlatformViewHitTestBehavior.opaque,
  });

  final bool Function(PlatformView) onViewCreated;
  final PlatformViewType platformViewType;
  final TextDirection? textDirection;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;
  final PlatformViewHitTestBehavior hitTestBehavior;

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
      gestureRecognizers: widget.gestureRecognizers,
      hitTestBehavior: widget.hitTestBehavior,
    );
  }
}
