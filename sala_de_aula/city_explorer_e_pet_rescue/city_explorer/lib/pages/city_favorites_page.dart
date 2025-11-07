// lib/pages/city_favorites_page.dart
import 'package:city_explorer/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityFavoritesPage extends StatelessWidget {
  const CityFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Recebe a lista de favoritos que a HomePage enviou
    final favoritedPlaces =
        ModalRoute.of(context)!.settings.arguments as List<Place>;

    return Scaffold(
      appBar: AppBar(title: const Text('Meus Favoritos')),
      body: ListView.builder(
        itemCount: favoritedPlaces.length,
        itemBuilder: (context, index) {
          final place = favoritedPlaces[index];
          // Reutilize o visual do card (ou faça um mais simples)
          return ListTile(
            leading: Icon(Icons.favorite, color: Colors.red),
            title: Text(place.title, style: GoogleFonts.poppins()),
            subtitle: Text(
              place.description,
              style: GoogleFonts.lato(),
              maxLines: 1,
            ),
          );
        },
      ),
    );
  }
}
