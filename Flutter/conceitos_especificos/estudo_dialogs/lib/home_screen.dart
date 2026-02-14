import 'package:estudo_dialogs/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TimeOfDay HourSelection = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina Inicial", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialog(
                      "Custom Dialog",
                      "Componente dialog",
                      context,
                    );
                  },
                );
              },
              child: Text("Custom Dialog"),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text("Simple Dialog"),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(32),
                          child: Text("Descricao do Simple Dialog"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.close),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Simple Dialog"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Alert Dialog'),
                      actions: [
                        Text("Informacoes sobre o alert Dialog"),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Confirmar"),
                        ),
                        ElevatedButton(onPressed: () {}, child: Text("Fechar")),
                      ],
                    );
                  },
                );
              },
              child: Text("Alert Dialog"),
            ),
            ElevatedButton(
              onPressed: () async {
                HourSelection = (await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ))!;
              },
              child: Text("Time Picker Dialog"),
            ),

            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                );
              },
              child: Text("Date Picker Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}
