import 'package:flutter/material.dart';

class NovelDescription extends StatelessWidget {
  const NovelDescription({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.description,
                size: 100,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Nombre Novela')],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Sinopsis')],
          ),
        ],
      ),
    );
  }
}
