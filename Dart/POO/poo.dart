class Car {
  String modelo;
  int ano;
  // Construtor
  Car(this.ano, this.modelo);
}

void main() {
  Car carro1 = Car(1888, "pampa");
  print("Modelo: ${carro1.modelo} e do ano ${carro1.ano}");
}
