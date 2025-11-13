import 'package:flutter/material.dart';
import '/views/primeiraPagina.dart';
import '/views/segundaPagina.dart';
import '/views/terceiraPagina.dart';

class AppRoutes{ 
  static const primeiraPagina = "/primeiraPagina";
  static const segundaPagina = "/segundaPagina";
  static const terceiraPagina = "/terceiraPagina";

  Map<String, WidgetBuilder> define() {
    return {
      primeiraPagina: (BuildContext context) => PrimeiraPagina(),
      segundaPagina: (BuildContext context) => SegundaPagina(),
      terceiraPagina: (BuildContext context) => TerceiraPagina(),
    };
  }

}