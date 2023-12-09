import 'package:flutter/material.dart';
import '../../model/novel_model.dart';
import 'novel_card.dart';
import 'package:dio/dio.dart';

class NovelList extends StatefulWidget {
  const NovelList({super.key});

  @override
  State<NovelList> createState() => NovelListState();
}

class NovelListState extends State<NovelList> {
  Novela? novela;
  @override
  void initState() {
    super.initState();
    getNovela();
  }

  Future<Novela> getNovela() async {
    final response = await Dio().get('https://unovelsapi.onrender.com/api/novelas');
    return Novela.fromJson(response.data[0]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NovelCard(),
      ],
    );
  }
}
