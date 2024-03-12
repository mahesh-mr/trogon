// To parse this JSON data, do
//
//     final castModel = castModelFromJson(jsonString);

import 'dart:convert';

List<CastModel> castModelFromJson(String str) => List<CastModel>.from(json.decode(str).map((x) => CastModel.fromJson(x)));

String castModelToJson(List<CastModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CastModel {
    Person? person;
    Character? character;
    bool? self;
    bool? voice;

    CastModel({
        this.person,
        this.character,
        this.self,
        this.voice,
    });

    factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        person: json["person"] == null ? null : Person.fromJson(json["person"]),
        character: json["character"] == null ? null : Character.fromJson(json["character"]),
        self: json["self"],
        voice: json["voice"],
    );

    Map<String, dynamic> toJson() => {
        "person": person?.toJson(),
        "character": character?.toJson(),
        "self": self,
        "voice": voice,
    };
}

class Character {
    int? id;
    String? url;
    String? name;
    Image? image;
    Links? links;

    Character({
        this.id,
        this.url,
        this.name,
        this.image,
        this.links,
    });

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "image": image?.toJson(),
        "_links": links?.toJson(),
    };
}

class Image {
    String? medium;
    String? original;

    Image({
        this.medium,
        this.original,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
    );

    Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
    };
}

class Links {
    Self? self;

    Links({
        this.self,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? null : Self.fromJson(json["self"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
    };
}

class Self {
    String? href;

    Self({
        this.href,
    });

    factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Person {
    int? id;
    String? url;
    String? name;
    Country? country;
    DateTime? birthday;
    dynamic deathday;
    String? gender;
    Image? image;
    int? updated;
    Links? links;

    Person({
        this.id,
        this.url,
        this.name,
        this.country,
        this.birthday,
        this.deathday,
        this.gender,
        this.image,
        this.updated,
        this.links,
    });

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        deathday: json["deathday"],
        gender: json["gender"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        updated: json["updated"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "country": country?.toJson(),
        "birthday": "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
        "deathday": deathday,
        "gender": gender,
        "image": image?.toJson(),
        "updated": updated,
        "_links": links?.toJson(),
    };
}

class Country {
    String? name;
    String? code;
    String? timezone;

    Country({
        this.name,
        this.code,
        this.timezone,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
    };
}
