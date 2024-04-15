package com.yandex.maps.flutter

import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleAdapter

interface LifecycleListener {
    fun onForeground()
    fun onBackground()
}

class ActivityLifecycleWrapper : ActivityAware, LifecycleObserver {
    private val listeners = mutableSetOf<LifecycleListener>()
    private var lifecycle: Lifecycle? = null

    fun isForeground() : Boolean {
        val state = lifecycle?.currentState?.isAtLeast(Lifecycle.State.RESUMED);

        return state != null && state;
    }

    fun addListener(listener: LifecycleListener) {
        listeners.add(listener)
    }

    fun removeListener(listener: LifecycleListener) {
        listeners.remove(listener)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        lifecycle = FlutterLifecycleAdapter.getActivityLifecycle(binding)
        lifecycle?.addObserver(this)
    }

    override fun onDetachedFromActivity() {
        lifecycle?.removeObserver(this)
        lifecycle = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_START)
    private fun onStart() {
        listeners.forEach(LifecycleListener::onForeground)
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
    private fun onStop() {
        listeners.forEach(LifecycleListener::onBackground)
    }
}
