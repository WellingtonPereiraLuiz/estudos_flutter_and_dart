import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('imagens/fundo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Text(
              "Que pokemon",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 31, 28, 206),
              ),
            ),
            Text(
              "é esse?",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 31, 28, 206),
              ),
            ),
            SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                  255,
                  31,
                  28,
                  206,
                ), // Cor de fundo
                foregroundColor: Colors.white, // Cor do texto
              ),
              child: Text("1/10    00:27   Gen.1   gen.2"),
            ),
            SizedBox(height: 15),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imagens/figura.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                  255,
                  31,
                  28,
                  206,
                ), // Cor de fundo
                foregroundColor: Colors.white, // Cor do texto
              ),
              child: Text("Dica"),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                  255,
                  31,
                  28,
                  206,
                ), // Cor de fundo
                foregroundColor: Colors.white, // Cor do texto
              ),
              child: Text("Digite o nome do pokemon"),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Pular")),
                ElevatedButton(onPressed: () {}, child: Text("Confirmar")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
