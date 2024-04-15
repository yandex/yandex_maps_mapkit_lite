import 'dart:async';

import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart';
import 'package:source_gen/source_gen.dart';

class AnnotatedClass {
  final String name;
  final String func;

  AnnotatedClass(this.name, this.func);
}

class WeakInterfacesMetaBuilder extends Builder {
  Iterable<AnnotatedClass> _annotatedClass(LibraryReader library) {
    final checker = TypeChecker.fromRuntime(WeakInterface);
    return library.annotatedWith(checker).map((e) => AnnotatedClass(
        e.annotation.read('name').stringValue, e.element.displayName));
  }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final files = buildStep.findAssets(Glob('**/*.dart'));

    final imports = <String>{};
    final methods = <AnnotatedClass>{};

    await for (final file in files) {
      if (!await buildStep.resolver.isLibrary(file)) {
        continue;
      }
      for (final annotatedClass in _annotatedClass(
          LibraryReader(await buildStep.resolver.libraryFor(file)))) {
        imports.add(
            "import 'package:${file.uri.path}' as ${file.changeExtension('').pathSegments.sublist(1).join('_')}");
        methods.add(AnnotatedClass(annotatedClass.name,
            '${file.changeExtension('').pathSegments.sublist(1).join('_')}.${annotatedClass.func}'));
      }
    }

    var result = '';

    for (final i in imports) {
      result += '$i;\n';
    }

    result += '\nconst weakInterfacesMeta = {\n';
    for (final annotatedClass in methods) {
      result +=
          "  '${annotatedClass.name}': ${annotatedClass.func}.fromNativePtrImpl,\n";
    }
    result += '};\n';

    buildStep.writeAsString(
        AssetId(buildStep.inputId.package,
            'lib/src/bindings/weak_interfaces_meta.g.dart'),
        result);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': ["src/bindings/weak_interfaces_meta.g.dart"]
      };
}

Builder generate(BuilderOptions options) => WeakInterfacesMetaBuilder();
