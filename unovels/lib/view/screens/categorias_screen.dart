import 'package:flutter/material.dart';

class Categorias extends StatelessWidget {
  const Categorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('UNovels'),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 28),
        ),
        body: const Column(
          children: [
            _OpcionCategoria(Nombre_categoria: 'Accion'),
            _OpcionCategoria(Nombre_categoria: 'Fantasia'),
            _OpcionCategoria(Nombre_categoria: 'Romance'),
            _OpcionCategoria(Nombre_categoria: 'Ciencia Ficcion'),
            _OpcionCategoria(Nombre_categoria: 'Comedia')
          ],
        ));
  }
}

class _OpcionCategoria extends StatelessWidget {
  final String Nombre_categoria;

  const _OpcionCategoria({super.key, required this.Nombre_categoria});

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
                builder: (context) => const Categorias(),
              ),
            );
          },
          style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.black,
              textStyle: const TextStyle(fontSize: 32)),
          label: Text(Nombre_categoria)),
    );
  }
}
