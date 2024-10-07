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

part 'ui_experiment.containers.dart';
part 'ui_experiment.impl.dart';

final class ExperimentData {
  final core.int testId;
  final core.int userGroup;
  final core.int userBucket;

  const ExperimentData({
    required this.testId,
    required this.userGroup,
    required this.userBucket,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([testId, userGroup, userBucket]);

  @core.override
  core.bool operator ==(covariant ExperimentData other) {
    if (core.identical(this, other)) {
      return true;
    }
    return testId == other.testId &&
        userGroup == other.userGroup &&
        userBucket == other.userBucket;
  }

  @core.override
  core.String toString() {
    return "ExperimentData(testId: $testId, userGroup: $userGroup, userBucket: $userBucket)";
  }
}
