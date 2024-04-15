package com.yandex.maps.flutter.view

import io.flutter.plugin.platform.PlatformView

interface FlutterView : PlatformView {
    fun startView()

    fun getPlatformViewPtr(): Long
}
