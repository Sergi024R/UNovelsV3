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

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "chapters": Map.from(chapters).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Chapter {
    final Title title;
    final Contenido contenido;

    Chapter({
        required this.title,
        required this.contenido,
    });

    factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        title: titleValues.map[json["title"]]!,
        contenido: contenidoValues.map[json["contenido"]]!,
    );

    Map<String, dynamic> toJson() => {
        "title": titleValues.reverse[title],
        "contenido": contenidoValues.reverse[contenido],
    };
}

enum Contenido {
    CONTENIDO_DEL_CAPITULO
}

final contenidoValues = EnumValues({
    "Contenido del capitulo... ": Contenido.CONTENIDO_DEL_CAPITULO
});

enum Title {
    CAPITULO_1,
    CAPITULO_2,
    CAPITULO_3
}

final titleValues = EnumValues({
    "Capitulo 1": Title.CAPITULO_1,
    "Capitulo 2": Title.CAPITULO_2,
    "Capitulo 3": Title.CAPITULO_3
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
