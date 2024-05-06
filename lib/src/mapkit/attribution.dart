import 'dart:ffi' as ffi;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;

part 'attribution.containers.dart';
part 'attribution.impl.dart';

final class Attribution {
  final AttributionAuthor? author;
  final AttributionLink? link;

  const Attribution({
    this.author,
    this.link,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([author, link]);

  @core.override
  core.bool operator ==(covariant Attribution other) {
    if (core.identical(this, other)) {
      return true;
    }
    return author == other.author && link == other.link;
  }

  @core.override
  core.String toString() {
    return "Attribution(author: $author, link: $link)";
  }
}

final class AttributionAuthor {
  final core.String name;
  final core.String? uri;
  final core.String? email;

  const AttributionAuthor({
    required this.name,
    this.uri,
    this.email,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([name, uri, email]);

  @core.override
  core.bool operator ==(covariant AttributionAuthor other) {
    if (core.identical(this, other)) {
      return true;
    }
    return name == other.name && uri == other.uri && email == other.email;
  }

  @core.override
  core.String toString() {
    return "AttributionAuthor(name: $name, uri: $uri, email: $email)";
  }
}

final class AttributionLink {
  final core.String href;

  const AttributionLink({
    required this.href,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([href]);

  @core.override
  core.bool operator ==(covariant AttributionLink other) {
    if (core.identical(this, other)) {
      return true;
    }
    return href == other.href;
  }

  @core.override
  core.String toString() {
    return "AttributionLink(href: $href)";
  }
}
