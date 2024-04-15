import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'version.containers.dart';

/// @nodoc
final class VersionNative extends ffi.Struct {
  external native_types.NativeString str;
}

final VersionNative Function(native_types.NativeString) _VersionNativeInit = lib
    .library
    .lookup<
            ffi
            .NativeFunction<VersionNative Function(native_types.NativeString)>>(
        'yandex_flutter_mapkit_Version_init')
    .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'Version.toPointer',
    toPlatform: '(val) => Version.fromPointer(val, needFree: false)')
class Version {
  final core.String str;

  const Version({
    required this.str,
  });

  /// @nodoc
  @internal
  Version.fromNative(VersionNative native)
      : this(str: to_platform.toPlatformString(native.str));

  /// @nodoc
  @internal
  static VersionNative toNative(Version c) {
    return _VersionNativeInit(to_native.toNativeString(c.str));
  }

  /// @nodoc
  @internal
  static Version? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = Version.fromNative(ptr.cast<VersionNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(Version? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<VersionNative>();
    result.ref = toNative(val);

    return result.cast<ffi.Void>();
  }
}
