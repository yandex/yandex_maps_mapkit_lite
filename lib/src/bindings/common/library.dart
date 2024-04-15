import 'dart:ffi';
import 'dart:io';

final library = Platform.isAndroid
    ? DynamicLibrary.open('libmaps-mobile.so')
    : DynamicLibrary.process();
