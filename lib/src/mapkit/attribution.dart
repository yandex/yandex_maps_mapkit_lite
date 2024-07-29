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
import 'package:yandex_maps_mapkit_lite/src/mapkit/image.dart' as mapkit_image;

part 'attribution.containers.dart';
part 'attribution.impl.dart';

/// Details about the source of information.
abstract final class Attribution implements ffi.Finalizable {
  factory Attribution(AttributionAuthor? author, AttributionLink? link,
          mapkit_image.Image? avatarImage) =>
      AttributionImpl(author, link, avatarImage);

  /// Additional information about the author.
  ///
  AttributionAuthor? get author;

  /// Link to a specific page on the author's site. To link to the website
  /// as a whole, use author.uri.
  ///
  AttributionLink? get link;
  mapkit_image.Image? get avatarImage;

  @core.override
  core.int get hashCode => core.Object.hashAll([author, link, avatarImage]);

  @core.override
  core.bool operator ==(covariant Attribution other) {
    if (core.identical(this, other)) {
      return true;
    }
    return author == other.author &&
        link == other.link &&
        avatarImage == other.avatarImage;
  }

  @core.override
  core.String toString() {
    return "Attribution(author: $author, link: $link, avatarImage: $avatarImage)";
  }
}

final class AttributionAuthor {
  final core.String name;

  /// A reference to the author's site.
  ///
  final core.String? uri;

  /// Author's email. Must contain at least one \@ symbol.
  ///
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
