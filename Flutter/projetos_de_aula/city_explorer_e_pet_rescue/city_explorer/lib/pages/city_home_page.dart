import 'package:city_explorer/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CityHomePage extends StatefulWidget {
  const CityHomePage({super.key});

  @override
  State<CityHomePage> createState() => _CityHomePageState();
}

class _CityHomePageState extends State<CityHomePage> {
  final List<Place> places = [
    Place(
      title: 'Prefeitura de Ariquemes',
      description: 'O coração da cidade, ideal para passeios ao fim da tarde.',
      coverUrl:
          'https://www.viajeparana.com/sites/viaje-parana/arquivos_restritos/files/imagem/2023-01/mapa_direito_cima_norte_pioneiro.png',
      localAssetMap: 'images/prefeitura.png',
      isFavorite: true,
    ),
    Place(
      title: 'Parque Botânico',
      description:
          'Uma grande área verde para contato com a natureza e trilhas.',
      coverUrl: 'https://jb.ibb.unesp.br/fotos/mapa.png',
      localAssetMap: 'images/mapa_botanico.png',
      isFavorite: false,
    ),
  ];

  void _navigateToDetail(Place place) async {
    final bool? newFavoriteState = await Navigator.pushNamed(
      context,
      '/detail',
      arguments: place,
    );
    if (newFavoriteState != null) {
      setState(() {
        place.isFavorite = newFavoriteState;
      });
    }
  }

  void _navigateToFavorites() {
    final favoritedPlaces = places.where((p) => p.isFavorite).toList();
    Navigator.pushNamed(context, '/favorites', arguments: favoritedPlaces);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Descubra Ariquemes',
              textStyle: GoogleFonts.lato(),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          repeatForever: true,
        ),
        actions: [
          IconButton(
            onPressed: _navigateToFavorites,
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...places.map((place) {
                return buildPlaceCard(context, place);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildPlaceCard(BuildContext context, Place place) {
    return GestureDetector(
      onTap: () {
        _navigateToDetail(place);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade900,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
                place.coverUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.title,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    place.description,
                    style: GoogleFonts.lato(color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
