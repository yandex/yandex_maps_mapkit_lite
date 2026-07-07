package com.yandex.maps.flutter.view

import android.content.Context
import com.yandex.maps.flutter.LifecycleListener
import com.yandex.runtime.view.PlatformGLTextureView
import com.yandex.runtime.view.internal.PlatformGLRenderer

class TextureView(context: Context, id: Int, factory: ViewFactory) :
    PlatformGLTextureView(context), FlutterView, LifecycleListener {
    private val id = id
    private val factory = factory
    private var isInitialized = false
    private var contextCreated = false

    private var pendingSize: Pair<Int, Int>? = null

    init {
        factory.getLifecycle().addListener(this)
    }

    override fun dispose() {
        factory.getLifecycle().removeListener(this)
        factory.removeView(id)
    }

    override fun startView() {
        isInitialized = true
        if (pendingSize != null) {
            onSizeChanged(pendingSize!!.first, pendingSize!!.second)
            pendingSize = null
        }
        if (contextCreated) {
            onContextCreated()
        }
        start()
        (renderer as ViewRenderer).init()
    }

    override fun createRenderer(): PlatformGLRenderer {
        return ViewRenderer(this)
    }

    override fun start() {
        if (isInitialized && factory.getLifecycle().isForeground()) {
            super.start()
        }
    }

    override fun onContextCreated() {
        if (isInitialized) {
            super.onContextCreated()
        }
        contextCreated = true
    }

    override fun onSizeChanged(width: Int, height: Int) {
        if (isInitialized) {
            super.onSizeChanged(width, height)
        } else {
            pendingSize = Pair(width, height)
        }
    }

    override fun onForeground() {
        if (isInitialized) {
            start()
            resume()
        }
    }

    override fun onBackground() {
        if (isInitialized) {
            pause()
            stop()
        }
    }

    external override fun getPlatformViewPtr(): Long
}
