// lib/main.dart
import 'package:flutter/material.dart';
import 'routes/app_routes.dart'; // 1. Importa sua classe de rotas

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade Flutter',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00BCD4),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      // 2. Define a rota inicial
      initialRoute: AppRoutes.home,

      // 3. USA O 'onGenerateRoute'
      // Aponta para o método estático da sua classe
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
