import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'connectivity_status.containers.dart';

///
/// The status of the current connection to the internet.
@bindings_annotations.ContainerData(
    toNative: 'ConnectivityStatus.toPointer',
    toPlatform: '(val) => ConnectivityStatus.fromPointer(val, needFree: false)')
enum ConnectivityStatus {
  /// No connection to the internet.
  None,

  /// Mobile network connection.
  Cellular,

  /// Network connection with high throughput (Wi-Fi or Ethernet).
  Broadband,
  ;

  /// @nodoc
  @internal
  static ConnectivityStatus fromInt(core.int val) {
    return ConnectivityStatus.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(ConnectivityStatus e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static ConnectivityStatus? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(ConnectivityStatus? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}
