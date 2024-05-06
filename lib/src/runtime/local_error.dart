import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;

part 'local_error.containers.dart';
part 'local_error.impl.dart';

/// Local error has occurred.
abstract class LocalError implements runtime_error.Error, ffi.Finalizable {}

/// Disk is full.
abstract class DiskFullError implements LocalError, ffi.Finalizable {}

/// Disk is corrupted.
abstract class DiskCorruptError implements LocalError, ffi.Finalizable {}

/// The application does not have the required write permissions.
abstract class DiskWriteAccessError
    implements DiskCorruptError, ffi.Finalizable {}
