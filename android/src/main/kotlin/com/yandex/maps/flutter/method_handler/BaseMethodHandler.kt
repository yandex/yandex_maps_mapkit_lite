package com.yandex.maps.flutter.method_handler

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

abstract class BaseMethodHandler(
    binding: FlutterPlugin.FlutterPluginBinding,
    channelName: String
) : MethodChannel.MethodCallHandler {
    private val methodChannel = MethodChannel(
        binding.binaryMessenger,
        "flutter_yandex_mapkit/$channelName"
    )

    open fun start() {
        methodChannel.setMethodCallHandler { call, result ->
            try {
                onMethodCall(call, result)
            } catch (e: Throwable) {
                result.error(this::class.java.simpleName, e.stackTraceToString(), null)
            }
        }
    }

    open fun dispose() {
        methodChannel.setMethodCallHandler(null)
    }
}
