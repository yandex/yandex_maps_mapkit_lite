package com.yandex.maps.flutter

import android.util.Log
import androidx.annotation.NonNull
import com.yandex.maps.flutter.method_handler.BaseMethodHandler
import com.yandex.maps.flutter.method_handler.RuntimeMethodHandler
import com.yandex.maps.flutter.method_handler.ViewMethodHandler
import com.yandex.maps.flutter.view.ViewFactory

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

import com.yandex.runtime.Runtime

/** YandexMapsPlugin */
class YandexMapsPlugin : FlutterPlugin, ActivityAware {
    private val handlers = mutableListOf<BaseMethodHandler>()
    private val lifecycle = ActivityLifecycleWrapper()
    private var engineId: Int? = null

    fun initEngineId(id: Int) {
        if (engineId != null) {
            throw Exception("Double initialization YandexMapsPlugin with id: $engineId, new id: $id")
        }
        Log.d("YandexMapsPlugin", "Init engineId for YandexMapsPlugin: $id")
        engineId = id
    }


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        Log.d("YandexMapsPlugin", "Attach new plugin to engine")
        Runtime.init(flutterPluginBinding.applicationContext, "maps-mobile")

        val viewFactory = ViewFactory(lifecycle)
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "flutter_yandex_maps_view_factory",
            viewFactory
        )

        handlers.add(ViewMethodHandler(flutterPluginBinding, viewFactory))
        handlers.add(RuntimeMethodHandler(flutterPluginBinding, this))
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        Log.d("YandexMapsPlugin", "Detach plugin from engine with id: $engineId")
        Runtime.onDetachedFromEngine(engineId!!)
        for (handler in handlers) {
            handler.dispose()
        }
        handlers.clear()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        lifecycle.onAttachedToActivity(binding)

        handlers.forEach(BaseMethodHandler::start)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        lifecycle.onDetachedFromActivityForConfigChanges()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        lifecycle.onReattachedToActivityForConfigChanges(binding)
    }

    override fun onDetachedFromActivity() {
        lifecycle.onDetachedFromActivity()
    }
}
