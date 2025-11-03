import 'package:city_explorer/models/place.dart';
import 'package:flutter/material.dart';
// Importe os pacotes que você VAI usar (R6) [cite: 159]
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CityHomePage extends StatefulWidget {
  const CityHomePage({super.key});

  @override
  State<CityHomePage> createState() => _CityHomePageState();
}

class _CityHomePageState extends State<CityHomePage> {
  // ETAPA 1: Nossos dados fictícios
  final List<Place> places = const [
    Place(
      title: 'Praça dos Pioneiros',
      description: 'O coração da cidade, ideal para passeios ao fim da tarde.',
      coverUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/01/a5/3d/praca-dos-pioneiros.jpg?w=1200&h=-1&s=1',
      localAssetMap: 'assets/images/mapa_pioneiros.png', // [cite: 171]
    ),
    Place(
      title: 'Parque Botânico',
      description: 'Uma grande área verde para contato com a natureza e trilhas.',
      coverUrl: 'https://www.ariquemes.ro.gov.br/portal/arquivos/38/imagens/16082022100827_parque_botanico_ariquemes_foto_pmacom.jpeg',
      localAssetMap: 'assets/images/mapa_botanico.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ETAPA 6 (Requisito R6): Título animado [cite: 159, 214-228]
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Descubra Ariquemes', // [cite: 151, 218]
              textStyle: GoogleFonts.lato(), // (R6) google_fonts [cite: 159]
              speed: const Duration(milliseconds: 100),
            ),
          ],
          repeatForever: true,
        ),
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
    return GestureDetector( // (R3) GestureDetector será usado aqui [cite: 156]
      onTap: () {
        // ETAPA 4: Navegação (R1)
        // Navega para a rota '/detail' e envia o 'place' como argumento [cite: 187-194]
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: place,
        );
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
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
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
                    style: GoogleFonts.poppins( // (R6) google_fonts [cite: 159]
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