import 'dart:async';
import 'dart:collection';

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

    final imports = SplayTreeSet<String>();
    final methods = SplayTreeSet<String>();

    await for (final file in files) {
      if (!await buildStep.resolver.isLibrary(file)) {
        continue;
      }
      for (final annotatedClass in _annotatedClass(
          LibraryReader(await buildStep.resolver.libraryFor(file)))) {
        final pathSegments = file.pathSegments;
        final namespace = pathSegments[2];
        final path = file.uri.path;
        imports.add("import 'package:$path' as $namespace;");
        methods.add(
            "  '${annotatedClass.name}': $namespace.${annotatedClass.func}.fromNativePtrImpl,");
      }
    }

    final result = StringBuffer();

    for (final import in imports) {
      result.writeln(import);
    }

    result.writeln('\nconst weakInterfacesMeta = {');

    for (final method in methods) {
      result.writeln(method);
    }

    result.writeln('};');

    buildStep.writeAsString(
        AssetId(buildStep.inputId.package,
            'lib/src/bindings/weak_interfaces_meta.g.dart'),
        result.toString());
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': ["src/bindings/weak_interfaces_meta.g.dart"]
      };
}

Builder generate(BuilderOptions options) => WeakInterfacesMetaBuilder();
