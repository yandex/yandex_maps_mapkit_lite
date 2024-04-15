import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:math' as math;
import 'package:meta/meta.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;

part 'placemarks_styler.containers.dart';

/// Represents a styler for all placemarks in the map object collection,
/// including placemarks in child collections. When a new placemark is
/// added to a collection, the placemark tries to get style properties
/// from the collection where it has been added. If this collection
/// doesn't have a style property, the placemark tries to get it from the
/// closest parent collection. If none of these collections have a
/// specific style property, the placemark sets the default value for
/// this property.
@bindings_annotations.WeakInterface('mapkit.map.PlacemarksStyler')
@bindings_annotations.ContainerData(
    toNative: 'PlacemarksStyler.getNativePtr',
    toPlatform:
        '(val) => PlacemarksStyler.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)')
class PlacemarksStyler implements ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_PlacemarksStyler_free.cast());

  /// @nodoc
  PlacemarksStyler.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  PlacemarksStyler.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory PlacemarksStyler.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(PlacemarksStyler? obj) {
    if (obj == null) return ffi.nullptr;
    return obj.ptr;
  }

  core.bool isValid() {
    return _PlacemarksStyler_check(ptr);
  }

  @internal

  /// @nodoc
  static PlacemarksStyler? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return PlacemarksStyler.fromNativePtr(ptr);
  }

  /// Sets piecewise linear scale, depending on the zoom. The 'points' must
  /// be sorted by x; x coordinates must be unique. If zoom <
  /// minZoom(points) or zoom > maxZoom(points), it is set within the
  /// defined bounds before applying the function. By default, the scale
  /// function is defined by a single point (1, 1). If points is null or
  /// points.empty(), it resets the function to the default. If
  /// points.size() == 1, the scale is constant and equals point.y.
  void setScaleFunction(core.List<math.Point<core.double>> points) {
    _PlacemarksStyler_setScaleFunction(
        ptr, to_native.toNativeVectorPoint(points));
  }
}

final _PlacemarksStyler_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarksStyler_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _PlacemarksStyler_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_map_PlacemarksStyler_check')
    .asFunction(isLeaf: true);

final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _PlacemarksStyler_setScaleFunction = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_map_PlacemarksStyler_setScaleFunction')
        .asFunction();
