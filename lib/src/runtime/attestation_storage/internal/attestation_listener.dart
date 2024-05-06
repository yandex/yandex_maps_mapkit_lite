import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'attestation_listener.containers.dart';
part 'attestation_listener.impl.dart';

///
abstract class AttestationListener implements ffi.Finalizable {
  /// Attestation was received.
  ///
  /// This method will be called on a background thread.
  void onAttestationReceived(typed_data.ByteBuffer response);

  /// An error occurred during Attestation request.
  ///
  /// This method will be called on a background thread.
  void onAttestationFailed(core.String message);
}
