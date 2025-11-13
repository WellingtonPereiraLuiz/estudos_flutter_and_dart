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
  List<Place> myFavoritesList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (myFavoritesList.isEmpty) {
      final args = ModalRoute.of(context)?.settings.arguments as List<Place>?;
      if (args != null) {
        myFavoritesList = List.from(args);
      }
    }
  }

  void _navigateToDetail(Place place) async {
    final bool? isFavoriteResult = await Navigator.pushNamed(
      context,
      '/detail',
      arguments: place,
    );
    if (isFavoriteResult == false) {
      setState(() {
        myFavoritesList.remove(place);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Favoritos')),
      body: ListView.builder(
        itemCount: myFavoritesList.length,
        itemBuilder: (context, index) {
          final place = myFavoritesList[index];
          return buildPlaceCard(context, place);
        },
      ),
    );
  }
  Widget buildPlaceCard(BuildContext context, Place place) {
    return GestureDetector(
      onTap: () {
        _navigateToDetail(place);
      },
      child: ListTile(
        leading: const Icon(Icons.favorite, color: Colors.red),
        title: Text(place.title, style: GoogleFonts.poppins()),
        subtitle: Text(
          place.description,
          style: GoogleFonts.lato(),
          maxLines: 1,
          overflow:
              TextOverflow.ellipsis, 
        ),
      ),
    );
  }
}
