import 'dart:ffi';

import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
import 'package:yandex_maps_mapkit_lite/src/runtime/i18n/i18n_manager.dart';

import 'common/mapkit_method_channel.dart';
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

Future<void> initMapkit(
    {required String apiKey,
    String? locale,
    String? userId,
    Map<String, String> options = const {}}) async {
  if (_isInit()) return;

  initDartApi();
  await const MapkitMethodChannel('runtime')
      .invokeMethod('init', {'options': options});

  I18nManagerFactory.setLocale(locale);
  mapkit.setApiKey(apiKey);

  if (userId != null) {
    mapkit.setUserId(userId);
  }
}
