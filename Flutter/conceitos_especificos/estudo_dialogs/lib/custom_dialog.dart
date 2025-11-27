import 'package:flutter/material.dart';

class CustomDialog extends Dialog {
  CustomDialog(String titulo, String descricao, context)
    : super(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: 300,
          height: 300,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text("$titulo"),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text("$descricao"),
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
          ),
        ),
      );
}
