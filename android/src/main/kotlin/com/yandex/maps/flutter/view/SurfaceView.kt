package com.yandex.maps.flutter.view

import android.content.Context
import com.yandex.maps.flutter.LifecycleListener
import com.yandex.runtime.view.PlatformGLSurfaceView
import com.yandex.runtime.view.internal.PlatformGLRenderer

class SurfaceView(context: Context, id: Int, factory: ViewFactory) :
    PlatformGLSurfaceView(context), FlutterView, LifecycleListener {
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
            onSizeChanged(pendingSize!!.first, pendingSize!!.second, 0, 0)
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

    override fun onSizeChanged(w: Int, h: Int, oldw: Int, oldh: Int) {
        if (isInitialized) {
            super.onSizeChanged(w, h, oldw, oldh)
        } else {
            pendingSize = Pair(w, h)
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
