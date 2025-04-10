import 'dart:async';
import 'dart:ffi';
import 'dart:ui' show Image, FlutterView, PlatformDispatcher;

import 'package:flutter/widgets.dart' hide Image, ImageProvider;
import 'package:flutter/rendering.dart' hide ImageProvider;

import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart';

class ViewProvider {
  ViewProvider({
    FlutterView? view,
    required FutureOr<Widget> Function() builder,
    this.textDirection = TextDirection.ltr,
    this.id,
    this.cacheable = false,
    this.onError,
  })  : _view = view ?? PlatformDispatcher.instance.views.first,
        _builder = builder;

  final FlutterView _view;
  final FutureOr<Widget> Function() _builder;
  final TextDirection textDirection;
  final String? id;
  final bool cacheable;
  final Function? onError;

  static final _heap = <Pointer<Void>, ViewProvider>{};

  Future<Image> _drawWidget() async {
    final repaintBoundary = RenderRepaintBoundary();
    final widget = await _builder();
    final mediaQuery = MediaQueryData.fromView(_view);
    final renderView = _OffscreenRenderView(
        _view, ViewConfiguration.fromView(_view), repaintBoundary);

    renderView.markNeedsLayout();
    final pipelineOwner = PipelineOwner()..rootNode = renderView;
    renderView.prepareInitialFrame();
    pipelineOwner.requestVisualUpdate();

    bool isDirty = false;

    final buildOwner = BuildOwner(
        focusManager: FocusManager(),
        onBuildScheduled: () {
          isDirty = true;
        });
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

    buildOwner.buildScope(rootElement);
    pipelineOwner.flushLayout();

    if (!repaintBoundary.hasSize) {
      final frameReady = Completer();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        frameReady.complete();
      });
      await frameReady.future;

      buildOwner.buildScope(rootElement);
      pipelineOwner.flushLayout();
    }

    pipelineOwner
      ..flushCompositingBits()
      ..flushPaint();

    renderView.compositeFrame();
    pipelineOwner.flushSemantics();
    buildOwner.finalizeTree();

    Image? image;

    int retryCounter = 3;

    do {
      isDirty = false;

      image?.dispose();

      image = await repaintBoundary.toImage(
          pixelRatio: mediaQuery.devicePixelRatio);

      if (isDirty) {
        buildOwner.buildScope(rootElement);
        pipelineOwner.flushLayout();
        pipelineOwner.flushCompositingBits();
        pipelineOwner.flushPaint();
        renderView.compositeFrame();
        pipelineOwner.flushSemantics();
        buildOwner.finalizeTree();
      }

      retryCounter--;
    } while (isDirty && retryCounter >= 0);

    buildOwner.finalizeTree();

    return image;
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
  return toNativeImageProvider(ImageProvider(provider._drawWidget,
      id: provider.id,
      cacheable: provider.cacheable,
      onError: provider.onError));
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
