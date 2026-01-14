import 'dart:io';

void main() {
  print("Diogite um valor");
  double primeiroValor = double.parse(stdin.readLineSync()!);

  print("Digite outro valor");
  double segundoValor = double.parse(stdin.readLineSync()!);

  double soma = primeiroValor + segundoValor;

  print('O valor da soma é de: $soma');


  //  saida de dados



  print("Com a utilizacao do print, iremos ter a saida basica de dados no terminal");






  // Concatenação(Metodo Feio)
  String nome = "Wellington";
  int idade = 21;

  // Você sofre para ler e escrever isso:
  print("O aluno " + nome + " tem " + idade.toString() + " anos.");


  // Interpolação (Muito mais limpo)
  print("O aluno $nome tem $idade anos.");




}