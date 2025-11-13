import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contadorGlobal = 0;
  int numeroSorteado = 0;
  void atualizarcontador() {
    setState(() {
      contadorGlobal++;
    });
  }

  void sorteianumero() {
    setState(() {
      numeroSorteado = Random().nextInt(100);
      numeroSorteado++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meu App"), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Sorteador Numérico"),
            ElevatedButton(
              onPressed: () {
                atualizarcontador();
                sorteianumero();
              },
              child: Text("Sortear Novo Número"),
            ),
            Text("$contadorGlobal"),
            Text(
              "$numeroSorteado",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(numeroSorteado > 50 ? "Numero alto !" : "Numero baixo !"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  contadorGlobal = 0;
                  numeroSorteado = 0;
                });
              },
              child: Text("Resetar"),
            ),
          ],
        ),
      ),
    );
  }
}
