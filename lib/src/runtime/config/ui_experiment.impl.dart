part of 'ui_experiment.dart';

final class ExperimentDataNative extends ffi.Struct {
  @ffi.Uint32()
  external core.int testId;
  @ffi.Uint32()
  external core.int userGroup;
  @ffi.Uint32()
  external core.int userBucket;
}

final ExperimentDataNative Function(core.int, core.int, core.int)
    _ExperimentDataNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    ExperimentDataNative Function(
                        ffi.Uint32, ffi.Uint32, ffi.Uint32)>>(
            'yandex_flutter_runtime_config_ExperimentData_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ExperimentDataImpl.toPointer',
    toPlatform: '(val) => ExperimentDataImpl.fromPointer(val, needFree: false)',
    platformType: 'ExperimentData')
extension ExperimentDataImpl on ExperimentData {
  static ExperimentData fromNative(ExperimentDataNative native) {
    return ExperimentData(
        testId: native.testId,
        userGroup: native.userGroup,
        userBucket: native.userBucket);
  }

  static ExperimentDataNative toNative(ExperimentData obj) {
    return _ExperimentDataNativeInit(obj.testId, obj.userGroup, obj.userBucket);
  }

  static ExperimentData? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        ExperimentDataImpl.fromNative(ptr.cast<ExperimentDataNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(ExperimentData? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ExperimentDataNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
