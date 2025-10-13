package com.yandex.maps.flutter.method_handler

import com.yandex.maps.flutter.YandexMapsPlugin
import com.yandex.runtime.Runtime
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class RuntimeMethodHandler(binding: FlutterPluginBinding, private val plugin: YandexMapsPlugin) :
    BaseMethodHandler(binding, "runtime") {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "onDartVMCreated" -> {
                val engineId = Runtime.onDartVMCreated()
                plugin.initEngineId(engineId)
                result.success(engineId)
            }

            else -> result.notImplemented()
        }
    }
}
