package com.yandex.maps.flutter.method_handler

import com.yandex.maps.flutter.view.ViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class ViewMethodHandler(binding: FlutterPluginBinding, viewFactory: ViewFactory) : BaseMethodHandler(binding, "view") {
    private val viewFactory = viewFactory

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getViewPtr" -> getViewPtr(call, result)
            "startView" -> startView(call, result)
            else -> result.notImplemented()
        }
    }

    private fun getViewPtr(call: MethodCall, result: MethodChannel.Result) {
        val id = call.argument<Int>("id")!!

        result.success(viewFactory.viewPtr(id))
    }

    private fun startView(call: MethodCall, result: MethodChannel.Result) {
        val id = call.argument<Int>("id")!!

        viewFactory.startView(id)

        result.success(null)
    }
}
