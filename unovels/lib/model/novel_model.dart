// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Novela> welcomeFromJson(String str) => List<Novela>.from(json.decode(str).map((x) => Novela.fromJson(x)));

String welcomeToJson(List<Novela> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Novela {
    final int id;
    final String name;
    final String description;
    final String image;
    final Chapters chapters;

    Novela({
        required this.id,
        required this.name,
        required this.description,
        required this.image,
        required this.chapters,
    });

    factory Novela.fromJson(Map<String, dynamic> json) => Novela(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        chapters: Chapters.fromJson(json["chapters"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "chapters": chapters.toJson(),
    };
}

class Chapters {
    final Novela2 the1;

    Chapters({
        required this.the1,
    });

    factory Chapters.fromJson(Map<String, dynamic> json) => Chapters(
        the1: Novela2.fromJson(json["1"]),
    );

    Map<String, dynamic> toJson() => {
        "1": the1.toJson(),
    };
}

class Novela2 {
    final String title;
    final String contenido;

    Novela2({
        required this.title,
        required this.contenido,
    });

    factory Novela2.fromJson(Map<String, dynamic> json) => Novela2(
        title: json["title"],
        contenido: json["contenido"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "contenido": contenido,
    };
}
