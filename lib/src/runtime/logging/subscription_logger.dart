import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/bindings/weak_map/weak_map.dart'
    as weak_map;

part 'subscription_logger.containers.dart';
part 'subscription_logger.impl.dart';

/// Represents a log message with its metadata.

final class LogMessage {
  /// Absolute timestamp of the log message.
  final core.DateTime time;

  /// Severity level of the log message.
  final LogMessageLogLevel level;

  /// Scope or category of the log message.
  final core.String scope;

  /// The log message content.
  final core.String message;

  /// Additional verbose information about the log message. Used for
  /// logging exceptions with call stack.
  final core.String verboseInfo;

  const LogMessage(
    this.time,
    this.level, {
    required this.scope,
    required this.message,
    required this.verboseInfo,
  });

  @core.override
  core.int get hashCode =>
      core.Object.hashAll([time, level, scope, message, verboseInfo]);

  @core.override
  core.bool operator ==(covariant LogMessage other) {
    if (core.identical(this, other)) {
      return true;
    }
    return time == other.time &&
        level == other.level &&
        scope == other.scope &&
        message == other.message &&
        verboseInfo == other.verboseInfo;
  }

  @core.override
  core.String toString() {
    return "LogMessage(time: $time, level: $level, scope: $scope, message: $message, verboseInfo: $verboseInfo)";
  }
}

/// Log level severity.
enum LogMessageLogLevel {
  Error,
  Warning,
  Info,
  Debug,
  ;
}

/// Listener interface for receiving log messages.
abstract class LogListener {
  /// Called when a new log message is received.
  ///
  /// [message] The log message that was received.
  void onMessageReceived(LogMessage message);
}

/// Interface for subscribing to and unsubscribing from log messages.
abstract class Logging implements ffi.Finalizable {
  /// Subscribes a listener to receive log messages.
  ///
  /// The class does not retain the object in the 'logListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  ///
  /// [logListener] The listener to subscribe.
  void subscribe(LogListener logListener);

  /// Unsubscribes a listener from receiving log messages.
  ///
  /// The class does not retain the object in the 'logListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  ///
  /// [logListener] The listener to unsubscribe.
  void unsubscribe(LogListener logListener);

  core.bool isValid();
}

class LoggingFactory {
  LoggingFactory._();

  /// Returns the Logging instance for subscribing to log messages.
  /// Return The Logging instance.
  static Logging getLogging() {
    return _getLogging();
  }
}
