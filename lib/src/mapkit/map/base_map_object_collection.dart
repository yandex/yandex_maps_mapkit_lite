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
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object.dart'
    as mapkit_map_map_object;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object_collection_listener.dart'
    as mapkit_map_map_object_collection_listener;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/map_object_visitor.dart'
    as mapkit_map_map_object_visitor;
import 'package:yandex_maps_mapkit_lite/src/mapkit/map/placemark.dart'
    as mapkit_map_placemark;

part 'base_map_object_collection.containers.dart';

class PlacemarkCreatedCallback {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, PlacemarkCreatedCallback>{};

  PlacemarkCreatedCallback(
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

  /// Can be used to setup placemark style and position Will be called
  /// before MapObjectCollectionListener#onMapObjectAdded
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
    return obj._ptr;
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
  final listener = PlacemarkCreatedCallback._pointerToListener[_ptr]!;

  try {
    listener.onPlacemarkCreated(
        mapkit_map_placemark.PlacemarkMapObject.fromNativePtr(placemark));
  } catch (e, stack) {
    exception.nativeAssert('Unhandled exception $e\n$stack');
    rethrow;
  }
}

@bindings_annotations.WeakInterface('mapkit.map.BaseMapObjectCollection')
@bindings_annotations.ContainerData(
    toNative: 'BaseMapObjectCollection.getNativePtr',
    toPlatform:
        '(val) => BaseMapObjectCollection.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class BaseMapObjectCollection extends mapkit_map_map_object.MapObject
    implements ffi.Finalizable {
  static final _finalizer =
      ffi.NativeFinalizer(_BaseMapObjectCollection_free.cast());

  /// @nodoc
  BaseMapObjectCollection.fromExternalPtr(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr);

  /// @nodoc
  @internal
  BaseMapObjectCollection.fromNativePtrImpl(ffi.Pointer<ffi.Void> ptr)
      : super.fromExternalPtr(ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory BaseMapObjectCollection.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(BaseMapObjectCollection? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _BaseMapObjectCollection_check(ptr);
  }

  @internal

  /// @nodoc
  static BaseMapObjectCollection? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return BaseMapObjectCollection.fromNativePtr(ptr);
  }

  /// Traverses through the collection with a visitor object. Used for
  /// iteration over map objects in the collection.
  ///
  /// The class does not retain the object in the 'mapObjectVisitor' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void traverse(
      mapkit_map_map_object_visitor.MapObjectVisitor mapObjectVisitor) {
    _BaseMapObjectCollection_traverse(
        ptr,
        mapkit_map_map_object_visitor.MapObjectVisitor.getNativePtr(
            mapObjectVisitor));
  }

  /// Removes the given map object from the collection.
  void remove(mapkit_map_map_object.MapObject mapObject) {
    _BaseMapObjectCollection_remove(
        ptr, mapkit_map_map_object.MapObject.getNativePtr(mapObject));
  }

  /// Removes all map objects from the collection.
  void clear() {
    _BaseMapObjectCollection_clear(ptr);
  }

  /// Adds a listener to track notifications of changes to the collection.
  ///
  /// The class does not retain the object in the 'collectionListener' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void addListener(
      mapkit_map_map_object_collection_listener.MapObjectCollectionListener
          collectionListener) {
    _BaseMapObjectCollection_addListener(
        ptr,
        mapkit_map_map_object_collection_listener.MapObjectCollectionListener
            .getNativePtr(collectionListener));
  }

  /// Removes a listener.
  void removeListener(
      mapkit_map_map_object_collection_listener.MapObjectCollectionListener
          collectionListener) {
    _BaseMapObjectCollection_removeListener(
        ptr,
        mapkit_map_map_object_collection_listener.MapObjectCollectionListener
            .getNativePtr(collectionListener));
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
