import 'package:city_explorer/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityDetailPage extends StatefulWidget {
  const CityDetailPage({super.key});

  @override
  State<CityDetailPage> createState() => _CityDetailPageState();
}

class _CityDetailPageState extends State<CityDetailPage> {
  // ETAPA 8: Estado (R2)
  late bool isFavorite;
  int visitCount = 0;
  late final Place place;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ETAPA 7: Receber o argumento (R1)
    // Fazemos isso aqui para que 'place' esteja disponível para o initState (se precisasse)
    // e para inicializar nosso estado local
    place = ModalRoute.of(context)!.settings.arguments as Place;

    // ETAPA 8: Inicializa o estado local COM BASE no argumento
    isFavorite = place
        .isFavorite; // Assumindo que você adicionou 'bool favorite' ao seu modelo Place
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _incrementVisits() {
    setState(() {
      visitCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, isFavorite);
          },
          icon: const Icon(Icons.arrow_back),
        ),

        title: Text(place.title),
        actions: [
          // (R2) Botão de Favorito com setState
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: toggleFavorite, // Chama o setState
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagem de capa
            Image.network(place.coverUrl, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descrição',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    place.description,
                    style: GoogleFonts.lato(fontSize: 16),
                  ),
                  const SizedBox(height: 24),

                  // ETAPA 9: Contador (R2) e Detector de Gestos (R3)
                  Text(
                    'Visitas registradas: $visitCount',
                    style: GoogleFonts.lato(fontSize: 16),
                  ),
                  // (R3) GestureDetector para incrementar visitas [cite: 156]
                  GestureDetector(
                    onTap: _incrementVisits, // Chama o setState
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_location_alt_outlined),
                          SizedBox(width: 8),
                          Text('Toque aqui para registrar visita'),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  Text(
                    'Localização (Mapa Fictício)',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // (R5) Imagem de Asset [cite: 158]
                  Image.asset(
                    place.localAssetMap, // [cite: 171]
                    height: 200,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(height: 20),
                  // (R7) Botão de Ação [cite: '160]
                  ElevatedButton(
                    onPressed: () {
                      // DESAFIO: Implementar o url_launcher aqui [cite: 160, 230-236]
                      print('Botão de ação (url_launcher) pressionado!');
                    },
                    child: const Text('Abrir no Maps (Desafio)'),
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
