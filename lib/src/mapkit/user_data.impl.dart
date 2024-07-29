part of 'user_data.dart';

@bindings_annotations.ContainerData(
    toNative: 'UserDataImpl.getNativePtr',
    toPlatform: '(val) => UserDataImpl.fromPointer(val, needFree: false)',
    platformType: 'UserData')
final class UserDataImpl implements UserData {
  UserDataImpl(core.Map<core.String, core.String> data)
      : this.fromNativePtr(_UserData_init(to_native.toNativeMapString(data)));

  @core.override
  late final data = to_platform.toMapString(_UserData_get_data(_ptr));

  @core.override
  final _UserDataFactory runtimeFactory = const _UserDataFactory();

  final ffi.Pointer<ffi.Void> _ptr;
  static final _finalizer = ffi.NativeFinalizer(_UserData_free.cast());

  UserDataImpl.fromNativePtr(this._ptr) {
    _finalizer.attach(this, _ptr);
  }

  static ffi.Pointer<ffi.Void> getNativePtr(UserData? obj) {
    return (obj as UserDataImpl?)?._ptr ?? ffi.nullptr;
  }

  static UserData? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    return ptr == ffi.nullptr ? null : UserDataImpl.fromNativePtr(ptr);
  }

  static UserData? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr == ffi.nullptr) {
      return null;
    }
    final result =
        UserDataImpl.fromNativePtr(ptr.cast<ffi.Pointer<ffi.Void>>().value);

    if (needFree) {
      malloc.free(ptr);
    }

    return result;
  }
}

class _UserDataFactory extends struct_factory.StructFactory<UserData> {
  const _UserDataFactory();

  @core.override
  UserData create(ffi.Pointer<ffi.Void> ptr) {
    return UserDataImpl.fromNativePtr(ptr);
  }

  @core.override
  UserData fromParent(ffi.Pointer<ffi.Void> ptr) {
    return UserDataImpl.fromNativePtr(_UserData_downcast(ptr));
  }

  @core.override
  ffi.Pointer<ffi.Void> toParent(UserData obj) {
    return _UserData_upcast(UserDataImpl.getNativePtr(obj));
  }

  @core.override
  native_types.NativeString typeName() {
    return _UserData_name();
  }
}

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _UserData_downcast =
    lib
        .library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_UserData_downcast')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _UserData_upcast =
    lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_UserData_upcast')
        .asFunction(isLeaf: true);

final native_types.NativeString Function() _UserData_name = lib.library
    .lookup<ffi.NativeFunction<native_types.NativeString Function()>>(
        'yandex_flutter_mapkit_UserData_name')
    .asFunction(isLeaf: true);

final _UserData_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Void)>>(
        'yandex_flutter_mapkit_UserData_free');

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _UserData_init = lib
    .library
    .lookup<
        ffi.NativeFunction<
            ffi.Pointer<ffi.Void> Function(
                ffi.Pointer<ffi.Void>)>>('yandex_flutter_mapkit_UserData_init')
    .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>) _UserData_get_data =
    lib
        .library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>>(
            'yandex_flutter_mapkit_UserData_get_data')
        .asFunction(isLeaf: true);
