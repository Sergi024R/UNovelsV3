import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/view/widgets/widget_drawer.dart';
import 'package:http/http.dart' as http;
import '../../model/novel_model.dart';
import '../widgets/novel_card.dart';

class Categorias extends StatelessWidget {
  const Categorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: WidgetDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('UNovels'),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 28),
        ),
        body: const Column(
          children: [
            CategoriaButton(nombreCategoria: "Accion"),
            CategoriaButton(nombreCategoria: "Ciencia ficcion"),
            CategoriaButton(nombreCategoria: "Aventura"),
            CategoriaButton(nombreCategoria: "Romance"),
            CategoriaButton(nombreCategoria: "Comedia"),
          ],
        ));
  }
}

class CategoriaButton extends StatelessWidget {
  final String nombreCategoria;

  const CategoriaButton({Key? key, required this.nombreCategoria})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.menu_book,
          size: 50,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CategoriasLista(categoria: nombreCategoria),
            ),
          );
        },
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 32),
        ),
        label: Text(nombreCategoria),
      ),
    );
  }
}

class CategoriasLista extends StatelessWidget {
  final String categoria;

  const CategoriasLista({Key? key, required this.categoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novelas - $categoria'),
      ),
      body: FutureBuilder<List<Novela>>(
        future: fetchDataForCategoria(categoria),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No hay novelas disponibles para esta categoría.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Novela novela = snapshot.data![index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CapituloContentScreen(novela, 0),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Image.network(novela.image),
                        title: Text(novela.name),
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}

Future<List<Novela>> fetchDataForCategoria(String categoria) async {
  final apiUrl = 'http://192.168.1.89/api/novelas';

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      // Filtrar las novelas que tienen la categoría deseada
      List<Novela> novelasFiltradas = List<Novela>.from(data
          .map((json) => Novela.fromJson(json))
          .where((novela) => novela.categoria == categoria));

      return novelasFiltradas;
    } else {
      throw Exception(
          'Error en la solicitud, código de estado: ${response.statusCode}');
    }
  } catch (error) {
    print('Error al obtener datos de la API: $error');
    throw error;
  }
}
