import 'package:pet_rescue/models/pet.dart'; // Importe seu modelo
import 'package:flutter/material.dart';
// Importe os pacotes que você vai usar
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PetDetailPage extends StatefulWidget {
  const PetDetailPage({super.key});

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  bool isInterested = false;
  bool showNetworkImage = true; 
  late final Pet pet;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pet = ModalRoute.of(context)!.settings.arguments as Pet;
  }
  void toggleInterest() {
    setState(() {
      isInterested = !isInterested;
    });
  }
  void toggleImage() {
    setState(() {
      showNetworkImage = !showNetworkImage;
    });
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('Não foi possível abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
        actions: [
          if (isInterested)
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.check_circle, color: Colors.cyan),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Toque na imagem para alternar',
              style: GoogleFonts.lato(color: Colors.grey.shade400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: toggleImage, 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),             
                child: showNetworkImage
                    ? Image.network(
                        pet.photoUrl,
                        height: 250,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        pet.localAssetAlt,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
              ),
            ),

            const SizedBox(height: 24),
            Text(
              pet.name,
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(
                  label: Text('Porte: ${pet.size}', style: GoogleFonts.lato()),
                ),
                Chip(label: Text(pet.temperament, style: GoogleFonts.lato())),
              ],
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isInterested
                    ? Colors.cyan
                    : Colors.grey.shade800,
              ),
              onPressed: toggleInterest, 
              child: Text(
                isInterested ? 'Interesse Registrado!' : 'Marcar Interesse',
                style: GoogleFonts.poppins(),
              ),
            ),

            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                _openLink(
                 'https://www.whatsapp.com/catalog/556993331616/?app_absent=0',  // Coloquei um ctt de qualquer
                );
              },
              child: Text('Falar com a ONG', style: GoogleFonts.poppins()),
            ),

            OutlinedButton(
              onPressed: () {
                _openLink('https://youtu.be/bec7adpiRQo?si=NLAzJiU1dBjpYjQE');  //  coloquei um video do youtube
              },
              child: Text(' vídeo institucional', style: GoogleFonts.poppins()),
            ),
          ],
        ),
      ),
    );
  }
}
