import 'package:flutter/material.dart';
import 'package:flutter_firebase/view/widgets/novel_card.dart';
import '../widgets/novel_list.dart';
import '../widgets/widget_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String screenName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('UNovels'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 28),
      ),
      body: const NovelCard(),
      backgroundColor: Colors.white,
    );
  }

  void navigateToHome(BuildContext context) {}
}
