package com.yandex.maps.flutter.view

import android.content.Context
import com.yandex.maps.flutter.LifecycleListener
import com.yandex.runtime.view.PlatformGLSurfaceView
import com.yandex.runtime.view.internal.PlatformGLRenderer

class SurfaceView(context: Context, id: Int, factory: ViewFactory) :
    PlatformGLSurfaceView(context), FlutterView, LifecycleListener {
    private val id = id
    private val factory = factory
    private var isInitialize = false
    private var contextCreated = false

    init {
        factory.getLifecycle().addListener(this)
    }

    override fun dispose() {
        factory.getLifecycle().removeListener(this)
        factory.removeView(id)
    }

    override fun startView() {
        isInitialize = true
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
        if (isInitialize && factory.getLifecycle().isForeground()) {
            super.start()
        }
    }

    override fun onContextCreated() {
        if (isInitialize) {
            super.onContextCreated()
        }
        contextCreated = true
    }

    override fun onSizeChanged(w: Int, h: Int, oldw: Int, oldh: Int) {
        if (isInitialize) {
            super.onSizeChanged(w, h, oldw, oldh)
        }
    }

    override fun onForeground() {
        if (isInitialize) {
            start()
            resume()
        }
    }

    override fun onBackground() {
        if (isInitialize) {
            pause()
            stop()
        }
    }

    external override fun getPlatformViewPtr(): Long
}
