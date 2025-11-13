import 'dart:io';

void main() {
  print("Diogite um valor");
  double primeiroValor = double.parse(stdin.readLineSync()!);

  print("Digite outro valor");
  double segundoValor = double.parse(stdin.readLineSync()!);

  double soma = primeiroValor + segundoValor;

  print('O valor da soma é de: $soma');
}
