// lib/pages/city_favorites_page.dart
import 'package:city_explorer/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityFavoritesPage extends StatefulWidget {
  const CityFavoritesPage({super.key});

  @override
  State<CityFavoritesPage> createState() => _CityFavoritesPageState();
}

class _CityFavoritesPageState extends State<CityFavoritesPage> {
 
  // Função que lida com a navegação e a atualização do estado
  void _navigateToDetail(Place place) async {
    // ETAPA 3: Espera o resultado da DetailPage
    // O 'result' será o 'isFavorite' que a DetailPage nos enviar
    final bool? newFavoriteState = await Navigator.pushNamed(
      context,
      '/detail',
      arguments: place,
    );
 
 
 
  @override
  Widget buildplaceCard(BuildContext context, Place place) {
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
          return GestureDetector(
            onTap: () {
 _navigateToDetail(place);
            },
            child: 
          )
        },
      ),
    );
  }









  Widget buildPlaceCard(BuildContext context, Place place) {
    return GestureDetector(
      // (R3) GestureDetector será usado aqui [cite: 156]
      onTap: () {
        // ETAPA 2: Chama a nova função async
        _navigateToDetail(place);
      },
      child: ListTile(
            leading: Icon(Icons.favorite, color: Colors.red),
            title: Text(place.title, style: GoogleFonts.poppins()),
            subtitle: Text(
              place.description,
              style: GoogleFonts.lato(),
              maxLines: 1,
            ),
          )  
    );
  }
}
