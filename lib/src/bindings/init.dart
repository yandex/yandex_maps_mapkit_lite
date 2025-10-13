import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
import 'package:yandex_maps_mapkit_lite/runtime.dart';

import 'common/mapkit_method_channel.dart';
import 'common/library.dart';

final void Function(Pointer<Void>) _init = library
    .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_dart_init')
    .asFunction(isLeaf: true);

final bool Function() _isInit = library
    .lookup<NativeFunction<Bool Function()>>('yandex_maps_flutter_is_init')
    .asFunction(isLeaf: true);

final void Function(int) _attachEngineToCurrentIsolate = library
    .lookup<NativeFunction<Void Function(Int)>>(
        'yandex_maps_flutter_attach_engine_to_current_isolate')
    .asFunction();

bool _initDartApiCalled = false;

Future<void> initDartApi() async {
  if (_initDartApiCalled) return;
  _initDartApiCalled = true;

  _init(NativeApi.initializeApiDLData);
  final engineId = await const MapkitMethodChannel('runtime')
      .invokeMethod<int>('onDartVMCreated');
  _attachEngineToCurrentIsolate(engineId!);
}

Future<void> initMapkit(
    {required String apiKey,
    String? locale,
    String? userId,
    Map<String, String> options = const {}}) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (_isInit()) {
    // For update global isolate.
    await initDartApi();
    return;
  }

  Runtime.setPreinitializationOptions(options);

  await initDartApi();

  I18nManagerFactory.setLocale(locale);
  mapkit.setApiKey(apiKey);

  if (userId != null) {
    mapkit.setUserId(userId);
  }
}
