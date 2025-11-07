import 'package:city_explorer/pages/city_detail_page.dart';
import 'package:city_explorer/pages/city_home_page.dart';
import 'package:flutter/material.dart';
import 'package:city_explorer/pages/city_favorites_page.dart';

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
        '/': (_) => const CityHomePage(),
        '/detail': (_) => const CityDetailPage(),
        '/favorites': (_) => const CityFavoritesPage(),
      },
    );
  }
}
