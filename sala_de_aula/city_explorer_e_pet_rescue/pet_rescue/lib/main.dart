import 'package:flutter/material.dart';
import 'package:pet_rescue/pages/pet_detail_page.dart';
import 'package:pet_rescue/pages/pet_home_page.dart';

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
      initialRoute: '/',
      routes: {
        '/': (_) => const PetHomePage(),
        '/pet_detail': (_) => const PetDetailPage(),
      },
    );
  }
}
