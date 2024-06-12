import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:yandex_maps_mapkit_lite/src/bindings/common/mapkit_method_channel.dart';
import 'package:yandex_maps_mapkit_lite/src/runtime/view/gpu_info.dart';
import 'platform_view_type.dart';

class PlatformView {
  final Pointer<Void> nativePtr;

  const PlatformView._(this.nativePtr);

  static const viewType = 'flutter_yandex_maps_view_factory';
  static const channel = const MapkitMethodChannel('view');

  static Widget create(
    bool Function(PlatformView) onCreate, {
    required PlatformViewType platformViewType,
    required Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers,
    required PlatformViewHitTestBehavior hitTestBehavior,
    TextDirection? textDirection,
  }) {
    if (Platform.isAndroid) {
      return _AndroidView(
        platformViewType,
        textDirection,
        _onViewCreated(onCreate),
        gestureRecognizers,
        hitTestBehavior,
      );
    } else {
      final widget = UiKitView(
        viewType: viewType,
        layoutDirection: textDirection,
        onPlatformViewCreated: _onViewCreated(onCreate),
        gestureRecognizers: gestureRecognizers,
        hitTestBehavior: hitTestBehavior,
      );

      return widget;
    }
  }
}

class _AndroidView extends StatelessWidget {
  final PlatformViewType platformViewType;
  final TextDirection? textDirection;
  final void Function(int) onCreate;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;
  final PlatformViewHitTestBehavior hitTestBehavior;

  _AndroidView(this.platformViewType, this.textDirection, this.onCreate,
      this.gestureRecognizers, this.hitTestBehavior);

  @override
  Widget build(BuildContext context) {
    return _createView(textDirection ?? Directionality.of(context));
  }

  Widget _createView(TextDirection textDirection) {
    final creationParams = <String, String>{};
    switch (platformViewType) {
      case PlatformViewType.Hybrid:
        return _createHybridView(creationParams, textDirection);

      case PlatformViewType.Virtual:
        return _createVirtualView(creationParams, textDirection);

      case PlatformViewType.TextureHybrid:
        return _createTextureHybridView(creationParams, textDirection);
      case PlatformViewType.Compat:
        final gpuVendor = GpuInfoManager.glGpuVendor();
        final gpuRenderer = GpuInfoManager.glGpuRenderer();
        // This GPU may be blocked when rendering a map with a large number of vertices.
        return gpuVendor == 'PowerVR' && gpuRenderer == 'GE8320'
            ? _createVirtualView(creationParams, textDirection)
            : _createTextureHybridView(creationParams, textDirection);
    }
  }

  PlatformViewLink _createPlatformViewLink(
      PlatformViewController Function(PlatformViewCreationParams)
          onCreatePlatformView) {
    return PlatformViewLink(
      viewType: PlatformView.viewType,
      surfaceFactory: ((context, controller) => AndroidViewSurface(
            controller: controller as AndroidViewController,
            hitTestBehavior: hitTestBehavior,
            gestureRecognizers: gestureRecognizers,
          )),
      onCreatePlatformView: onCreatePlatformView,
    );
  }

  static void _setTextureViewType(Map<String, String> params) {
    params['viewType'] = 'texture';
  }

  static void _setSurfaceViewType(Map<String, String> params) {
    params['viewType'] = 'surface';
  }

  Widget _createHybridView(
      Map<String, String> creationParams, TextDirection textDirection) {
    _setSurfaceViewType(creationParams);
    return _createPlatformViewLink(
        (params) => PlatformViewsService.initExpensiveAndroidView(
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
              id: params.id,
              viewType: PlatformView.viewType,
              layoutDirection: textDirection,
              onFocus: () {
                params.onFocusChanged(true);
              },
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..addOnPlatformViewCreatedListener(onCreate)
              ..create());
  }

  Widget _createVirtualView(
      Map<String, String> creationParams, TextDirection textDirection) {
    _setSurfaceViewType(creationParams);
    return AndroidView(
      viewType: PlatformView.viewType,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
      layoutDirection: textDirection,
      onPlatformViewCreated: onCreate,
      gestureRecognizers: gestureRecognizers,
      hitTestBehavior: hitTestBehavior,
    );
  }

  Widget _createTextureHybridView(
      Map<String, String> creationParams, TextDirection textDirection) {
    _setTextureViewType(creationParams);
    return _createPlatformViewLink(
        (params) => PlatformViewsService.initSurfaceAndroidView(
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
              id: params.id,
              viewType: PlatformView.viewType,
              layoutDirection: textDirection,
              onFocus: () {
                params.onFocusChanged(true);
              },
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..addOnPlatformViewCreatedListener(onCreate)
              ..create());
  }
}

void Function(int) _onViewCreated(bool Function(PlatformView) onCreate) =>
    (id) async {
      final address = await PlatformView.channel
          .invokeMethod<int>('getViewPtr', {"id": id});
      final ptr = Pointer.fromAddress(address!);
      final view = PlatformView._(ptr.cast());

      if (onCreate(view)) {
        await PlatformView.channel.invokeMethod('startView', {'id': id});
      }
    };
