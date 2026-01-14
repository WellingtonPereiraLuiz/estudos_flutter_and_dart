import 'dart:io';

void main() {

  print("Escolhe um dia da semana");
  print("Segunda - 1 / domingo - 7");
  print("Escolha");

  int diaSemana = int.parse(stdin.readLineSync()!);

  switch (diaSemana) {
    case 1:
      print("Segunda");
    case 2:
      print("terca");
    case 3:
      print("quarta");
    case 4:
      print("quinta");
    default:
      print('Dia invalido');
  }



}