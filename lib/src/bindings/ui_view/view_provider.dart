import 'dart:async';
import 'dart:ffi';
import 'dart:ui' show Image, FlutterView;

import 'package:flutter/widgets.dart' hide Image, ImageProvider;
import 'package:flutter/rendering.dart' hide ImageProvider;

import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart';

class ViewProvider {
  ViewProvider(
      {FlutterView? view,
      required FutureOr<Widget> Function() builder,
      this.textDirection = TextDirection.ltr,
      this.id,
      this.cacheable = false})
      : _view = view ?? WidgetsBinding.instance.window,
        _builder = builder;

  final FlutterView _view;
  final FutureOr<Widget> Function() _builder;
  final TextDirection textDirection;
  final String? id;
  final bool cacheable;

  static final _heap = <Pointer<Void>, ViewProvider>{};

  Future<Image> _drawWidget() async {
    final repaintBoundary = RenderRepaintBoundary();
    final widget = await _builder();
    final mediaQuery = MediaQueryData.fromWindow(_view);
    final renderView = _OffscreenRenderView(
        _view,
        ViewConfiguration(
          size: mediaQuery.size,
          devicePixelRatio: mediaQuery.devicePixelRatio,
        ),
        repaintBoundary);

    renderView.markNeedsLayout();
    final pipelineOwner = PipelineOwner()..rootNode = renderView;
    renderView.prepareInitialFrame();
    pipelineOwner.requestVisualUpdate();

    final buildOwner = BuildOwner(focusManager: FocusManager());
    final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: MediaQuery(
        data: mediaQuery,
        child: Directionality(
          textDirection: textDirection,
          child: IntrinsicHeight(child: IntrinsicWidth(child: widget)),
        ),
      ),
    ).attachToRenderTree(buildOwner);

    if (!repaintBoundary.hasSize) {
      final frameReady = Completer();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        frameReady.complete();
      });
      await frameReady.future;
    }

    buildOwner.buildScope(rootElement);
    pipelineOwner
      ..flushLayout()
      ..flushCompositingBits()
      ..flushPaint();
    renderView.compositeFrame();
    pipelineOwner.flushSemantics();
    buildOwner.finalizeTree();

    return repaintBoundary.toImage(pixelRatio: mediaQuery.devicePixelRatio);
  }
}

class _OffscreenRenderView extends RenderView {
  final RenderRepaintBoundary repaintBoundary;

  _OffscreenRenderView(
      FlutterView view, ViewConfiguration configuration, this.repaintBoundary)
      : super(
          child: RenderPositionedBox(
            child: repaintBoundary,
          ),
          configuration: configuration,
          view: view,
        );

  @override
  void compositeFrame() {}
}

Pointer<Void> _onRequest(Pointer<Void> nativeObject) {
  final provider = ViewProvider._heap[nativeObject]!;
  return toNativeImageProvider(ImageProvider(
    provider._drawWidget,
    id: provider.id,
    cacheable: provider.cacheable,
  ));
}

void _onDestruction(Pointer<Void> nativeObject) {
  ViewProvider._heap.remove(nativeObject);
}

extension ViewProviderNative on ViewProvider {
  static Map<Pointer<Void>, ViewProvider> get heap => ViewProvider._heap;

  static Pointer<Void> getOnRequestPtr() {
    return Pointer.fromFunction<Pointer<Void> Function(Pointer<Void>)>(
            _onRequest)
        .cast();
  }

  static Pointer<Void> getOnDestructionPtr() {
    return Pointer.fromFunction<Void Function(Pointer<Void>)>(_onDestruction)
        .cast();
  }
}
