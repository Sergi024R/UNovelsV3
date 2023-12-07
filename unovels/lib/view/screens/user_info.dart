import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  static const String screenName = 'user_info';

  const UserInfo({super.key});

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
                Icons.supervised_user_circle,
                size: 100,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Nombre Usuario')],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Correo Electronico')],
          ),
        ],
      ),
    );
  }
}
