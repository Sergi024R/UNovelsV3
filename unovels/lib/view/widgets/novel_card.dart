import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/view/widgets/widget_drawer.dart';
import '../../model/novel_model.dart';
import 'package:http/http.dart' as http;

class NovelCard extends StatelessWidget {
  const NovelCard({super.key});

  // URL de API
  final String apiUrl = 'http://192.168.1.89/api/novelas';

  Future<List<Novela>> _fetchNovelas() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Decodificar el JSON y mapearlo a una lista de Novela
      List<dynamic> novelaList = json.decode(response.body);
      return novelaList.map((json) => Novela.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar datos desde la API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _fetchNovelas(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                // La carga de datos fue exitosa, muestra la lista
                List<Novela> novelas = snapshot.data as List<Novela>;

                return ListView.builder(
                  itemCount: novelas.length,
                  itemBuilder: (context, index) {
                    final novela = novelas[index];
                    return Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              novela.image,
                              width:
                                  220, // Ancho de la imagen que ocupa todo el ancho del ListTile
                              height:
                                  290.0, // Altura de la imagen según tus necesidades
                              fit: BoxFit
                                  .cover, // Ajusta el contenido de la imagen
                            ),
                            const SizedBox(
                                height:
                                    1.0), // Espaciado entre la imagen y el texto
                            Text(
                              novela.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              novela.description,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CapituloScreen(novela),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }
            }));
  }
}

class CapituloScreen extends StatefulWidget {
  final Novela novela;

  CapituloScreen(this.novela);

  @override
  State<CapituloScreen> createState() => _CapituloScreenState();
}

class _CapituloScreenState extends State<CapituloScreen> {
  int _currentChapterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.novela.name),
      ),
      body: ListView.builder(
        itemCount: widget.novela.chapters.length,
        itemBuilder: (context, index) {
          final chapter = widget.novela.chapters.values.toList()[index];
          return Card(
              child: ListTile(
            title: Text(chapter.title.toString().split('.').last),
           // subtitle: Text(chapter.contenido.toString().split('.').last),
            onTap: () {
              // Navegar a la pantalla de contenido del capítulo
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CapituloContentScreen(widget.novela, index),
                ),
              );
            },
          ));
        },
      ),
    );
  }
}

class CapituloContentScreen extends StatelessWidget {
  final Novela novela;
  final int currentChapterIndex;

  CapituloContentScreen(this.novela, this.currentChapterIndex);

  @override
  Widget build(BuildContext context) {
    Chapter currentChapter =
        novela.chapters.values.toList()[currentChapterIndex];

    return Scaffold(
      drawer: WidgetDrawer(),
      appBar: AppBar(
        title: Text(currentChapter.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Contenido del capítulo: ${currentChapter.contenido}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: currentChapterIndex > 0
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CapituloContentScreen(novela, currentChapterIndex - 1),
                            ),
                          );
                        }
                      : null,
                  child: const Text('Anterior'),
                ),
                IconButton(
                  onPressed: () {
                    // Navegar a la lista de capítulos
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CapituloScreen(novela),
                      ),
                    );
                  },
                  icon: Icon(Icons.menu), // Puedes cambiar el icono según tus preferencias
                ),
                ElevatedButton(
                  onPressed: currentChapterIndex < novela.chapters.length - 1
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CapituloContentScreen(novela, currentChapterIndex + 1),
                            ),
                          );
                        }
                      : null,
                  child: const Text('Siguiente'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




// class CapituloScreen extends StatelessWidget {
//   final Novela novela;

//   CapituloScreen(this.novela);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(novela.name),
//       ),
//       body: ListView.builder(
//         itemCount: novela.chapters.length,
//         itemBuilder: (context, index) {
//           final chapter = novela.chapters.values.toList()[index];
//           return Card(
//             child: ListTile(
//               title: Text(chapter.title.toString().split('.').last),
//               subtitle: Text(chapter.contenido.toString().split('.').last),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
