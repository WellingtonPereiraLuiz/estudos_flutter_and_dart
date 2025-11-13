import 'package:pet_rescue/models/pet.dart'; 
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class PetHomePage extends StatefulWidget {
  const PetHomePage({super.key});

  @override
  State<PetHomePage> createState() => _PetHomePageState();
}

class _PetHomePageState extends State<PetHomePage> {


  final List<Pet> pets = [
    Pet(
      name: 'Bolinha',
      photoUrl: 'https://th.bing.com/th/id/R.6a317d1e40ca0b0b1c7d6ce5929d8211?rik=fuoliXJvFe%2fwBw&riu=http%3a%2f%2fwww.crlmag.com%2fwp-content%2fuploads%2f2020%2f03%2fPets_AS_0320-e1583242951680.jpg&ehk=jH7gyU0K%2fPnVweUayY22MTYn5lyQd1AK%2fvO1BQo%2fh3o%3d&risl=&pid=ImgRaw&r=0',
      localAssetAlt: 'assets/images/pet_placeholder.png', 
      size: 'pequeno',
      temperament: 'Calmo',
    ),
    Pet(
      name: 'Rex',
      photoUrl: 'https://www.thesprucepets.com/thmb/VYDopMBfK6m_aCTAgiShehlZChE=/2048x0/filters:no_upscale():strip_icc()/Mini_rex_bunny-0bc79db3d2d54b53a9fc18e54e479883.jpeg', 
      localAssetAlt: 'assets/images/pet_placeholder.png',
      size: 'medio',
      temperament: 'Agitado',
    ),
    Pet(
      name: 'Trovão',
      photoUrl: 'https://tse2.mm.bing.net/th/id/OIP.-zcnJWAHUkrkxkMkOQG02QHaFj?cb=ucfimgc2&rs=1&pid=ImgDetMain&o=7&rm=3', 
      localAssetAlt: 'assets/images/pet_placeholder.png',
      size: 'grande',
      temperament: 'Protetor',
    ),
  ];

  String activeFilter = 'todos'; 
  List<Pet> get filteredPets {
    if (activeFilter == 'todos') {
      return pets; 
    }
    return pets.where((pet) => pet.size == activeFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Adote um Amigo',
              textStyle: GoogleFonts.lato(fontSize: 22),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          repeatForever: true,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: activeFilter == 'todos' ? Colors.cyan : Colors.grey.shade800,
                  ),
                  onPressed: () {
                    setState(() {
                      activeFilter = 'todos';
                    });
                  },
                  child: const Text('Todos'),
                ),
               
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: activeFilter == 'pequeno' ? Colors.cyan : Colors.grey.shade800,
                  ),
                  onPressed: () {
                    setState(() {
                      activeFilter = 'pequeno';
                    });
                  },
                  child: const Text('Pequeno'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: activeFilter == 'medio' ? Colors.cyan : Colors.grey.shade800,
                  ),
                  onPressed: () {
                    setState(() {
                      activeFilter = 'medio';
                    });
                  },
                  child: const Text('Médio'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: activeFilter == 'grande' ? Colors.cyan : Colors.grey.shade800,
                  ),
                  onPressed: () {
                    setState(() {
                      activeFilter = 'grande';
                    });
                  },
                  child: const Text('Grande'),
                ),
              ],
            ),
          ),

         
          Expanded( 
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              
              itemCount: filteredPets.length,
              itemBuilder: (context, index) {
                final pet = filteredPets[index];
                return Card(
                  child: ListTile(
                    title: Text(pet.name),
                    subtitle: Text('Porte: ${pet.size}, Temperamento: ${pet.temperament}'),                  
                    onTap: () {
                      Navigator.pushNamed(context, '/pet_detail', arguments: pet);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}