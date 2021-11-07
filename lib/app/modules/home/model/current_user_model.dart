// To parse this JSON data, do
//
//     final currentUserModel = currentUserModelFromJson(jsonString);

import 'dart:convert';

CurrentUserModel currentUserModelFromJson(String str) => CurrentUserModel.fromJson(json.decode(str));

String currentUserModelToJson(CurrentUserModel data) => json.encode(data.toJson());

class CurrentUserModel {
    CurrentUserModel({
      required this.id,
      required this.name,
      required this.url,
      required this.description,
      required this.link,
      required this.slug,
      required this.avatarUrls,
      required this.meta,
      required this.links,
    });

    int id;
    String name;
    String url;
    String description;
    String link;
    String slug;
    Map<String, String> avatarUrls;
    List<dynamic> meta;
    Links links;

    factory CurrentUserModel.fromJson(Map<String, dynamic> json) => CurrentUserModel(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        description: json["description"],
        link: json["link"],
        slug: json["slug"],
        avatarUrls: Map.from(json["avatar_urls"]).map((k, v) => MapEntry<String, String>(k, v)),
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "description": description,
        "link": link,
        "slug": slug,
        "avatar_urls": Map.from(avatarUrls).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "_links": links.toJson(),
    };
}

class Links {
    Links({
      required this.self,
      required this.collection,
    });

    List<Collection> self;
    List<Collection> collection;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    };
}

class Collection {
    Collection({
      required this.href,
    });

    String href;

    factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}
