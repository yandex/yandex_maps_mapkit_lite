import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart';

import 'dart:ffi';

final void Function(Pointer<Void>) _removeDeletedHandle = library
    .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'yandex_maps_flutter_remove_deleted_handle')
    .asFunction();

void removeDeletedUserData(Pointer<Void> ptr) {
  _removeDeletedHandle(ptr);
}
