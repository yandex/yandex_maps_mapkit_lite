part of 'event_tag.dart';

@bindings_annotations.ContainerData(
    toNative: 'RoadEventsEventTagImpl.toPointer',
    toPlatform:
        '(val) => RoadEventsEventTagImpl.fromPointer(val, needFree: false)',
    platformType: 'RoadEventsEventTag')
extension RoadEventsEventTagImpl on RoadEventsEventTag {
  static core.int toInt(RoadEventsEventTag e) {
    return e.index;
  }

  static RoadEventsEventTag fromInt(core.int val) {
    return RoadEventsEventTag.values[val];
  }

  static RoadEventsEventTag? fromPointer(ffi.Pointer<ffi.Void> ptr,
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

  static ffi.Pointer<ffi.Void> toPointer(RoadEventsEventTag? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast();
  }
}
