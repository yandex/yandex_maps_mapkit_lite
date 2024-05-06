import 'dart:ffi';

import 'src/bindings/common/library.dart';
import 'src/mapkit/mapkit.dart';

final Pointer<Void> Function() _get_factory = library
    .lookup<NativeFunction<Pointer<Void> Function()>>(
        'maps_flutter_get_mapkit_factory')
    .asFunction(isLeaf: true);

final mapkit = MapKitImpl.fromNativePtr(_get_factory());
