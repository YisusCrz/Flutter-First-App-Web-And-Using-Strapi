import 'dart:convert';

class Restaurantes {

  List<Restaurante> items = new List();

  Restaurantes();

  Restaurantes.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final restaurante = new Restaurante.fromJson(item);
      items.add( restaurante );
    }

  }

}


List<Restaurante> restauranteFromJson(String str) => List<Restaurante>.from(json.decode(str).map((x) => Restaurante.fromJson(x)));

String restauranteToJson(List<Restaurante> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurante {
    Restaurante({
        this.id,
        this.name,
        this.description,
        this.contact,
        this.images,
    });

    int id;
    String name;
    String description;
    String contact;
    List<Image> images;

    factory Restaurante.fromJson(Map<String, dynamic> json) => Restaurante(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        contact: json["contact"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "contact": contact,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
    };
}

class Image {
    Image({
        this.id,
        this.name,
        this.alternativeText,
        this.caption,
        this.width,
        this.height,
        this.formats,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.url,
        this.previewUrl,
        this.provider,
        this.providerMetadata,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String alternativeText;
    String caption;
    int width;
    int height;
    Formats formats;
    String hash;
    String ext;
    String mime;
    double size;
    String url;
    dynamic previewUrl;
    String provider;
    dynamic providerMetadata;
    DateTime createdAt;
    DateTime updatedAt;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"].toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats.toJson(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Formats {
    Formats({
        this.thumbnail,
        this.large,
        this.medium,
        this.small,
    });

    Thumbnail thumbnail;
    Thumbnail large;
    Thumbnail medium;
    Thumbnail small;

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        large: json["large"] == null ? null : Thumbnail.fromJson(json["large"]),
        medium: json["medium"] == null ? null : Thumbnail.fromJson(json["medium"]),
        small: json["small"] == null ? null : Thumbnail.fromJson(json["small"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "large": large == null ? null : large.toJson(),
        "medium": medium == null ? null : medium.toJson(),
        "small": small == null ? null : small.toJson(),
    };
}

class Thumbnail {
    Thumbnail({
        this.name,
        this.hash,
        this.ext,
        this.mime,
        this.width,
        this.height,
        this.size,
        this.path,
        this.url,
    });

    String name;
    String hash;
    String ext;
    String mime;
    int width;
    int height;
    double size;
    dynamic path;
    String url;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        width: json["width"],
        height: json["height"],
        size: json["size"].toDouble(),
        path: json["path"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "width": width,
        "height": height,
        "size": size,
        "path": path,
        "url": url,
    };
}
