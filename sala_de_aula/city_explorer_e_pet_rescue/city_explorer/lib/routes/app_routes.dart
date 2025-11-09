// lib/app_routes.dart
import 'package:city_explorer/pages/city_detail_page.dart';
import 'package:city_explorer/pages/city_favorites_page.dart';
import 'package:city_explorer/pages/city_home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Nossos nomes de rota
  static const home = '/';
  static const detail = '/detail';
  static const favorites = '/favorites';

  // Nosso novo método estático (substitui o 'routes:')
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    
    switch (settings.name) {
      
      case home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CityHomePage(),
        );

      case detail:
        // A CORREÇÃO ESTÁ AQUI
        // Nós especificamos que esta rota retorna um 'bool'
        return MaterialPageRoute<bool>(
          builder: (_) => const CityDetailPage(),
          settings: settings, // Repassa os 'arguments' (o place)
        );

      case favorites:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CityFavoritesPage(),
          settings: settings, // Repassa os 'arguments' (a lista)
        );

      default:
        // Rota de fallback
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CityHomePage(),
        );
    }
  }
}