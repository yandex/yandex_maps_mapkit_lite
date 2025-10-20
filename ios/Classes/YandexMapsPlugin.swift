import Flutter
import UIKit
import YandexMapsMobile

public class YandexMapsPlugin: NSObject, FlutterPlugin {
  private var _viewFactory: NativeViewFactory
  private var _engineId: Int?

  init(registrar: FlutterPluginRegistrar) {
        _viewFactory = NativeViewFactory(messenger: registrar.messenger())
        registrar.register(_viewFactory, withId: "flutter_yandex_maps_view_factory")
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
      let channel = FlutterMethodChannel(name: "flutter_yandex_mapkit/view", binaryMessenger: registrar.messenger())
      let channel2 = FlutterMethodChannel(name: "flutter_yandex_mapkit/runtime", binaryMessenger: registrar.messenger())
      let instance = YandexMapsPlugin(registrar: registrar)

      registrar.addMethodCallDelegate(instance, channel: channel)
      registrar.addMethodCallDelegate(instance, channel: channel2)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if (call.method == "getViewPtr") {
          let args = call.arguments as! Dictionary<String, Any>
          let id = args["id"] as! Int64

          result(self._viewFactory.getViewPtr(id: id))
      } else if (call.method == "startView") {
          let args = call.arguments as! Dictionary<String, Any>
          let id = args["id"] as! Int64

          self._viewFactory.startView(id: id)
          result(nil)
      } else if (call.method == "onDartVMCreated") {
          let args = call.arguments as! Dictionary<String, Any>
          let inReleaseMode = args["inReleaseMode"] as! Bool

          if (!inReleaseMode && _engineId != nil) {
              YRTRuntime.onDetachedFromEngine(withEngineId: _engineId!)
              result(_engineId!)
              return
          }

          let id = YRTRuntime.onDartVMCreated()
          if (_engineId != nil) {
              result(FlutterError(
                  code: "PluginInitError",
                  message: "Double initialization YandexMapsPlugin with id: \(_engineId), new id: \(id)",
                  details: nil
              ))
              return
          }
          _engineId = id
          result(id)
      }
  }

  public func detachFromEngine(for registrar: FlutterPluginRegistrar) {
      if (_engineId != nil) {
          YRTRuntime.onDetachedFromEngine(withEngineId: _engineId!)
      }
  }
}
