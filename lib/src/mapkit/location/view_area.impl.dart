part of 'view_area.dart';

final class ViewAreaNative extends ffi.Struct {
  @ffi.Double()
  external core.double lengthwise;
  @ffi.Double()
  external core.double transverse;
}

final ViewAreaNative Function(core.double, core.double) _ViewAreaNativeInit =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ViewAreaNative Function(ffi.Double, ffi.Double)>>(
            'yandex_flutter_mapkit_location_ViewArea_init')
        .asFunction(isLeaf: true);

@bindings_annotations.ContainerData(
    toNative: 'ViewAreaImpl.toPointer',
    toPlatform: '(val) => ViewAreaImpl.fromPointer(val, needFree: false)',
    platformType: 'ViewArea')
extension ViewAreaImpl on ViewArea {
  static ViewArea fromNative(ViewAreaNative native) {
    return ViewArea(
        lengthwise: native.lengthwise, transverse: native.transverse);
  }

  static ViewAreaNative toNative(ViewArea obj) {
    return _ViewAreaNativeInit(obj.lengthwise, obj.transverse);
  }

  static ViewArea? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result = ViewAreaImpl.fromNative(ptr.cast<ViewAreaNative>().ref);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  static ffi.Pointer<ffi.Void> toPointer(ViewArea? val) {
    if (val == null) {
      return ffi.nullptr;
    }
    final result = malloc.call<ViewAreaNative>();
    result.ref = toNative(val);

    return result.cast();
  }
}
