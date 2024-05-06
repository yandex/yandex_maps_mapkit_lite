import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'view_area.containers.dart';
part 'view_area.impl.dart';

final class ViewArea {
  final core.double lengthwise;
  final core.double transverse;

  const ViewArea({
    required this.lengthwise,
    required this.transverse,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([lengthwise, transverse]);

  @core.override
  core.bool operator ==(covariant ViewArea other) {
    if (core.identical(this, other)) {
      return true;
    }
    return lengthwise == other.lengthwise && transverse == other.transverse;
  }

  @core.override
  core.String toString() {
    return "ViewArea(lengthwise: $lengthwise, transverse: $transverse)";
  }
}
