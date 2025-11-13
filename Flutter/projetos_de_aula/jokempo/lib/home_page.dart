import 'package:flutter/material.dart';
import 'dart:math';


class Jokempo_home extends StatefulWidget {
  const Jokempo_home({super.key});

  @override
  State<Jokempo_home> createState() => _Jokempo_homeState();
}

class _Jokempo_homeState extends State<Jokempo_home> {
  var randomNumber = 4;
  var escolhaJogador = 1;

  void ganhador() {
    late String resultado;
    numberRandomizer();

    if (escolhaJogador == randomNumber) {
      resultado = 'empate';
    } else if (escolhaJogador == 1 && randomNumber == 3 ||
        escolhaJogador == 2 && randomNumber == 1 ||
        escolhaJogador == 3 && randomNumber == 2) {
      resultado = 'voce perdeu';
    } else {
      resultado = 'voce ganhou';
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Voce $resultado")));
  }

  void numberRandomizer() {
    setState(() {
      randomNumber = Random().nextInt(3) + 1;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Pedra, Papel e Tesoura - APP',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Escolha da máquina'),
              CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('../imagens/$randomNumber.png'),
              ),
              Text('Escolha do jogador'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      escolhaJogador = 1;
                      ganhador();
                    },
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('../imagens/1.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      escolhaJogador = 2;
                      ganhador();
                    },
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('../imagens/2.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      escolhaJogador = 3;
                      ganhador();
                    },
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('../imagens/3.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
