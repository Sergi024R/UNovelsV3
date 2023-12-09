import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart'; // Importa la página de inicio de sesión

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;
  late User? registeredUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Resto del contenido del formulario
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                await _signUp();
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 20),
            Text(
              'En esta ventana podrás ver el correo registrado con tu usuario, por seguridad no mostraremos el nombre de usuario ni la contraseña.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            if (registeredUser != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/user_info');
                },
                child: Text('Ver información del usuario'),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      setState(() {
        registeredUser = userCredential.user;
        isSigningUp = false;
      });

      if (registeredUser != null) {
        Navigator.pushReplacementNamed(context, '/user_info');
      }
    } catch (e) {
      setState(() {
        isSigningUp = false;
      });
      print("Error occurred: $e");
    }
  }
}

class UserInfo extends StatelessWidget {
  static const String screenName = 'user_info';

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.supervised_user_circle,
                size: 100,
              ),
              SizedBox(height: 20),
              Text('Email: ${user?.email ?? "N/A"}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
                  );
                },
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
