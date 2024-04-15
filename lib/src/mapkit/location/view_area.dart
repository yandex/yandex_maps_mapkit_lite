import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'view_area.containers.dart';

/// @nodoc
final class ViewAreaNative extends ffi.Struct {
  @ffi.Double()
  external core.double lengthwise;
  @ffi.Double()
  external core.double transverse;
}

final ViewAreaNative Function(core.double, core.double) _ViewAreaNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ViewAreaNative Function(ffi.Double, ffi.Double)>>(
            'yandex_flutter_mapkit_location_ViewArea_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ViewArea.toPointer',
    toPlatform: '(val) => ViewArea.fromPointer(val, needFree: false)')
class ViewArea {
  final core.double lengthwise;
  final core.double transverse;

  const ViewArea({
    required this.lengthwise,
    required this.transverse,
  });

  /// @nodoc
  @internal
  ViewArea.fromNative(ViewAreaNative native)
      : this(lengthwise: native.lengthwise, transverse: native.transverse);

  /// @nodoc
  @internal
  static ViewAreaNative toNative(ViewArea c) {
    return _ViewAreaNativeInit(c.lengthwise, c.transverse);
  }

  /// @nodoc
  @internal
  static ViewArea? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = ViewArea.fromNative(ptr.cast<ViewAreaNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(ViewArea? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ViewAreaNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
