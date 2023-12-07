import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.child!),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ProgressView(),
      backgroundColor: Colors.black,
      // Center(
      //   child: Text(
      //     "Iniciando UNovels",
      //     style: TextStyle(
      //       color: const Color.fromARGB(255, 0, 0, 0),
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      children: [
        SizedBox(height: 250),
        Image(image: AssetImage('resource/images/unovel.png')),
        Text('Empezando... ',
            style: TextStyle(
                fontSize: 26, color: Color.fromARGB(255, 216, 192, 121))),
        SizedBox(height: 20),
        CircularProgressIndicator(
            strokeWidth: 3,
            backgroundColor: Color.fromARGB(255, 216, 192, 121)),
        SizedBox(height: 30),
      ],
    ));
  }
}

Widget circularProgressCustom(double progressValue) =>
    CircularProgressIndicator(
        value: progressValue, strokeWidth: 2, backgroundColor: Colors.red);
