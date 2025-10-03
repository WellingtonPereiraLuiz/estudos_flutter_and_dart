import 'package:flutter/material.dart';
import 'package:imc/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController =
      TextEditingController(); // CRÍTICO: Altura adicionada
  String _resultadoIMC = "Informe seu peso e altura.";

  void _calcularImc() {
    final double? peso = double.tryParse(
      _pesoController.text.replaceAll(',', '.'),
    );
    final double? altura = double.tryParse(
      _alturaController.text.replaceAll(',', '.'),
    );

    if (peso == null || altura == null || altura <= 0) {
      setState(() {
        _resultadoIMC =
            "Erro: Por favor, insira valores numéricos válidos (Altura > 0).";
      });
      return; // Sai da função se houver erro
    }

    final double imc = peso / (altura * altura); // CRÍTICO: 'imc' definido

    setState(() {
      _resultadoIMC = "Seu IMC é: ${imc.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(("Calculadora de IMC"))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Calcule o seu IMC"),

              SizedBox(height: 20),

              TextField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  hintText: 'Ex: 70.5',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Altura (m)',
                  hintText: 'Ex: 1.75',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              ElevatedButton(onPressed: _calcularImc, child: Text("Calcule")),

              Text(
                _resultadoIMC,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 50),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text("Clique"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
