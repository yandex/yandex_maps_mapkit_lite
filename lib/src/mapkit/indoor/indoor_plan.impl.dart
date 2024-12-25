part of 'indoor_plan.dart';

final class IndoorLevelNative extends ffi.Struct {
  external native_types.NativeString id;
  external native_types.NativeString name;
  @ffi.Bool()
  external core.bool isUnderground;
}

final IndoorLevelNative Function(
        native_types.NativeString, native_types.NativeString, core.bool)
    _IndoorLevelNativeInit = lib.library
        .lookup<
            ffi.NativeFunction<
                IndoorLevelNative Function(
                    native_types.NativeString,
                    native_types.NativeString,
                    ffi.Bool)>>('yandex_flutter_mapkit_indoor_IndoorLevel_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'IndoorLevelImpl.toPointer',
    toPlatform: '(val) => IndoorLevelImpl.fromPointer(val, needFree: false)',
    platformType: 'IndoorLevel')
extension IndoorLevelImpl on IndoorLevel {
  static IndoorLevel fromNative(IndoorLevelNative native) {
    return IndoorLevel(
        id: to_platform.toPlatformString(native.id),
        name: to_platform.toPlatformString(native.name),
        isUnderground: native.isUnderground);
  }

  static IndoorLevelNative toNative(IndoorLevel obj) {
    return _IndoorLevelNativeInit(to_native.toNativeString(obj.id),
        to_native.toNativeString(obj.name), obj.isUnderground);
  }

  static IndoorLevel? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        IndoorLevelImpl.fromNative(ptr.cast<IndoorLevelNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(IndoorLevel? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<IndoorLevelNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'IndoorPlanImpl.getNativePtr',
    toPlatform:
        '(val) => IndoorPlanImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'IndoorPlan')
class IndoorPlanImpl implements IndoorPlan, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_IndoorPlan_free.cast());

  /// @nodoc
  IndoorPlanImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  IndoorPlanImpl.fromNativePtr(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(IndoorPlan? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as IndoorPlanImpl).ptr;
  }

  @internal

  /// @nodoc
  static IndoorPlan? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return IndoorPlanImpl.fromNativePtr(ptr);
  }

  @core.override
  core.List<IndoorLevel> get levels {
    final result = _IndoorPlan_get_levels(ptr);
    return IndoorLevelContainerExtension.toPlatformVector(result);
  }

  @core.override
  core.String get activeLevelId {
    final result = _IndoorPlan_get_activeLevelId(ptr);
    return to_platform.toPlatformString(result);
  }

  @core.override
  set activeLevelId(core.String val) {
    _IndoorPlan_set_activeLevelId(ptr, to_native.toNativeString(val));
  }
}

final _IndoorPlan_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_indoor_IndoorPlan_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _IndoorPlan_get_levels = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_indoor_IndoorPlan_get_levels')
        .asFunction();

final native_types.NativeString Function(ffi.Pointer<ffi.Void>)
    _IndoorPlan_get_activeLevelId = lib.library
        .lookup<
                ffi.NativeFunction<
                    native_types.NativeString Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_indoor_IndoorPlan_get_activeLevelId')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _IndoorPlan_set_activeLevelId = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'yandex_flutter_mapkit_indoor_IndoorPlan_set_activeLevelId')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>, core.int) _IndoorPlan_set = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Void Function(ffi.Pointer<ffi.Void>,
                ffi.Int64)>>('yandex_flutter_mapkit_indoor_IndoorPlan_set_')
    .asFunction(isLeaf: true);
