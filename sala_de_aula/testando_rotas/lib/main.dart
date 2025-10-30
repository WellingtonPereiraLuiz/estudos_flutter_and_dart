import 'package:flutter/material.dart';
import '/routes/app_routes.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: AppRoutes.primeiraPagina,
      routes: AppRoutes().define(),
    ),
  );
}
