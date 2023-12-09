// To parse this JSON data, do
//
//     final novela = novelaFromJson(jsonString);

import 'dart:convert';

List<Novela> novelaFromJson(String str) =>
    List<Novela>.from(json.decode(str).map((x) => Novela.fromJson(x)));

String novelaToJson(List<Novela> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Novela {
  final int id;
  final String name;
  final String description;
  final String categoria;
  final String image;
  final Map<String, Chapter> chapters;
  final List<Categoria> categorias;

  Novela({
    required this.id,
    required this.name,
    required this.description,
    required this.categoria,
    required this.image,
    required this.chapters,
    required this.categorias,
  });

  factory Novela.fromJson(Map<String, dynamic> json) => Novela(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        categoria: json["categoria"],
        image: json["image"],
        chapters: Map.from(json["chapters"])
            .map((k, v) => MapEntry<String, Chapter>(k, Chapter.fromJson(v))),
        categorias: List<Categoria>.from(
            json["categorias"].map((x) => Categoria.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "categoria": categoria,
        "image": image,
        "chapters": Map.from(chapters)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "categorias": List<dynamic>.from(categorias.map((x) => x.toJson())),
      };
}

class Categoria {
  final String? accion;
  final String? romance;
  final String? cienciaficcion;
  final String? aventura;
  final String? comedia;

  Categoria({
    this.accion,
    this.romance,
    this.cienciaficcion,
    this.aventura,
    this.comedia,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        accion: json["accion"],
        romance: json["romance"],
        cienciaficcion: json["cienciaficcion"],
        aventura: json["aventura"],
        comedia: json["comedia"],
      );

  Map<String, dynamic> toJson() => {
        "accion": accion,
        "romance": romance,
        "cienciaficcion": cienciaficcion,
        "aventura": aventura,
        "comedia": comedia,
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
