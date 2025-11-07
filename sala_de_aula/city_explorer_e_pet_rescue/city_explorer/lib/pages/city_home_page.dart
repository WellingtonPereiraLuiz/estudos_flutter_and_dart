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
  // ETAPA 1: Nossos dados fictícios
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

  // Função que lida com a navegação e a atualização do estado
  void _navigateToDetail(Place place) async {
    // ETAPA 3: Espera o resultado da DetailPage
    // O 'result' será o 'isFavorite' que a DetailPage nos enviar
    final bool? newFavoriteState = await Navigator.pushNamed(
      context,
      '/detail',
      arguments: place,
    );

    // ETAPA 4: Sincroniza o estado
    if (newFavoriteState != null) {
      setState(() {
        // Encontra o 'place' na nossa lista e atualiza o 'isFavorite'
        place.isFavorite = newFavoriteState;
      });
    }
  }

  void _navigateToFavorites() {
    // Filtra a lista de 'places' e envia apenas os favoritos
    final favoritedPlaces = places.where((p) => p.isFavorite).toList();

    Navigator.pushNamed(context, '/favorites', arguments: favoritedPlaces);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ETAPA 6 (Requisito R6): Título animado [cite: 159, 214-228]
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
      // ETAPA 2 (Requisito R4): Layout de scroll [cite: 157]
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mapeia a lista de dados para uma lista de Widgets
              ...places.map((place) {
                // Vamos criar um Card para cada 'place'
                return buildPlaceCard(context, place);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  // ETAPA 3: O Card (UI)
  // (R1) Requisito de navegação
  // (R4) Requisito de Layout [cite: 157]
  Widget buildPlaceCard(BuildContext context, Place place) {
    return GestureDetector(
      // (R3) GestureDetector será usado aqui [cite: 156]
      onTap: () {
        // ETAPA 2: Chama a nova função async
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
            // ETAPA 5: Imagem de Rede (R5) e Shimmer (R6)
            // Aqui você deve implementar o Shimmer [cite: 159, 199-210]
            // Por enquanto, vamos usar só a imagem:
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
                place.coverUrl, // (R5) Image.network [cite: 158]
                height: 200,
                fit: BoxFit.cover,
                // (Opcional) Adicione o 'loadingBuilder' ou o 'Shimmer' aqui
                // O Shimmer  deve ser o placeholder
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
                      // (R6) google_fonts [cite: 159]
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
