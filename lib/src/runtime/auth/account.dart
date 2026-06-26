import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
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

part 'account.containers.dart';
part 'account.impl.dart';

abstract class PasswordRequiredData {}

abstract class TokenListener implements ffi.Finalizable {
  /// Token was received.
  void onTokenReceived(core.String token);

  /// XToken is not valid anymore. Password must be re-entered.
  ///
  /// The class maintains a strong reference to the object in
  /// the 'data' parameter until it (the class) is invalidated.
  ///
  /// [data] Contains platform-specific data for user input.
  void onPasswordRequired(PasswordRequiredData data);

  /// An error occurred during OAuth token refresh (it might be a network
  /// error or an invalid response from the authentication server).
  void onTokenRefreshFailed(core.String message);
}

abstract class Account {
  /// Get the user's UID
  core.String uid();

  /// Makes a token request for the provider. This method may be called
  /// often (per each request). For best perfomance your implementation
  /// should cache the token. See [TokenListener] for additional
  /// information.
  void requestToken(TokenListener tokenListener);

  /// Invalidates the OAuth token for an active account. The next token
  /// request occurs on a new OAuth token request from XToken.
  void invalidateToken(core.String token);

  /// Creates the HTTP authorization header for requests. return null if
  /// default authorization needed ('OAuth token').
  core.String? httpAuth(core.String token);
}
