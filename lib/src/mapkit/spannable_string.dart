import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
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

part 'spannable_string.containers.dart';
part 'spannable_string.impl.dart';

abstract final class SpannableString implements ffi.Finalizable {
  factory SpannableString(
          core.String text, core.List<SpannableStringSpan> spans) =>
      SpannableStringImpl(text, spans);

  core.String get text;
  core.List<SpannableStringSpan> get spans;

  @core.override
  core.int get hashCode => core.Object.hashAll([text, spans]);

  @core.override
  core.bool operator ==(covariant SpannableString other) {
    if (core.identical(this, other)) {
      return true;
    }
    return text == other.text && spans == other.spans;
  }

  @core.override
  core.String toString() {
    return "SpannableString(text: $text, spans: $spans)";
  }
}

final class SpannableStringSpan {
  final core.int begin;
  final core.int end;

  const SpannableStringSpan({
    required this.begin,
    required this.end,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([begin, end]);

  @core.override
  core.bool operator ==(covariant SpannableStringSpan other) {
    if (core.identical(this, other)) {
      return true;
    }
    return begin == other.begin && end == other.end;
  }

  @core.override
  core.String toString() {
    return "SpannableStringSpan(begin: $begin, end: $end)";
  }
}
