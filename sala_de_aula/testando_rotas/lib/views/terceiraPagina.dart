import 'package:flutter/material.dart';

class TerceiraPagina extends StatefulWidget {
  const TerceiraPagina({super.key});

  @override
  State<TerceiraPagina> createState() => _TerceiraPaginaState();
}

class _TerceiraPaginaState extends State<TerceiraPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terceira pagina"),
        backgroundColor: const Color.fromARGB(255, 35, 25, 122),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/primeiraPagina');
              },
              child: Text("Inicio."),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '/SegundaPagina');
              },
              child: Text("Voltar pagina."),
            ),
          ],
        ),
      ),
    );
  }
}
