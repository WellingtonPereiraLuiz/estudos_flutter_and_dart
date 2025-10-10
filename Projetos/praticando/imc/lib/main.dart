// main.dart
import 'package:flutter/material.dart';
import 'package:imc/pages/cadastro_page.dart';
import 'package:imc/pages/home_page.dart';
import 'package:imc/pages/login_page.dart';
import 'package:imc/services/auth_service.dart';
import 'package:imc/services/database_helper.dart'; // Importa o DB Helper

// Widget Wrapper para decidir se vai para Login ou Home
class AuthWrapper extends StatelessWidget {
  AuthWrapper({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _authService.checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.data == true) {
          return const HomePage();
        }
        return const LoginPage();
      },
    );
  }
}

void main() async {
  // Inicialização do Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // CRÍTICO: Inicializa o banco de dados antes de rodar o app
  await DatabaseHelper.instance.database;

  runApp(
    MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        // Rota inicial usando o Wrapper
        '/': (context) => AuthWrapper(),
        '/register': (context) => const CadastroPage(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
      },
    ),
  );
}
