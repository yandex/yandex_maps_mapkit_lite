part of 'model_style.dart';

final class ModelStyleNative extends ffi.Struct {
  @ffi.Float()
  external core.double scale;
  @ffi.Int64()
  external core.int unitType;
  @ffi.Int64()
  external core.int renderMode;
  external ffi.Pointer<ffi.Void> variantName;
}

final ModelStyleNative Function(
        core.double, core.int, core.int, ffi.Pointer<ffi.Void>)
    _ModelStyleNativeInit = lib.library
        .lookup<
                ffi.NativeFunction<
                    ModelStyleNative Function(ffi.Float, ffi.Int64, ffi.Int64,
                        ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_ModelStyle_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ModelStyleImpl.toPointer',
    toPlatform: '(val) => ModelStyleImpl.fromPointer(val, needFree: false)',
    platformType: 'ModelStyle')
extension ModelStyleImpl on ModelStyle {
  static ModelStyle fromNative(ModelStyleNative native) {
    return ModelStyle(
        scale: native.scale,
        unitType: ModelStyleUnitTypeImpl.fromInt(native.unitType),
        renderMode: ModelStyleRenderModeImpl.fromInt(native.renderMode),
        variantName:
            to_platform.toPlatformFromPointerString(native.variantName));
  }

  static ModelStyleNative toNative(ModelStyle obj) {
    return _ModelStyleNativeInit(
        obj.scale,
        ModelStyleUnitTypeImpl.toInt(obj.unitType),
        ModelStyleRenderModeImpl.toInt(obj.renderMode),
        to_native.toNativePtrString(obj.variantName));
  }

  static ModelStyle? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = ModelStyleImpl.fromNative(ptr.cast<ModelStyleNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(ModelStyle? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ModelStyleNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'ModelStyleUnitTypeImpl.toPointer',
    toPlatform:
        '(val) => ModelStyleUnitTypeImpl.fromPointer(val, needFree: false)',
    platformType: 'ModelStyleUnitType')
extension ModelStyleUnitTypeImpl on ModelStyleUnitType {
  static core.int toInt(ModelStyleUnitType e) {
    return e.index;
  }

  static ModelStyleUnitType fromInt(core.int val) {
    return ModelStyleUnitType.values[val];
  }

  static ModelStyleUnitType? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(ModelStyleUnitType? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}

@bindings_annotations.ContainerData(
    toNative: 'ModelStyleRenderModeImpl.toPointer',
    toPlatform:
        '(val) => ModelStyleRenderModeImpl.fromPointer(val, needFree: false)',
    platformType: 'ModelStyleRenderMode')
extension ModelStyleRenderModeImpl on ModelStyleRenderMode {
  static core.int toInt(ModelStyleRenderMode e) {
    return e.index;
  }

  static ModelStyleRenderMode fromInt(core.int val) {
    return ModelStyleRenderMode.values[val];
  }

  static ModelStyleRenderMode? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(ModelStyleRenderMode? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
