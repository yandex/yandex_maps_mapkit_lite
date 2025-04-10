import 'dart:ffi';

import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
import 'package:yandex_maps_mapkit_lite/runtime.dart';

import 'common/library.dart';

final void Function(Pointer<Void>) _init = library
    .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_dart_init')
    .asFunction(isLeaf: true);

final bool Function() _isInit = library
    .lookup<NativeFunction<Bool Function()>>('yandex_maps_flutter_is_init')
    .asFunction(isLeaf: true);

void initDartApi() {
  _init(NativeApi.initializeApiDLData);
}

void initMapkit(
    {required String apiKey,
    String? locale,
    String? userId,
    Map<String, String> options = const {}}) {
  if (_isInit()) {
    // For update global isolate.
    initDartApi();
    return;
  }

  initDartApi();
  Runtime.setPreinitializationOptions(options);

  I18nManagerFactory.setLocale(locale);
  mapkit.setApiKey(apiKey);

  if (userId != null) {
    mapkit.setUserId(userId);
  }
}
