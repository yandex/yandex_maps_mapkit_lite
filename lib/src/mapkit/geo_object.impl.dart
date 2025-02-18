part of 'geo_object.dart';

@bindings_annotations.ContainerData(
    toNative: 'GeoObjectImpl.getNativePtr',
    toPlatform: '(val) => GeoObjectImpl.fromPointer(val, needFree: false)',
    platformType: 'GeoObject')
final class GeoObjectImpl extends GeoObject {
  GeoObjectImpl(
      core.String? name,
      core.String? descriptionText,
      core.List<mapkit_geometry_geometry.Geometry> geometry,
      mapkit_geometry_geometry.BoundingBox? boundingBox,
      core.Map<core.String, mapkit_attribution.Attribution> attributionMap,
      type_dictionary.TypeDictionaryBase<mapkit_base_metadata.BaseMetadata>
          metadataContainer,
      core.List<core.String> aref)
      : this.fromNativePtr(_GeoObject_init(
            to_native.toNativePtrString(name),
            to_native.toNativePtrString(descriptionText),
            mapkit_geometry_geometry.GeometryContainerExtension.toNativeVector(
                geometry),
            mapkit_geometry_geometry.BoundingBoxImpl.toPointer(boundingBox),
            mapkit_attribution.AttributionContainerExtension.toNativeMap(
                attributionMap),
            to_native.toNativeTypeDictionary(metadataContainer),
            to_native.toNativeVectorString(aref)));

  @core.override
  late final name =
      to_platform.toPlatformFromPointerString(_GeoObject_get_name(_ptr));
  @core.override
  late final descriptionText = to_platform
      .toPlatformFromPointerString(_GeoObject_get_descriptionText(_ptr));
  @core.override
  late final geometry =
      mapkit_geometry_geometry.GeometryContainerExtension.toPlatformVector(
          _GeoObject_get_geometry(_ptr));
  @core.override
  late final boundingBox = mapkit_geometry_geometry.BoundingBoxImpl.fromPointer(
      _GeoObject_get_boundingBox(_ptr));
  @core.override
  late final attributionMap =
      mapkit_attribution.AttributionContainerExtension.toPlatformMap(
          _GeoObject_get_attributionMap(_ptr));
  @core.override
  late final metadataContainer = to_platform
      .toPlatformTypeDictionary(_GeoObject_get_metadataContainer(_ptr));
  @core.override
  late final aref = to_platform.toVectorString(_GeoObject_get_aref(_ptr));

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_GeoObject_free.cast());

  GeoObjectImpl.fromNativePtr(this._ptr) : super._() {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(GeoObject? obj) {
    return (obj as GeoObjectImpl?)?._ptr ?? ffi.nullptr;
  }

  static GeoObject? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : GeoObjectImpl.fromNativePtr(ptr);
  }

  static GeoObject? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        GeoObjectImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

final _GeoObject_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_GeoObject_free');

final ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _GeoObject_init = lib.library
    .lookup<
        ffi.NativeFunction<
            ffi.Pointer<ffi.Void> Function(
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>,
                ffi.Pointer<ffi.Void>)>>('yandex_flutter_mapkit_GeoObject_init')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_name = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_name')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_descriptionText = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_descriptionText')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_geometry = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_geometry')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_boundingBox = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_boundingBox')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_attributionMap = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_attributionMap')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_metadataContainer = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_metadataContainer')
        .asFunction(isLeaf: true);
final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)
    _GeoObject_get_aref = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_GeoObject_get_aref')
        .asFunction(isLeaf: true);
