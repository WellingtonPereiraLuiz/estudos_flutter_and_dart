import 'package:flutter/material.dart';

class PrimeiraPagina extends StatefulWidget {
  const PrimeiraPagina({super.key});

  @override
  State<PrimeiraPagina> createState() => _PrimeiraPaginaState();
}

class _PrimeiraPaginaState extends State<PrimeiraPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Página"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushReplacementNamed(context, '/segundaPagina');
            //   },
            //   child: Text('teste'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/segundaPagina');

  

                Navigator.pushNamed(context, '/segundaPagina');
              },
              child: Text("Proxima pagina."),
            ),
          ],
        ),
      ),
    );
  }
}
