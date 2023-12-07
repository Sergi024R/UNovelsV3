// To parse this JSON data, do
//
//     final novela = novelaFromJson(jsonString);

import 'dart:convert';

List<Novela> novelaFromJson(String str) => List<Novela>.from(json.decode(str).map((x) => Novela.fromJson(x)));

String novelaToJson(List<Novela> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Novela {
    final int id;
    final String name;
    final String description;
    final String image;
    final Map<String, Chapter> chapters;

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
        chapters: Map.from(json["chapters"]).map((k, v) => MapEntry<String, Chapter>(k, Chapter.fromJson(v))),
    );

  List<Novela>? get data => null;

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "chapters": Map.from(chapters).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Chapter {
    final String title;
    final String contenido;

    Chapter({
        required this.title,
        required this.contenido,
    });

    factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        title: json["title"],
        contenido: json["contenido"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "contenido": contenido,
    };
}
