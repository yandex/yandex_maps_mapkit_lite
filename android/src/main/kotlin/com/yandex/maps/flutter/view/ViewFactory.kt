package com.yandex.maps.flutter.view

import android.content.Context
import com.yandex.maps.flutter.ActivityLifecycleWrapper
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import java.lang.ref.WeakReference

class ViewFactory(lifecycleWrapper: ActivityLifecycleWrapper) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    private val views = HashMap<Int, FlutterView>()
    private val lifecycleWrapper = lifecycleWrapper

    fun removeView(id: Int) {
        views.remove(id)
    }

    fun viewPtr(id: Int): Long {
        return views[id]!!.getPlatformViewPtr()
    }

    fun startView(id: Int) {
        views[id]!!.startView()
    }

    fun getLifecycle(): ActivityLifecycleWrapper {
        return lifecycleWrapper
    }

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val params = args!! as Map<String, String>

        val view = when (params["viewType"]!!) {
            "texture" -> TextureView(context, viewId, this)
            "surface" -> SurfaceView(context, viewId, this)

            else -> throw RuntimeException("Undefined view type")
        }

        views[viewId] = view
        return view
    }
}
