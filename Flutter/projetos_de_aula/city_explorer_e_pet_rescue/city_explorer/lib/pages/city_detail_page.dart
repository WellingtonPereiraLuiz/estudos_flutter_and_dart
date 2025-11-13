import 'package:city_explorer/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CityDetailPage extends StatefulWidget {
  const CityDetailPage({super.key});

  @override
  State<CityDetailPage> createState() => _CityDetailPageState();
}

class _CityDetailPageState extends State<CityDetailPage> {
  late bool isFavorite;
  int visitCount = 0;
  late final Place place;

  Future<void> _openMaps(String query) async {
    final Uri googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$query',
    );

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      print('Não foi possível abrir o Maps com a query: $query');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    place = ModalRoute.of(context)!.settings.arguments as Place;
    isFavorite = place.isFavorite; 
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
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: toggleFavorite, 
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [          
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
                  Text(
                    'Visitas registradas: $visitCount',
                    style: GoogleFonts.lato(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: _incrementVisits, 
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
                  Image.asset(
                    place.localAssetMap,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _openMaps(place.title + ', Ariquemes');
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
