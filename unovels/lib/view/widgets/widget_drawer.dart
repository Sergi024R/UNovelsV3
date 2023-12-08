import 'package:flutter/material.dart';
import 'package:flutter_firebase/view/screens/categorias_screen.dart';
import 'package:flutter_firebase/view/screens/home_screen.dart';
import 'package:flutter_firebase/view/screens/user_info.dart';

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 200,
                  margin: const EdgeInsets.only(bottom: 10, top: 50),
                  child: Image.asset('resource/images/unovel.png'),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.black, backgroundColor: Colors.white),
                      label: const Text("Home")),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.people,
                        size: 50,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const UserInfo(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.black, backgroundColor: Colors.white),
                      label: const Text("CUENTA")),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.menu_book,
                        size: 50,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Categorias(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.black, backgroundColor: Colors.white),
                      label: const Text("CATEGORIAS")),
                ),
              ],
            )));
  }
}
