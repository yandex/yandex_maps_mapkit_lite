part of 'base_map_object_collection.dart';

final class PlacemarkCreatedCallbackImpl implements PlacemarkCreatedCallback {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, PlacemarkCreatedCallback>{};

  PlacemarkCreatedCallbackImpl(
      {required void Function(mapkit_map_placemark.PlacemarkMapObject placemark)
          onPlacemarkCreated})
      : _ptr = _PlacemarkCreatedCallback_new(ffi.Pointer.fromFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>(
            _PlacemarkCreatedCallback_onPlacemarkCreated)),
        _onPlacemarkCreated = onPlacemarkCreated {
    _pointerToListener[_ptr] = this;
    _PlacemarkCreatedCallbacksetSendPort(
        _ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());
  }

  @core.override
  void onPlacemarkCreated(mapkit_map_placemark.PlacemarkMapObject placemark) =>
      _onPlacemarkCreated(placemark);

  final ffi.Pointer<ffi.Void> _ptr;

  final void Function(mapkit_map_placemark.PlacemarkMapObject)
      _onPlacemarkCreated;

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(PlacemarkCreatedCallback? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as PlacemarkCreatedCallbackImpl)._ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _PlacemarkCreatedCallbacksetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_map_PlacemarkCreatedCallback_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _PlacemarkCreatedCallback_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_map_PlacemarkCreatedCallback_new')
        .asFunction(isLeaf: true);

void _PlacemarkCreatedCallback_onPlacemarkCreated(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> placemark) {
  final listener = PlacemarkCreatedCallbackImpl._pointerToListener[_ptr]!;

  try {
    listener.onPlacemarkCreated(
        mapkit_map_placemark.PlacemarkMapObjectImpl.fromNativePtr(placemark));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

@bindings_annotations.WeakInterface('mapkit.map.BaseMapObjectCollection')
@bindings_annotations.ContainerData(
    toNative: 'BaseMapObjectCollectionImpl.getNativePtr',
    toPlatform:
        '(val) => BaseMapObjectCollectionImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'BaseMapObjectCollection')
class BaseMapObjectCollectionImpl extends mapkit_map_map_object.MapObjectImpl
    implements BaseMapObjectCollection, ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_BaseMapObjectCollection_free.cast());

  /// @nodoc
  BaseMapObjectCollectionImpl.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  BaseMapObjectCollectionImpl.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory BaseMapObjectCollectionImpl.fromNativePtr(
          ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(BaseMapObjectCollection? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as BaseMapObjectCollectionImpl).ptr;
  }

  core.bool isValid() {
    return _BaseMapObjectCollection_check(ptr);
  }

  @internal

  /// @nodoc
  static BaseMapObjectCollection? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return BaseMapObjectCollectionImpl.fromNativePtr(ptr);
  }

  void traverse(
      mapkit_map_map_object_visitor.MapObjectVisitor mapObjectVisitor) {
    _BaseMapObjectCollection_traverse(
        ptr,
        mapkit_map_map_object_visitor.MapObjectVisitorImpl.getNativePtr(
            mapObjectVisitor));
  }

  void remove(mapkit_map_map_object.MapObject mapObject) {
    _BaseMapObjectCollection_remove(
        ptr, mapkit_map_map_object.MapObjectImpl.getNativePtr(mapObject));
  }

  void clear() {
    _BaseMapObjectCollection_clear(ptr);
  }

  void addListener(
      mapkit_map_map_object_collection_listener.MapObjectCollectionListener
          collectionListener) {
    _BaseMapObjectCollection_addListener(
        ptr,
        mapkit_map_map_object_collection_listener
            .MapObjectCollectionListenerImpl.getNativePtr(collectionListener));
  }

  void removeListener(
      mapkit_map_map_object_collection_listener.MapObjectCollectionListener
          collectionListener) {
    _BaseMapObjectCollection_removeListener(
        ptr,
        mapkit_map_map_object_collection_listener
            .MapObjectCollectionListenerImpl.getNativePtr(collectionListener));
  }
}

final _BaseMapObjectCollection_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_BaseMapObjectCollection_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _BaseMapObjectCollection_check =
    lib
        .library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_BaseMapObjectCollection_check')
        .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _BaseMapObjectCollection_traverse = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_BaseMapObjectCollection_traverse')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _BaseMapObjectCollection_remove = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_BaseMapObjectCollection_remove')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _BaseMapObjectCollection_clear = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_BaseMapObjectCollection_clear')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _BaseMapObjectCollection_addListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_BaseMapObjectCollection_addListener')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _BaseMapObjectCollection_removeListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_BaseMapObjectCollection_removeListener')
        .asFunction();
