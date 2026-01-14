import 'dart:io';

void main() {
print("Digite a sua idade");
double idade = double.parse(stdin.readLineSync()!);

// Aqui vamos validar a idade do usuario com o If and Else
if (idade >= 18 && idade < 70) {
    print("Voce pode dirigir");
} else if (idade > 70) {
    print("esta velho dms para dirigir");
} else if ( idade < 18 && idade >= 0) {
    print("Esta muito novo para dirigir");
} else {
    print("Valor invalido");
}
}
